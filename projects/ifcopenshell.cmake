# Build IfcOpenShell

superbuild_add_project(ifcopenshell
  DEPENDS_ORDERED
    boost
    eigen
    occt
  LICENSE_FILES
    COPYING.LESSER
  SPDX_LICENSE_IDENTIFIER
    LGPL-3.0-or-later
  SPDX_COPYRIGHT_TEXT
    # From https://docs.ifcopenshell.org/introduction.html
    "Copyright (c) 2011-2025 IfcOpenShell Contributors"
  SOURCE_SUBDIR
    cmake
  CMAKE_ARGS
    -DBUILD_SHARED_LIBS:BOOL=${BUILD_SHARED_LIBS}
    -DCMAKE_INSTALL_RPATH:PATH=$ORIGIN/../lib
    -DINSTALL_LIB_DIR:STRING=lib
    -DCMAKE_INSTALL_NAME_DIR:PATH=<INSTALL_DIR>/lib
    -DBUILD_IFCPYTHON:BOOL=OFF
    -DCOLLADA_SUPPORT:BOOL=OFF
    -DBUILD_GEOMSERVER:BOOL=OFF
    -DWITH_CGAL:BOOL=OFF
    -DHDF5_SUPPORT:BOOL=OFF
    -DIFCXML_SUPPORT:BOOL=OFF
    -DWITH_OPENCASCADE:BOOL=${occt_enabled}
    -DBUILD_EXAMPLES:BOOL=OFF
    -DBUILD_CONVERT:BOOL=OFF
    -DGLTF_SUPPORT:BOOL=OFF
)

# https://github.com/IfcOpenShell/IfcOpenShell/issues/7561
superbuild_apply_patch(ifcopenshell install-geomlibraryapi
  "install ifc_geomlibrary_api.h")

superbuild_apply_patch(ifcopenshell boost-options
  "set Boost_USE_STATIC_LIBS depending on BUILD_SHARED_LIBS")
