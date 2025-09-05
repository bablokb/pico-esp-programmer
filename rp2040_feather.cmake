# ----------------------------------------------------------------------------
# Definitions suitable for a RP2040-Feather device
#
# Author: Bernhard Bablok
#
# website: https://github.com/bablokb/pico-esp-programmer
#
# SPDX-License-Identifier: MIT
# ----------------------------------------------------------------------------

message(">>> loading pin configuration for RP2040_Feather")

set(TX_PIN "0" CACHE STRING "Pico TX GPIO pin-number" FORCE)
set(RX_PIN "1" CACHE STRING "Pico RX GPIO pin-number" FORCE)
set(RST_PIN "12" CACHE 
      STRING "Pico GPIO pin-number connected to ESP reset pin" FORCE)
set(BOOT_PIN "10" CACHE
      STRING "Pico GPIO pin-number connected to ESP bootstrap pin" FORCE)
set(HW_UART "uart0" CACHE STRING "hardware UART to use (uart0|uart1)" FORCE)
set(LED_PIN "13" CACHE STRING "Pico GPIO pin-number connected to LED" FORCE)
