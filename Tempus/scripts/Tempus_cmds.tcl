read_lib ../lib/slow.lib
read_lib -lef ../lef/examp.lef
read_verilog ../netlist/examp.v
read_sdf ../sdf/examp.sdf

# means that only user-defined constraints will be considered for primary inputs, and no automatic assumptions will be made by the tool
set_global timing_apply_default_primary_input_assertion false .

# If any cells that are instantiated in design are undefined in the library it ignores that cell
set load_netlist_ignore_undefined_cell true 

set_top_module
read_spef ../spef/examp.spef
read_def ../def/examp.def or read_design -physical data  ---> #read_def should be only used after reading the lef file
read_sdc ../sdc/examp.sdc
set_global report_timing_format {hpin cell slew delay arrival}

#Setup check
report_timing -max_paths 10

#Hold check
report_timing -early -max_paths 10 

report_clock_timing -type summary > REPORTS/tempus_clock_summary.rpt
check_timing -check_only {clock_crossing} -verbose > REPORTS/tempus_clock_crossings.rpt
report_clocks -groups > REPORTS/tempus_report_clock_groups.rpt
report_constraint -all_violators > REPORTS/tempus_report_allViolators.rpt


# This above script is for non-MMMC and in MMMC you can analyze the design delay at worst-case, best-case, and different operational modes (such as performance and low-power). Each “corner” can have different timing libraries, constraints, and operating conditions.

#You use commands like [read_view_definition] to load definitions for various analysis views.
#Commands like [set_analysis_mode] allow you to switch between these environments.
#Through commands like [read_spef -rc_corner] and using specific libraries for early, late, and other corners, Tempus builds separate timing graphs for each condition.
S
