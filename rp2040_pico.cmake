# ----------------------------------------------------------------------------
# Definitions suitable for a generic RP2040-Pico device
#
# Author: Bernhard Bablok
#
# website: https://github.com/bablokb/pico-esp-programmer
#
# SPDX-License-Identifier: MIT
# ----------------------------------------------------------------------------

message(">>> loading pin configuration for RP2040_Pico")

set(TX_PIN "0" CACHE STRING "Pico TX GPIO pin-number" FORCE)
set(RX_PIN "1" CACHE STRING "Pico RX GPIO pin-number" FORCE)
set(RST_PIN "16" CACHE 
      STRING "Pico GPIO pin-number connected to ESP reset pin" FORCE)
set(BOOT_PIN "9" CACHE
      STRING "Pico GPIO pin-number connected to ESP bootstrap pin" FORCE)
set(HW_UART "uart0" CACHE STRING "hardware UART to use (uart0|uart1)" FORCE)
