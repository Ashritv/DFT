# 1) Instances count of memories in netlist

set sram_i[sizeof_collection [get_cells -of_objects sram_sp_*]]
set rf_i [sizeof_collection [get_cells -of_objects rf_2p_*]]
puts "Total mem cells = [expr {$sram_i + $rf_i}]"

	#  sram_sp_32768d_33w_16m_8b - 6  -->(lm_mem_1 to 6)
	#  sram_sp_16384d_36w_16m_8b - 4  -->(U_edlm_mem_1 to 4) 
	#   rf_2p_136d_74w_1m_4b - 8  -->(U_pcie_sw_2pram160x82_inst_0_ to 3)
	#   rf_2p_256d_76w_1m_4b - 4  -->(tx_buf_x16_x8_x4_U_pcie_ip_tx_buf_0_ to 3)
	#   rf_2p_512d_76w_2m_4b - 4  -->(rx_buf_x16_x16_U_pcie_ip_rx_buf_0_ to 3)
	#   sram_sp_512d_32w_4m_2b - 2  -->(U_mem)

	#  Total instance count = 28  

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

report_clocks -generated


      --------------------------------------------------------------------------------------------------  
                                                 Clock Descriptions                                             
      --------------------------------------------------------------------------------------------------  
      --------------------------------------------------------------------------------------------------  
        Clock Name                Source        
      --------------------------------------------------------------------------------------------------  
        APB_CLK              U_cpu_sys_top/U_pcie_sw_clkrst_gen/U_apb_clkdivby2_reg/U_clk_dff/Q                       
        CPU_CLK              U_pcie_sw_clkrst_gen/U_CLK_BUF_00/Y                       
        DBG_CLK              io_in_bus[36]        
        DSP_PCLK             U_emep_top/i_emep_top_clk_rst_gen/i_ds_port_pl_clk_prog_div/i_pcie_sw_clk_dff/U_clk_dff/Q                       
        EEP_PCLK             U_emep_top/i_emep_top_clk_rst_gen/i_ep_core_pl_clk_prog_div/i_pcie_sw_clk_dff/U_clk_dff/Q                       
        EEP_TCLK             U_emep_top/i_emep_top_clk_rst_gen/i_ep_core_tl_clk_prog_div/i_pcie_sw_clk_dff/U_clk_dff/Q                       
        FUSE_CLK             U_cpu_sys_top/U_pcie_sw_clkrst_gen/U_CLK_BUF_04/Y                       
        GPIO_CLK_VIR                 -                         
        HPC_CLK_VIR                 -                           
        JTAG_CLK             io_in_bus[28]                   
        JTAG_CLK_C2C         ext_die_jtag_tck_i                 
        LIFE_CLK             pll0_cmu_life_clk                 
        MCUCLK              pll0_cmu_ck_aux                  
        MII_CLK              U_cpu_sys_top/U_pcie_sw_clkrst_gen/U_mii_clkdivby2_reg/U_clk_dff/Q                       
        MII_RXCLK             io_in_bus[22]                  
        MII_TXCLK             io_in_bus[21]                  
        REFCLK0              pll0_cmu_ck_ref            
        RMII_CLK             U_cpu_sys_top/U_pcie_sw_clkrst_gen/U_rmii_clkdivby2_reg/U_clk_dff/Q                       
        RTC_ECLK             U_cpu_sys_top/U_pcie_sw_clkrst_gen/U_rtc_eclkdivby2_reg/U_clk_dff/Q                       
        SPI_CLK              U_cpu_sys_top/U_pcie_sw_clkrst_gen/U_spi_clkdivby2_reg/U_clk_dff/Q                       
        SPI_CLK_IN            io_in_bus[65]                 
        SWCLK               pll0_cmu_ck_soc                  
        SWCLK_DIV2            U_cpu_sys_top/U_pcie_sw_clkrst_gen/U_sw_clkdivby2_0_reg/U_clk_dff/Q                       
        SWCLK_DIV4            U_cpu_sys_top/U_pcie_sw_clkrst_gen/U_sw_clkdivby2_1_reg/U_clk_dff/Q                       
      -------------------------------------------------------------------------------------------------- 



