cmake_minimum_required(VERSION 3.19)

set(IC "nRF52840" CACHE STRING "IC")
set(PLATFORM "nrf52840_xxAA"  CACHE STRING "Platform")
set(SOFTDEVICE_TYPE "s140" CACHE STRING "SoftDevice type")
set(SOFTDEVICE_VERSION "7.2.0" CACHE STRING "SoftDevice version")

include("${nRF5_CMAKE_FILE_PATH}")
nRF5_setup()

project(blinky)

list(APPEND SOURCE_FILES
    "${CMAKE_CURRENT_SOURCE_DIR}/main.c"
)

list(APPEND INCLUDE_DIRS
    "${CMAKE_CURRENT_SOURCE_DIR}"
)

set(NRF5_LINKER_SCRIPT "${CMAKE_CURRENT_SOURCE_DIR}/gcc_nrf52")

nRF5_addExecutable(blinky
    "${SOURCE_FILES}" 
    "${INCLUDE_DIRS}" 
    "${NRF5_LINKER_SCRIPT}" 
    ".rtt"
)
