# SZ3Reader ParaView Plugin
# Reader for .sz3 compressed files with multi-version SZ3 support

set(sz3reader_rpath_config)
if(UNIX AND NOT APPLE)
  set(sz3reader_rpath_config "-DCMAKE_INSTALL_RPATH:STRING=$ORIGIN")
endif()

superbuild_add_project(sz3reader
  DEPENDS paraview cxx17
  DEPENDS_OPTIONAL zstd
  CMAKE_ARGS
    -DBUILD_SHARED_LIBS:BOOL=${BUILD_SHARED_LIBS}
    -DCMAKE_INSTALL_LIBDIR:PATH=lib
    -DCMAKE_INSTALL_NAME_DIR:PATH=<INSTALL_DIR>/lib
    ${sz3reader_rpath_config}
)
