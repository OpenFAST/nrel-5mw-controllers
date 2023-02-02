
cmake_minimum_required (VERSION 3.20 FATAL_ERROR)
project(nrel-5mw-controllers Fortran)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
include(set_flags)

# set the build type option
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Choose the build type: Debug Release" FORCE)
endif()

# set the build flags
if (${CMAKE_Fortran_COMPILER_ID} STREQUAL "GNU")
    set_gfortran()
elseif(${CMAKE_Fortran_COMPILER_ID} STREQUAL "Intel")
    set_ifort()
endif()
set(CMAKE_SHARE_LINKER_FLAGS "-shared")

if(APPLE OR UNIX)
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -DIMPLICIT_DLLEXPORT")
endif()

# supress the mac runtime path warnings
if(APPLE)
    set(CMAKE_MACOSX_RPATH 1)
endif()

# Create target names
set(discon_lib_name "DISCON")
set(discon_iti_lib_name "DISCON_ITIBarge")
set(discon_oc3_lib_name "DISCON_OC3Hywind")

add_library(${discon_lib_name} SHARED)
add_library(${discon_iti_lib_name} SHARED)
add_library(${discon_oc3_lib_name} SHARED)

add_subdirectory(DISCON)
add_subdirectory(DISCON_ITI)
add_subdirectory(DISCON_OC3)

# # if this project is built standlone
# if (${CMAKE_CURRENT_LIST_DIR} STREQUAL ${CMAKE_SOURCE_DIR})
#     set(INSTALL_DEST "${CMAKE_SOURCE_DIR}/..")
# # otherwise
# else()
#     set(INSTALL_DEST "${CMAKE_BINARY_DIR}/reg_tests/glue-codes/openfast/5MW_Baseline/ServoData")
# endif()

# install(
#     TARGETS
#     DISCON DESTINATION ${INSTALL_DEST}
# )

