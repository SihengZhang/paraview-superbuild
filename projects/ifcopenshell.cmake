# Build IfcOpenShell

superbuild_add_project(ifcopenshell
  DEPENDS_ORDERED
    boost
    eigen
    occt
  SPDX_LICENSE_IDENTIFIER
    LGPL-3.0-or-later
  Spdx_COPYRIGHT_TEXT
    # From https://docs.ifcopenshell.org/introduction.html
    "Copyright (c) 2011-2025 IfcOpenShell Contributors"
  SOURCE_SUBDIR
    cmake
  CMAKE_ARGS
    -DCMAKE_INSTALL_RPATH:PATH=$ORIGIN/../lib
    -DBUILD_IFCPYTHON=OFF
    -DCOLLADA_SUPPORT=OFF
    -DBUILD_GEOMSERVER=OFF
    -DWITH_CGAL=OFF
    -DHDF5_SUPPORT=OFF
    -DIFCXML_SUPPORT=OFF
    -DWITH_OPENCASCADE=ON
    -DBUILD_EXAMPLES=OFF
    -DBUILD_SHARED_LIBS=ON
    -DBUILD_CONVERT=OFF
    -DGLTF_SUPPORT=OFF
    -DBoost_DIR=<INSTALL_DIR>/lib/cmake/Boost-1.83.0
    -DEigen3_DIR=<INSTALL_DIR>/share/eigen3/cmake
    -DOpenCASCADE_DIR=<INSTALL_DIR>/lib/cmake/opencascade
)

superbuild_apply_patch(ifcopenshell install-geomlibraryapi
  "install ifc_geomlibrary_api.h")
