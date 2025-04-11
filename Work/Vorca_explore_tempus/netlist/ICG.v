module ICGX1(CLK, EN, ENCLK, test_se);
  input CLK, EN, test_se;
  output ENCLK;
  wire CLK, EN, test_se;
  wire ENCLK;
  wire UNCONNECTED, lat, n_0;
  AND2XL g15__2398(.A (CLK), .B (lat), .Y (ENCLK));
  TLATNXL lat_reg(.GN (CLK), .D (n_0), .Q (lat), .QN (UNCONNECTED));
  OR2X1 g17__5107(.A (test_se), .B (EN), .Y (n_0));
endmodule
