superbuild_add_project(anari
  DEPENDS
    cxx17
    # currently anari unconditionally needs Python
    # even if Python wrapping is disabled.
    python3
  LICENSE_FILES
    LICENSE
  SPDX_LICENSE_IDENTIFIER
    Apache-2.0
  SPDX_COPYRIGHT_TEXT
    "Copyright (c) The Khronos Group"
  CMAKE_ARGS
    -DBUILD_CTS:BOOL=OFF
    -DBUILD_EXAMPLES:BOOL=OFF
    -DBUILD_HELIDE_DEVICE:BOOL=ON
    -DBUILD_DEBUG_DEVICE:BOOL=OFF
    -DBUILD_SINK_DEVICE:BOOL=OFF
    -DBUILD_SHARED_LIBS:BOOL=ON
    -DBUILD_TESTING:BOOL=OFF
    -DBUILD_VIEWER:BOOL=OFF
    -DCMAKE_INSTALL_LIBDIR:STRING=lib
    -DCMAKE_INSTALL_NAME_DIR:PATH=<INSTALL_DIR>/lib
)
