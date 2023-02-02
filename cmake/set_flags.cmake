
# Customizations for GNU Fortran compiler
macro(set_gfortran)
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -ffree-line-length-none -fdefault-real-8 -C")

    # debug flags
    if(CMAKE_BUILD_TYPE MATCHES Debug)
        set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG} -fcheck=all -pedantic -fbacktrace" )
    endif()
endmacro(set_gfortran)

# Customizations for Intel Fortran Compiler
macro(set_ifort)
    if(WIN32)
        set_ifort_windows()
    else()
        set_ifort_posix()
    endif()
endmacro(set_ifort)

# Customizations for Intel Fortran Compiler on posix systems
macro(set_ifort_posix)
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -fpp -real-size 64")

    # debug flags
    if(CMAKE_BUILD_TYPE MATCHES Debug)
        set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG} -g -check all -traceback" )
    endif()
endmacro(set_ifort_posix)

# Customizations for Intel Fortran Compiler on Windows systems
macro(set_ifort_windows)
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} /Qm64 /fpp /real-size:64 /libs:static")

    # debug flags
    if(CMAKE_BUILD_TYPE MATCHES Debug)
        set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG} /Z7 /check:all /traceback" )
    endif()
endmacro(set_ifort_windows)
