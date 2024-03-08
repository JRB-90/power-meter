cmake_minimum_required(VERSION 3.19)

project(blinky)

set(NRF5_LINKER_SCRIPT "${CMAKE_CURRENT_SOURCE_DIR}/gcc_nrf52.ld" CACHE FILEPATH "Linker script file. If not specified, a generic script for a selected target will be used.")
set(NRF5_SDKCONFIG_PATH "${CMAKE_CURRENT_SOURCE_DIR}/sdk_config.h" CACHE PATH "Path to the sdk_config.h file. If not specified, a generic sdk_config.h for a selected target file will be used.")

add_executable(blinky
    main.c
)

target_link_libraries(blinky PRIVATE
    nrf5_boards
    nrf5_delay
)

nrf5_target(blinky)
