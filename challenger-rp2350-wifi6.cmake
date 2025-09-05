# ----------------------------------------------------------------------------
# Definitions suitable for iLabs Challenger RP2350+Wifi6
#
# Author: Bernhard Bablok
#
# website: https://github.com/bablokb/pico-esp-programmer
#
# SPDX-License-Identifier: MIT
# ----------------------------------------------------------------------------

message(">>> loading pin configuration for iLabs Challenger RP2350+Wifi6")

set(PICO_PLATFORM "rp2350-arm-s" CACHE STRING "Pico platform" FORCE)

set(TX_PIN "4" CACHE STRING "Pico TX GPIO pin-number" FORCE)
set(RX_PIN "5" CACHE STRING "Pico RX GPIO pin-number" FORCE)
set(RST_PIN "15" CACHE 
      STRING "Pico GPIO pin-number connected to ESP reset pin" FORCE)
set(BOOT_PIN "14" CACHE
      STRING "Pico GPIO pin-number connected to ESP bootstrap pin" FORCE)
set(HW_UART "uart1" CACHE STRING "hardware UART to use (uart0|uart1)" FORCE)
set(LED_PIN "7" CACHE STRING "Pico GPIO pin-number connected to LED" FORCE)
