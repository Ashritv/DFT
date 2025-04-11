set gn [all_registers -latches -clock_pins ]
set full [all_fanout -from clk ] 
set reg_gn [all_fanout -from clk -endpoints_only ]
set icg_pin [remove_from_collection $full $reg_gn ]
set level1 [all_fanout -from clk -pin_levels 1]
set inter [remove_from_collection $level1 $icg_pin ]
foreach_in_collection b [remove_from_collection $inter $gn] { puts [get_object_name $b] } 

