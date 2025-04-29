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
//       Created on: Mon Apr 28 10:58:55 IST 2025
//--------------------------------------------------------------------------

     
module memlibc_memory_bist_assembly_rtl_tessent_mux2 (
  input wire a,
  input wire b,
  input wire s,
  output wire y
);
 
assign y = (s) ? b : a;
    
endmodule
  
