set_context dft -scan
read_verilog opt.v
read_cell_library test_Nangate.mdt 
set_current_design mcrb
set_design_level top
analyze_control_signals -auto

#Run DRC
check_design_rules # Or can Use set_system_mode analysis does the same thing

set_scan_insertion_options -chain_count 5
analyze_scan_chains 
insert_test_logic -write_in_tsdb on 

report_scan_elements > ./output/mcrb_scan_elements.txt
report_scan_chains > ./output/mcrb_scan_chains.txt
report_scan_cells > ./output/mcrb_scan_cells.txt
report_scan_enable > ./output/mcrb_scan_enable.txt

write_design -output_file ./output/mcrb_tessent_scan_net.v -replace
set_system_mode setup
open_visualizer

#The insert_test_logic -write_in_tsdb on command creates the following:
    # 1.The scan stitched and inserted design.
    # 2.TCD file containing the Scan Configurations to be used during ATPG
