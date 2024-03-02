include(nrf-utils)

set(NRF5_SDK_CONTAINER_PATH "${CMAKE_CURRENT_SOURCE_DIR}/nrf-sdk" CACHE PATH "Path to folder containing the NRF SDKs")
set(NRF5_SDK_PATH "" CACHE PATH "Path to folder containing the NRF SDK")
find_first_folder_in_directory(${NRF5_SDK_CONTAINER_PATH} NRF5_SDK_PATH)

if(NOT NRF5_SDK_PATH)
  message(FATAL_ERROR "Path to the nRF5 SDK not provided. Please set NRF5_SDK_PATH cache variable.")
endif()

set(NRF5_SDK_VERSION "" CACHE STRING "nRF5 SDK version, e.g.: 15.3.0")
nrf5_get_sdk_version(${NRF5_SDK_PATH} local_sdk_version)

if(NOT NRF5_SDK_VERSION)
  message(STATUS "nRF SDK version not explicitly provided, using deduced one: ${local_sdk_version}")
  set(NRF5_SDK_VERSION ${local_sdk_version})
else()
  message(STATUS "nRF SDK version ${local_sdk_version} overwritten by ${NRF5_SDK_VERSION}")
endif()
nrf5_validate_sdk_version(${NRF5_SDK_VERSION})