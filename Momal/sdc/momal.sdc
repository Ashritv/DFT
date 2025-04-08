#create_clock [get_ports tclk]       -name tclk   -period 5   -waveform {2 4}
create_clock [get_ports tck]   -name tck   -period 2   -waveform {0 1}
create_clock [get_ports in_cfclk]   -name in_cfclk   -period 2   -waveform {0 1}
create_clock [get_ports in_sclk]   -name in_sclk   -period 2   -waveform {0 1}
create_clock [get_ports in_rclk]   -name in_rclk   -period 2   -waveform {0 1}

set_input_delay 2 -clock [get_clocks tck] [get_ports * -filter "direction==in"]
set_input_delay 2 -clock [get_clocks in_cfclk] [get_ports * -filter "direction==in"]
set_input_delay 2 -clock [get_clocks in_sclk] [get_ports * -filter "direction==in"]
set_input_delay 2 -clock [get_clocks in_rclk] [get_ports * -filter "direction==in"]
#set_input_delay 0.4 -clock [get_clocks tclk] [get_ports tclk]
################################################################
## Assert functional mode
################################################################
set_case_analysis 1 [get_ports scan_enable]
set_case_analysis 1 [get_ports scan_mode]
################################################################
