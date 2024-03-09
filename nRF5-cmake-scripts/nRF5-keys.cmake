find_program(NRFUTIL nrfutil)
if(NOT NRFUTIL)
    message(FATAL_ERROR "nrfutil executable not found, please install it and add it to the PATH")
endif()

set(KEY_DIR "${CMAKE_CURRENT_SOURCE_DIR}/keys")
set(PRIVATE_KEY "${KEY_DIR}/dfu_private.key")
set(PUBLIC_KEY "${KEY_DIR}/dfu_public_key.c")

if(NOT EXISTS "${PRIVATE_KEY}" OR NOT EXISTS "${PUBLIC_KEY}")
    message("Private/public key not found, generating new ones")

    file(MAKE_DIRECTORY ${KEY_DIR})
    
    execute_process(
        COMMAND ${NRFUTIL} keys generate "${PRIVATE_KEY}"
        RESULT_VARIABLE GEN_RES
    )

    execute_process(
        COMMAND ${NRFUTIL} keys display --key pk --format code "${PRIVATE_KEY}" --out_file "${PUBLIC_KEY}"
        RESULT_VARIABLE DIS_RES
    )

    if(NOT EXISTS "${PRIVATE_KEY}" OR NOT EXISTS "${PUBLIC_KEY}")
        message(FATAL_ERROR "Failed to generate keys")
    endif()
else()
    message("Keys found")
endif()