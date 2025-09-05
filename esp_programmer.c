// SPDX-FileCopyrightText: 2018 Arduino SA 
//
// SPDX-License-Identifier: LGPL-2.1-or-later
/*
  RP2040-SerialESPPassthrough - Used for flashing ESP32 module
  with the Raspberry Pi RP2040.

  Copyright (c) 2018 Arduino SA. All rights reserved.

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.
  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/
#include <stdio.h>
#include "pico/stdlib.h"
#include "hardware/uart.h"

#define BAUD_RATE 115200

void blink(int n) {
  for (int i=0; i<n; ++i) {
    gpio_put(LED_PIN, 1);
    sleep_ms(200);
    gpio_put(LED_PIN, 0);
    if (i<n-1) {
      sleep_ms(200);
    }
  }
}

int main() {
  // init stdio_usb
  stdio_usb_init();
  stdio_set_translate_crlf(&stdio_usb, false);

  // init UART
  uart_init(HW_UART, BAUD_RATE);
  gpio_set_function(TX_PIN, GPIO_FUNC_UART);
  gpio_set_function(RX_PIN, GPIO_FUNC_UART);
  sleep_ms(100);

  // init LED and blink three times
  gpio_init(LED_PIN);
  gpio_set_dir(LED_PIN, GPIO_OUT);
  blink(3);

  // init ESP32 module
  gpio_init(RST_PIN);
  gpio_set_dir(RST_PIN, GPIO_OUT);
  gpio_init(BOOT_PIN);
  gpio_set_dir(BOOT_PIN, GPIO_OUT);

  // manually put the ESP32 in upload mode
  gpio_put(BOOT_PIN, 0);
  gpio_put(RST_PIN, 0);
  sleep_ms(100);
  gpio_put(RST_PIN, 1);
  sleep_ms(500);

  // turn LED on to signal ready
  blink(3);
  gpio_put(LED_PIN, 1);

  while (true) {
    // read from USB
    int c = getchar_timeout_us(0);
    if (c != PICO_ERROR_TIMEOUT) {
      // write to UART
      uart_putc(HW_UART, c);
    }

    // check if data is in UART RX buffer
    if (uart_is_readable(HW_UART)) {
      // read from UART
      char ch = uart_getc(HW_UART);
      // write to USB
      printf("%c", ch);
    }
  }
  return 0;
}
