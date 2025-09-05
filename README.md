Pico ESP32xx-Programmmer
========================

This is an implementation of an ESP32xx-programmer using the Pico as a
base system. It is a modification of the serial-passthrough code from
Adafruit from [here](https://github.com/adafruit/Adafruit_Learning_System_Guides/blob/e7cb14556b8106ea59832b20540bc226400e51fb/Adafruit_ESP32_Arduino_Demos/SerialESPPassthrough/serial_passthru_rp2040/serial_passthrough.c).

This project mainly changes the build-system:

  - fixed the `CMakeLists.txt`-file so it will find the Pico-SDK
  - moved all definitions to the `CMakeLists.txt` file
  - allow to override defaults from a user-supplied cmake-file


Build
-----

Either set the environment-variable `PICO_SDK_PATH` or set the
variable `PICO_SDK_FETCH_FROM_GIT`. Then run:

    cmake -B build -DLOCAL_CONFIG=myconfig.cmake -S .
    make -C build

Without `-DLOCAL_CONFIG=myconfig.cmake` the build uses the defaults
from `CMakeLists.txt`. For an example configuration-file, see e.g.
`pim-wireless-pack.cmake`. The configuration-file mainly sets the
HW-uart and the pins to use.

Add `-DPICO_PLATFORM=rp2350-arm-s` to the cmake-command if you are
building for a RP2350 board (or add the definition to the local
config-file).


Usage
-----

Flash the uf2-file from the `build`-directory to your Pico. Attach the
ESP32xx as defined by your configuration (can be done before flashing).

Once the Pico-program runs, it puts the ESP32xx into download mode by
pulling the ESP32xx bootstrap-pin low while toggling the ESP32xx
reset-button. The Pico-LED flashes a few times and then it will turn
full-on to signal ready.

The Pico will create a serial interface, e.g. `/dev/ttyACM0` on Linux.
Use your favorite flashing tool to upload the new firmware to the
Espressif-device. E.g.

    esptool.py --chip auto -p /dev/ttyACM0 --baud 115200 \
               --before no_reset write_flash 0x0 myfirmware.bin

**Important**: don't skip the `--before no_reset` option! If using
a GUI, make sure to set the correct options.


Additional Notes
----------------

The files `rp2040_pico.cmake` and `rp2040_feather.cmake`
reproduce the pin-configurations of the original code. These configs
are supplied as is and were not tested.


License
-------

The original source-code (serial_passthrough.c) is licensed unter the LGPL.
The file has been renamed to esp_programmer.c but retaines the copyright
and license.

Additions from this project are licensed under a MIT-license.
