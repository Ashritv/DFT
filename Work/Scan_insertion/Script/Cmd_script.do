

# 1. Invoke Tessent in “legacy” scan insertion mode -- Update legacy mode is not available it was removed in 2020
% tessent -shell
SETUP> set_context dft -scan 
# This turns off hierarchical scan insertion, so you control everything manually 

# 2. Read in your design and libraries
SETUP> read_verilog    <path_to_netlist>.v
SETUP> read_cell_library <path_to_tcelllib1>.tcelllib <path_to_tcelllib2>.tcelllib
SETUP> set_current_design <design_name>
SETUP> set_design_level {top chip physical_block sub_block}
SETUP> analyze_control_signals -auto

# 3. Declare your clock domains
SETUP> add_clock 0 <clk1_name>
SETUP> add_clock 0 <clk2_name>
…  
# Defines which signals drive your flops

# 4. Exclude any flops you do not want in scan
SETUP> add_nonscan_instances -INStances instance_spec | -Modules module_spec

# 5. Explicitly include the flops you do want scanned, Forces these instances into your scan chains
SETUP> add_scan_instances -INStances instance_spec | -Modules module_spec

# 6. (Optional) Create custom chain‑families for grouping, Lets you control allocation of a subset of flops into dedicated chains
SETUP> create_scan_chain_family data_chains -include_elements [get_scan_elements -filter "datatype==data"] 

# 7. (Optional) If you already have existing scan chains to preserve, Tells Tessent about pre‑existing chains so it won’t re‑stitch them 
SETUP> add_scan_groups   grp1 grp1.testproc
SETUP> add_scan_chains   chain1 grp1 sc_in1 sc_out1
SETUP> add_scan_chains   chain2 grp1 sc_in2 sc_out2

# 8. Switch to analysis (runs scannability DRC), Checks that your included/excluded instances and clocks form valid scan candidates
SETUP> set_system_mode analysis 

# 9. Identify and report scan elements
ANALYSIS> analyze_scan_chains
ANALYSIS> report_scan_elements        > scan_elements.rpt
ANALYSIS> report_scan_chains          > scan_chains.rpt

# 10. Stitch in the scan logic, Inserts the SE/SI/SO ports and connects them; writes out the TCD for ATPG 
INSERTION> delete_connections skew_addr_cntr_reg[1]/SI
{}
INSERTION> create_connections skew_addr_cntr_reg[4]/Q skew_addr_cntr_reg[1]/SI
INSERTION> write_design -output_file scan_net.v 

# 10. Stitch in the scan logic, Inserts the SE/SI/SO ports and connects them; writes out the TCD for ATPG 
ANALYSIS> insert_test_logic -write_in_tsdb On

# 11. Review final chain configuration
INSERTION> report_scan_chains

# 12. Write out your scan‑inserted netlist
INSERTION> write_design -output <scan_inserted_netlist>.v

