#######################################################
#                                                     
#  Tempus Timing Signoff Solution Command Logging File                     
#  Created on Wed Apr  9 09:54:13 2025                
#                                                     
#######################################################

#@(#)CDS: Tempus Timing Signoff Solution v20.20-p001_1 (64bit) 12/02/2020 16:07 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: NanoRoute 20.20-p001_1 NR200917-0125/MT (database version 18.20.530) {superthreading v2.11}
#@(#)CDS: AAE 20.20-p005 (64bit) 12/02/2020 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: CTE 20.20-p010_1 () Dec  2 2020 14:35:30 ( )
#@(#)CDS: SYNTECH 20.20-p001_1 () Nov 24 2020 02:28:20 ( )
#@(#)CDS: CPE v20.20-p009

read_lib ../lib/slow.lib
read_verilog ../netlist/vorca1.v
read_lib -lef ../lef/NangateOpenCellLibrary.lef
set_top_module
read_sdc ../sdc/vorc_sdc.sdc
report_clocks
selectObject Module u_survik
deselectObject Module u_survik
selectObject Module u_survik
deselectObject Module u_survik
selectInst f32_mux_1_data_reg_0_
ui::getColorByName red
deselectInst f32_mux_1_data_reg_0_
selectObject Net clk
ui::getColorByName blue
deselectObject Net clk
selectObject Module u_survik
deselectObject Module u_survik
selectObject Module u_survik
ui::getColorByName blue
deselectObject Module u_survik
selectObject Module u_survik
exit
