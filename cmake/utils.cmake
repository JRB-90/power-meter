function(list_directories search_directory found_directories)
  file(GLOB
    found_files
    RELATIVE
    ${search_directory}
    ${search_directory}/*
  )

  foreach(child ${found_files})
    if(IS_DIRECTORY ${search_directory}/${child})
      list(APPEND dir_list ${child})
    endif()
  endforeach()
    
  set(${found_directories} ${dir_list} PARENT_SCOPE)
endfunction()

function(find_first_folder_in_directory search_directory found_folder)
  set(dir_list "")
  list_directories(${search_directory} dir_list)
  set(result "")
  list(GET dir_list 0 result)
  set(${found_folder} "${search_directory}/${result}" PARENT_SCOPE)
endfunction()
