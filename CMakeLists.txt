cmake_minimum_required(VERSION 3.19)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

set(TOOLCHAIN_PREFIX "$ENV{ARM_NONE_EABI_FOLDER}" CACHE PATH "Path to folder containing the Arm embedded compiler")
set(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_SOURCE_DIR}/cmake/arm-none-eabi.cmake" CACHE FILEPATH "File to set toolchain parameters")
set(NRF5_TARGET "nrf52840_xxaa" CACHE STRING "Target chip to compile for")
set(NRF5_SDK_CONTAINER_PATH "${CMAKE_CURRENT_SOURCE_DIR}/nrf-sdk" CACHE PATH "Path to folder containing the NRF SDKs")
set(NRF5_SDK_PATH "" CACHE PATH "Path to folder containing the NRF SDK")
set(NRF5_SOFTDEVICE_VARIANT "s340" CACHE STRING "Softdevice version to use")

include(utils)
find_first_folder_in_directory(${NRF5_SDK_CONTAINER_PATH} NRF5_SDK_PATH)

project(cmake_nrf)

include_directories(boards)
add_compile_definitions(
    "-DBOARD_CUSTOM"
    "-DBOARD_SEEED_XIAO_SENSE"
    "-DUSE_APP_CONFIG"
)

include(nrf5)

add_subdirectory(src)