
target_sources(${discon_oc3_lib_name}
    PRIVATE
    "DISCON_OC3Hywind.F90"
)
set_target_properties(${discon_oc3_lib_name}
    PROPERTIES
    PREFIX ""
    # SUFFIX ".dll"
)
