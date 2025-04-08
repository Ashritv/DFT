# 1) Instances count of memories in netlist
	#  sram_sp_32768d_33w_16m_8b - 6 -->(lm_mem_1 to 6)
	#  sram_sp_16384d_36w_16m_8b - 4 -->(U_edlm_mem_1 to 4) 
	#   rf_2p_136d_74w_1m_4b - 4 
	#   rf_2p_256d_76w_1m_4b - 4
	#   rf_2p_512d_76w_2m_4b - 4
	#   sram_sp_512d_32w_4m_2b - 2

	#  Total instance count = 24  

#2) List of Memory Configurations (type of memories) that have been instantiated

	#There are 6 types of memory configuration or types as listed above in 1)

#3)count of flipflops in the netlist
  	sizeof_collection [all_registers -flops]
	#output : 61161

#4)Total number of instances in the netlist
	sizeof_collection [get_cells -hierarchial]
	#output : 308179   

#5)List of all clocks in netlist and their sources
	foreach_in_collection p [get_clocks] {
+ puts [get_object_name $p]
+ }

report_clocks

REFCLK0
SWCLK
MCUCLK
LIFE_CLK
JTAG_CLK
JTAG_CLK_C2C
DBG_CLK
MII_TXCLK
MII_RXCLK
SPI_CLK_IN
HPC_CLK_VIR
GPIO_CLK_VIR
SWCLK_DIV2
SWCLK_DIV4
CPU_CLK
APB_CLK
SPI_CLK
RMII_CLK
MII_CLK
RTC_ECLK
FUSE_CLK
EEP_TCLK
EEP_PCLK
DSP_PCLK
	
