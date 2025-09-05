# ----------------------------------------------------------------------------
# Top-level configuration file.
#
# You can override settings in a local configuration and pass this to
# cmake using -DLOCAL_CONFIG=myconfig.cmake
#
# Author: Bernhard Bablok (and others)
#
# website: https://github.com/bablokb/pico-esp-programmer
#
# SPDX-License-Identifier: MIT
# ----------------------------------------------------------------------------

cmake_minimum_required(VERSION 3.13)

# --- defaults   -------------------------------------------------------------

set(TX_PIN "16" CACHE STRING "Pico TX GPIO pin-number")
set(RX_PIN "17" CACHE STRING "Pico RX GPIO pin-number")
set(RST_PIN "28" CACHE STRING "Pico GPIO pin-number connected to ESP reset pin")
set(BOOT_PIN "14" CACHE STRING "Pico GPIO pin-number connected to ESP bootstrap pin")
set(LED_PIN "25" CACHE STRING "Pico GPIO pin-number connected to LED")
set(HW_UART "uart0" CACHE STRING "hardware UART to use (uart0|uart1)")

# --- local overrides   -------------------------------------------------------

if(LOCAL_CONFIG)
message(">>> including: ${LOCAL_CONFIG}")
include(${LOCAL_CONFIG})
endif()

# --- project definition and standard includes   ------------------------------

include(pico_sdk_import.cmake)

project(esp_programmer C CXX ASM)
pico_sdk_init()

add_compile_definitions(TX_PIN=${TX_PIN})
add_compile_definitions(RX_PIN=${RX_PIN})
add_compile_definitions(RST_PIN=${RST_PIN})
add_compile_definitions(BOOT_PIN=${BOOT_PIN})
add_compile_definitions(LED_PIN=${LED_PIN})
add_compile_definitions(HW_UART=${HW_UART})

add_executable(
  esp_programmer esp_programmer.c
)
target_link_libraries(esp_programmer pico_stdlib)

# create map/bin/hex file etc.
pico_add_extra_outputs(esp_programmer)

# run from RAM
pico_set_binary_type(esp_programmer copy_to_ram)

# enable usb output, disable uart output
pico_enable_stdio_usb(esp_programmer 1)
pico_enable_stdio_uart(esp_programmer 0)
