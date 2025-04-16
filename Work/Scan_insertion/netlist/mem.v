module sram_sp_1024x16 (
    input clk,
    input cs,       // Chip select
    input we,       // Write enable
    input [9:0] addr,
    input [15:0] din,
    output reg [15:0] dout
);
    reg [15:0] mem [0:1023];
    
    always @(posedge clk) begin
        if (cs) begin
            if (we) mem[addr] <= din;
            dout <= mem[addr];
        end
    end
endmodule





