cmake_minimum_required(VERSION 3.19)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/nRF5-cmake-scripts)

set(CMAKE_TOOLCHAIN_FILE "${CMAKE_SOURCE_DIR}/nRF5-cmake-scripts/nRF5-cmake-toolchain.cmake" CACHE FILEPATH "Toolchain setup file for GNU Arm Embedded compiler")
set(nRF5_CMAKE_PATH "${CMAKE_CURRENT_LIST_DIR}/nRF5-cmake-scripts" CACHE FILEPATH "")
set(nRF5_CMAKE_FILE_PATH "${nRF5_CMAKE_PATH}/nRF5-cmake.cmake" CACHE FILEPATH "")
set(nRF5_SDK_VERSION "nRF5_SDK_17.1.0_ddde560" CACHE STRING "nRF5 SDK")
set(nRF5_MESH_SDK_VERSION "500" CACHE STRING "nRF5 Mesh SDK version")

# set(IC "nRF52840" CACHE STRING "IC")
# set(PLATFORM "nrf52840_xxAA"  CACHE STRING "Platform")
# set(SOFTDEVICE_TYPE "s140" CACHE STRING "SoftDevice type")
# set(SOFTDEVICE_VERSION "7.2.0" CACHE STRING "SoftDevice version")

project(power-meter C ASM)

include_directories(boards)
add_compile_definitions(
    "-DBOARD_CUSTOM"
    "-DBOARD_SEEED_XIAO_SENSE"
    "-DUSE_APP_CONFIG"
)

if(NOT TARGET download)
    add_subdirectory("src")
endif()