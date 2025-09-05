# ----------------------------------------------------------------------------
# Definitions suitable for Pimoroni Pico Wireless Pack
#
# Author: Bernhard Bablok
#
# website: https://github.com/bablokb/pico-esp-programmer
#
# SPDX-License-Identifier: MIT
# ----------------------------------------------------------------------------

message(">>> loading pin configuration for Pimoroni Pico Wireless Pack")

set(TX_PIN "8" CACHE STRING "Pico TX GPIO pin-number" FORCE)
set(RX_PIN "9" CACHE STRING "Pico RX GPIO pin-number" FORCE)
set(RST_PIN "11" CACHE 
      STRING "Pico GPIO pin-number connected to ESP reset pin" FORCE)
set(BOOT_PIN "2" CACHE
      STRING "Pico GPIO pin-number connected to ESP bootstrap pin" FORCE)
set(HW_UART "uart1" CACHE STRING "hardware UART to use (uart0|uart1)" FORCE)
