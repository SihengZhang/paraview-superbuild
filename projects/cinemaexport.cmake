set(use_embree3 OFF)
if (embree_SOURCE_SELECTION STREQUAL "2.7.1")
  # embree_SOURCE_SELECTION actually contains the version of ospray selected.
  # ospray 2.7.1 uses embree version 3.13.1
  set(use_embree3 ON)
endif ()

superbuild_add_project(cinemaexport
  LICENSE_FILES
    license.md
  SPDX_LICENSE_IDENTIFIER
    "BSD-3-Clause-LANL-USGov"
  SPDX_COPYRIGHT_TEXT
    Copyright (c) 2024, Triad National Security, LLC
  DEPENDS paraview embree
  DEPENDS_OPTIONAL openmp
  CMAKE_ARGS
    -DBUILD_SHARED_LIBS:BOOL=${BUILD_SHARED_LIBS}
    -DCMAKE_INSTALL_LIBDIR:PATH=lib
    -DCMAKE_INSTALL_RPATH:STRING=<INSTALL_DIR>/lib
    -DUSE_EMBREE3:BOOL=${use_embree3}
  )

# https://github.com/cinemascience/cinema-paraview-plugin/pull/7
superbuild_apply_patch(cinemaexport iostream
  "Fix iostream `using` bits")
