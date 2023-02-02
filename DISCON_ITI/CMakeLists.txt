
target_sources(${discon_iti_lib_name}
    PRIVATE
    "DISCON_ITIBarge.F90"
)
set_target_properties(${discon_iti_lib_name}
    PROPERTIES
    PREFIX ""
    # SUFFIX ".dll"
)
