#3)Draw a schematic of the fanout cone of the flip-flop “f32_mux_1_data_reg_5_”. How many endpoints are there in this fanout cone? What types of endpoints are they?

foreach_in_collection j [all_fanout -from [get_pins f32_mux_1_data_reg_5_/Q] -endpoints_only] { puts [get_object_name $j] }
#output: f32_mux_1_data_reg_6_/S, o_rd_data[5]

#4)Take one of the endpoints of the fanout cone above and trace its entire fan-in cone.How many startpoints are in this fan-in cone? List all the startpoints, and indicate what type of startpoint they are. Are any startpoints input ports?

foreach_in_collection j [all_fanin -startpoints_only -to o_rd_data[5]] { puts [get_object_name $j] }
#Endpoint: o_rd_data[5]
#Fan_in output: n_write_reg/CK, f_ack_reg/CK, f_state_reg_0_/CK, f_state_reg_1_/CK, f_state_reg_2_/CK, f32_mux_1_data_reg_5_/CK, f32_mux_0_data_reg_5_/CK
#The startpoints are clk pin of flops
#NO startpoint is input port

#5) There is a three-bit input bus called `i_hb_sup”. Trace the fanout cone of bit [1] of this bus and list all endpoints. Submit a schematic of the fanout cone.

foreach_in_collection j [all_fanout -from  i_hb_sup -endpoints_only] { puts [get_object_name $j] }
#output: f32_mux_0_data_reg_2_/D, f32_mux_0_data_reg_1_/D, f32_mux_0_data_reg_0_/D

foreach_in_collection j [all_fanout -from  i_hb_sup[1] -endpoints_only] { puts [get_object_name $j] }
#output: f32_mux_0_data_reg_1_/D


#report the level 1 connections (i.e direct connection to port specified)
report_fanout -from clk -pin_level 3 or report_fanout -clock_tree 
Fanout Network for Port: clk
       -------------------------------------------------------------------------------------------------------  
        Source Pin             Sink Pin               Cell Type         Timing Sense      Arc        Case       
                                                                                          Disabled   Analysis   
       -------------------------------------------------------------------------------------------------------  
       clk                    f_state_reg_0_/CK      (net)             -                 -          -
       clk                    f_state_reg_1_/CK      (net)             -                 -          -
       clk                    f_state_reg_2_/CK      (net)             -                 -          -
       clk                    f_ack_reg/CK           (net)             -                 -          -
       clk                    n_write_reg/CK         (net)             -                 -          -
       clk                    f_err_ack_reg/CK       (net)             -                 -          -
       clk                    o_reg_read_reg/CK      (net)             -                 -          -
       clk                    u_survik/o_dbg_config_reg_0_/CK
                                                     (net)             -                 -          -
       clk                    u_survik/clk_gate_spare_config/CK
                                                     (net)             -                 -          -
       clk                    u_survik/clk_gate_config/CK
                                                     (net)             -                 -          -
       clk                    clk_gate_mux/CK        (net)             -                 -          -
       clk                    clk_gate_addr/CK       (net)             -                 -          -
       clk                    clk_gate_data/CK       (net)             -                 -          -
       -------------------------------------------------------------------------------------------------------
       u_survik/clk_gate_spare_config/CK
                              u_survik/clk_gate_spare_config/ECK
                                                     TLATNTSCAX12      positive_unate    -          -
       u_survik/clk_gate_config/CK
                              u_survik/clk_gate_config/ECK
                                                     TLATNTSCAX12      positive_unate    -          -
       clk_gate_mux/CK        clk_gate_mux/ECK       TLATNTSCAX12      positive_unate    -          -
       clk_gate_addr/CK       clk_gate_addr/ECK      TLATNTSCAX12      positive_unate    -          -
       clk_gate_data/CK       clk_gate_data/ECK      TLATNTSCAX12      positive_unate    -          -
       -------------------------------------------------------------------------------------------------------
       u_survik/clk_gate_spare_config/ECK
                              u_survik/o_spare_config_reg_31_/CK
                                                     (net)             -                 -          -
       u_survik/clk_gate_spare_config/ECK
                              u_survik/o_spare_config_reg_30_/CK
                                                     (net)             -                 -          -
       u_survik/clk_gate_spare_config/ECK
                              u_survik/o_spare_config_reg_29_/CK
                                                     (net)             -                 -          -
       u_survik/clk_gate_spare_config/ECK
                              u_survik/o_spare_config_reg_28_/CK
                                                     (net)             -                 -          -
       u_survik/clk_gate_spare_config/ECK
                              u_survik/o_spare_config_reg_27_/CK
                                                     (net)             -                 -          -
       u_survik/clk_gate_spare_config/ECK
                              u_survik/o_spare_config_reg_26_/CK
                                                     (net)             -                 -          -
       u_survik/clk_gate_spare_config/ECK
                              u_survik/o_spare_config_reg_25_/CK
                                                     (net)             -                 -          -
       u_survik/clk_gate_spare_config/ECK
                              u_survik/o_spare_config_reg_24_/CK
                                                     (net)             -                 -          -
       u_survik/clk_gate_spare_config/ECK
                              u_survik/o_spare_config_reg_23_/CK
                                                     (net)             -                 -          -
       u_survik/clk_gate_spare_config/ECK
                              u_survik/o_spare_config_reg_22_/CK
                                                     (net)             -   






#report fanin

report_fanin -to n_write_reg/CK

Fanin Network for Pin: n_write_reg/CK
       -------------------------------------------------------------------------------------------------------  
        Source Pin             Sink Pin               Cell Type         Timing Sense      Arc        Case       
                                                                                          Disabled   Analysis   
       -------------------------------------------------------------------------------------------------------  
       clk                    n_write_reg/CK         (net)             -                 -          -
       -------------------------------------------------------------------------------------------------------

