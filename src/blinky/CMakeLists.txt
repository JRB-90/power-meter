cmake_minimum_required(VERSION 3.19)

set(IC "nRF52840" CACHE STRING "IC")
set(PLATFORM "nrf52840_xxAA"  CACHE STRING "Platform")
set(SOFTDEVICE_TYPE "s140" CACHE STRING "SoftDevice type")
set(SOFTDEVICE_VERSION "7.2.0" CACHE STRING "SoftDevice version")
set(VERSION_STRING "0.1.0")
set(BOOTLOADER_VERSION 1)
set(DFU_VERSION_STRING "${VERSION_STRING}")

include("${nRF5_CMAKE_FILE_PATH}")
nRF5_setup()

project(blinky)

nRF5_addAppScheduler()
nRF5_addAppFIFO()
nRF5_addAppTimer()
nRF5_addAppUART()
nRF5_addAppButton()
nRF5_addPowerMgmt()
nRF5_addStrError()
nRF5_addAtomic()
nRF5_addMemobj()
nRF5_addBSP(FALSE FALSE FALSE)

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

target_compile_definitions(blinky PRIVATE
    USE_APP_CONFIG
)

set(bootloader_vars "")
nRF5_addSecureBootloader(blinky
    "${PUBLIC_KEY}"
    "${bootloader_vars}"
)

nRF5_addBootloaderSoftDeviceAppMergeTarget(blinky
${DFU_VERSION_STRING}
    ${PRIVATE_KEY} 
    FALSE
    NO_VALIDATION
    NO_VALIDATION
    ${BOOTLOADER_VERSION}
)

nRF5_addFullFlashTarget(blinky_bl_sd_app_merge 
    "${CMAKE_CURRENT_BINARY_DIR}/blinky_bl_sd_app.hex"
)