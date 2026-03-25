if (WIN32)
  set(dir "bin")
else ()
  set(dir "lib")
endif ()

file(GLOB files "${source_dir}/lib/*")
file(INSTALL ${files}
  DESTINATION "${install_dir}/${dir}")
