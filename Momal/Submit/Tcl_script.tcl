# Define output files
set report_file "/home/01fe21bec241/DFT/Momal/runs/runs_tem/scanChain.rpt"
set output_file "Scan_in_ports.txt"

# Function to prepare output file
proc prepare_output {output_file} {
    if {[file exists $output_file]} {
        file delete $output_file
    }
    return [open $output_file w]
}

# Function to extract scan chain information
proc extract_scan_chain_info {report_file output_file} {
    set fin [open $report_file r]
    set current_chain ""

    while {[gets $fin line] >= 0} {
        # Match lines indicating a new scan chain
        if {[regexp {^\[(\d+)\]\s+scan info\s+:\s+\S+} $line -> chain_idx]} {
            set current_chain $chain_idx
            continue
        }

        # Match lines indicating the start of a scan chain
        if {$current_chain ne "" && [regexp {^\s*START:\s+(\S+)/\S+} $line -> ff_inst]} {
            # Extract library cell name
            set cell_type [get_object_name [get_lib_cells -of_objects $ff_inst]]

            # Find the driver of the SI pin
            set si_pin   "${ff_inst}/SI"
            set drivers  [all_fanin -startpoints_only -to $si_pin]
            set source   [get_object_name [lindex $drivers 0]]

            # Write out scan chain information
            puts $output_file "<$current_chain> <$ff_inst> <$cell_type> <$source>"

            # Reset current chain to avoid processing multiple STARTs per chain
            set current_chain ""
        }
    }
    close $fin
}

# Main execution
set fout [prepare_output $output_file]
extract_scan_chain_info $report_file $fout
close $fout

puts "✓ scan_in_ports.txt written."

