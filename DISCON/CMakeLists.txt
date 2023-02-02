
target_sources(${discon_lib_name}
    PRIVATE
    "DISCON.F90"
)
set_target_properties(${discon_lib_name}
    PROPERTIES
    PREFIX ""
    # SUFFIX ".dll"
)
