cmake_minimum_required(VERSION 3.19)

set(TOOLCHAIN_PREFIX "$ENV{ARM_NONE_EABI_FOLDER}" CACHE PATH "Path to folder containing the Arm embedded compiler")
set(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_SOURCE_DIR}/cmake/toolchain-arm-none-eabi.cmake" CACHE FILEPATH "File to set toolchain parameters")

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/config")

project(cmake_nrf)
include("nrf")