//--------------------------------------------------------------------------
//
//  Unpublished work. Copyright 2022 Siemens
//
//  This material contains trade secrets or otherwise confidential 
//  information owned by Siemens Industry Software Inc. or its affiliates 
//  (collectively, SISW), or its licensors. Access to and use of this 
//  information is strictly limited as set forth in the Customer's 
//  applicable agreements with SISW.
//
//--------------------------------------------------------------------------
//  File created by: Tessent Shell
//          Version: 2022.4
//       Created on: Mon Apr 28 12:25:25 IST 2025
//--------------------------------------------------------------------------


module memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_assembly(LV_TM, 
                                                                             MEM_BYPASS_EN, 
                                                                             SCAN_SHIFT_EN, 
                                                                             MCP_BOUNDING_EN, 
                                                                             BIST_ON, 
                                                                             BIST_DONE, 
                                                                             BIST_GO, 
                                                                             clk_BIST_CLK, 
                                                                             m1_inst_A, 
                                                                             m1_inst_WEB, 
                                                                             m1_inst_OEB, 
                                                                             m1_inst_CSB, 
                                                                             m1_inst_I, 
                                                                             m1_inst_O, 
                                                                             reset, 
                                                                             ijtag_select, 
                                                                             si, 
                                                                             capture_en, 
                                                                             shift_en, 
                                                                             update_en, 
                                                                             tck, 
                                                                             so);
  input  [11:0] m1_inst_A;
  input  [5:0] m1_inst_I;
  input  LV_TM, MEM_BYPASS_EN, SCAN_SHIFT_EN, MCP_BOUNDING_EN, clk_BIST_CLK, 
         m1_inst_WEB, m1_inst_OEB, m1_inst_CSB, reset, ijtag_select, si, 
         capture_en, shift_en, update_en, tck;
  output [5:0] m1_inst_O;
  output BIST_ON, BIST_DONE, BIST_GO, so;

  wire [11:0] m1_interface_instance_A;
  wire [5:0] BIST_COL_ADD, BIST_ROW_ADD, m1_interface_instance_I;
  wire [2:1] BIST_SETUP_ts1;
  wire [1:0] BIST_WRITE_DATA, BIST_EXPECT_DATA;
  wire [0:0] toBist, bistEn;
  wire BIST_HOLD, BIST_SETUP, BIST_SELECT_TEST_DATA, to_controllers_tck, 
       mcp_bounding_to_en, scan_to_en, memory_bypass_to_en, ltest_to_en, 
       BIST_ALGO_MODE0, BIST_ALGO_MODE1, ENABLE_MEM_RESET, 
       REDUCED_ADDRESS_COUNT, BIST_ASYNC_RESET, MEM0_BIST_COLLAR_SI, BIST_SO, 
       MBISTPG_SO, BIST_GO_ts1, BIST_DIAG_EN, BIST_COLLAR_DIAG_EN, 
       FL_CNT_MODE0, FL_CNT_MODE1, BIST_WRITEENABLE, BIST_OUTPUTENABLE, 
       BIST_SELECT, BIST_CMP, INCLUDE_MEM_RESULTS_REG, BIST_COLLAR_EN0, 
       BIST_RUN_TO_COLLAR0, to_interfaces_tck, BIST_TESTDATA_SELECT_TO_COLLAR, 
       BIST_SHIFT_COLLAR, BIST_COLLAR_SETUP, BIST_CLEAR_DEFAULT, BIST_CLEAR, 
       BIST_COLLAR_HOLD, FREEZE_STOP_ERROR, ERROR_CNT_ZERO, 
       MBISTPG_RESET_REG_SETUP2, WEB, CSB;

  SPRAM_4096x6 m1_inst(
      .CE(clk_BIST_CLK), .WEB(WEB), .OEB(m1_inst_OEB), .CSB(CSB), .A(m1_interface_instance_A), 
      .I(m1_interface_instance_I), .O(m1_inst_O)
  );
  memlibc_memory_bist_assembly_rtl_tessent_mbist_bap memlibc_memory_bist_assembly_rtl_tessent_mbist_bap_inst(
      .reset(reset), .ijtag_select(ijtag_select), .si(si), .capture_en(capture_en), 
      .shift_en(shift_en), .shift_en_R(), .update_en(update_en), .tck(tck), .to_interfaces_tck(to_interfaces_tck), 
      .to_controllers_tck(to_controllers_tck), .mcp_bounding_en(MCP_BOUNDING_EN), 
      .mcp_bounding_to_en(mcp_bounding_to_en), .scan_en(SCAN_SHIFT_EN), .scan_to_en(scan_to_en), 
      .memory_bypass_en(MEM_BYPASS_EN), .memory_bypass_to_en(memory_bypass_to_en), 
      .ltest_en(LV_TM), .ltest_to_en(ltest_to_en), .BIST_HOLD(BIST_HOLD), .ENABLE_MEM_RESET(ENABLE_MEM_RESET), 
      .REDUCED_ADDRESS_COUNT(REDUCED_ADDRESS_COUNT), .BIST_SELECT_TEST_DATA(BIST_SELECT_TEST_DATA), 
      .BIST_ALGO_MODE0(BIST_ALGO_MODE0), .BIST_ALGO_MODE1(BIST_ALGO_MODE1), .BIST_DIAG_EN(BIST_DIAG_EN), 
      .BIST_ASYNC_RESET(BIST_ASYNC_RESET), .FL_CNT_MODE0(FL_CNT_MODE0), .FL_CNT_MODE1(FL_CNT_MODE1), 
      .INCLUDE_MEM_RESULTS_REG(INCLUDE_MEM_RESULTS_REG), .CHAIN_BYPASS_EN(), .TCK_MODE(), 
      .BIST_SETUP({BIST_SETUP_ts1[2:1], BIST_SETUP}), .MBISTPG_GO(BIST_GO), .MBISTPG_DONE(BIST_DONE), 
      .bistEn(bistEn), .toBist(toBist), .fromBist(MBISTPG_SO), .so(so)
  );
  memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_controller_inst(
      .MBISTPG_ALGO_MODE({BIST_ALGO_MODE1, BIST_ALGO_MODE0}), .MBISTPG_MEM_RST(ENABLE_MEM_RESET), 
      .MBISTPG_REDUCED_ADDR_CNT_EN(REDUCED_ADDRESS_COUNT), .MEM_BYPASS_EN(memory_bypass_to_en), 
      .MCP_BOUNDING_EN(mcp_bounding_to_en), .MEM0_BIST_COLLAR_SO(BIST_SO), .FL_CNT_MODE({
      FL_CNT_MODE1, FL_CNT_MODE0}), .BIST_COLLAR_GO(BIST_GO_ts1), .MBISTPG_DIAG_EN(BIST_DIAG_EN), 
      .BIST_CLK(clk_BIST_CLK), .BIST_SI(toBist), .BIST_HOLD(BIST_HOLD), .BIST_SETUP2(BIST_SETUP_ts1[2]), 
      .BIST_SETUP({BIST_SETUP_ts1[1], BIST_SETUP}), .MBISTPG_TESTDATA_SELECT(BIST_SELECT_TEST_DATA), 
      .TCK(to_controllers_tck), .MBISTPG_EN(bistEn), .MBISTPG_ASYNC_RESETN(BIST_ASYNC_RESET), 
      .LV_TM(ltest_to_en), .MBISTPG_RESET_REG_SETUP2(MBISTPG_RESET_REG_SETUP2), 
      .BIST_COL_ADD(BIST_COL_ADD), .BIST_ROW_ADD(BIST_ROW_ADD), .BIST_WRITE_DATA(BIST_WRITE_DATA), 
      .BIST_EXPECT_DATA(BIST_EXPECT_DATA), .BIST_SHIFT_COLLAR(BIST_SHIFT_COLLAR), 
      .BIST_TESTDATA_SELECT_TO_COLLAR(BIST_TESTDATA_SELECT_TO_COLLAR), .MEM0_BIST_COLLAR_SI(MEM0_BIST_COLLAR_SI), 
      .BIST_COLLAR_SETUP(BIST_COLLAR_SETUP), .BIST_COLLAR_HOLD(BIST_COLLAR_HOLD), 
      .FREEZE_STOP_ERROR(FREEZE_STOP_ERROR), .ERROR_CNT_ZERO(ERROR_CNT_ZERO), .BIST_COLLAR_DIAG_EN(BIST_COLLAR_DIAG_EN), 
      .BIST_CLEAR_DEFAULT(BIST_CLEAR_DEFAULT), .BIST_CLEAR(BIST_CLEAR), .MBISTPG_SO(MBISTPG_SO), 
      .BIST_WRITEENABLE(BIST_WRITEENABLE), .BIST_OUTPUTENABLE(BIST_OUTPUTENABLE), 
      .BIST_SELECT(BIST_SELECT), .BIST_CMP(BIST_CMP), .BIST_COLLAR_EN0(BIST_COLLAR_EN0), 
      .BIST_RUN_TO_COLLAR0(BIST_RUN_TO_COLLAR0), .MBISTPG_GO(BIST_GO), .MBISTPG_DONE(BIST_DONE), 
      .BIST_ON_TO_COLLAR(BIST_ON)
  );
  memlibc_memory_bist_assembly_rtl_tessent_mbist_c1_interface_m1 m1_interface_instance(
      .WEB_IN(m1_inst_WEB), .CSB_IN(m1_inst_CSB), .A_IN(m1_inst_A[11:0]), .I_IN(m1_inst_I[5:0]), 
      .O(m1_inst_O), .TCK(to_interfaces_tck), .BIST_CMP(BIST_CMP), .INCLUDE_MEM_RESULTS_REG(INCLUDE_MEM_RESULTS_REG), 
      .BIST_WRITEENABLE(BIST_WRITEENABLE), .BIST_OUTPUTENABLE(BIST_OUTPUTENABLE), 
      .BIST_SELECT(BIST_SELECT), .BIST_COL_ADD(BIST_COL_ADD), .BIST_ROW_ADD(BIST_ROW_ADD), 
      .BIST_WRITE_DATA(BIST_WRITE_DATA), .BIST_TESTDATA_SELECT_TO_COLLAR(BIST_TESTDATA_SELECT_TO_COLLAR), 
      .MEM_BYPASS_EN(memory_bypass_to_en), .SCAN_SHIFT_EN(scan_to_en), .MCP_BOUNDING_EN(mcp_bounding_to_en), 
      .BIST_ON(BIST_ON), .BIST_RUN(BIST_RUN_TO_COLLAR0), .BIST_ASYNC_RESETN(BIST_ASYNC_RESET), 
      .BIST_CLK(clk_BIST_CLK), .BIST_SHIFT_COLLAR(BIST_SHIFT_COLLAR), .BIST_EXPECT_DATA(BIST_EXPECT_DATA), 
      .BIST_SI(MEM0_BIST_COLLAR_SI), .BIST_COLLAR_SETUP(BIST_COLLAR_SETUP), .BIST_COLLAR_HOLD(BIST_COLLAR_HOLD), 
      .BIST_DIAG_EN(BIST_COLLAR_DIAG_EN), .BIST_CLEAR_DEFAULT(BIST_CLEAR_DEFAULT), 
      .BIST_CLEAR(BIST_CLEAR), .BIST_SETUP0(BIST_SETUP), .LV_TM(ltest_to_en), .FREEZE_STOP_ERROR(FREEZE_STOP_ERROR), 
      .BIST_COLLAR_EN(BIST_COLLAR_EN0), .RESET_REG_SETUP2(MBISTPG_RESET_REG_SETUP2), 
      .ERROR_CNT_ZERO(ERROR_CNT_ZERO), .WEB(WEB), .CSB(CSB), .A(m1_interface_instance_A), 
      .I(m1_interface_instance_I), .SCAN_OBS_FLOPS(), .BIST_SO(BIST_SO), .BIST_GO(BIST_GO_ts1)
  );
endmodule

