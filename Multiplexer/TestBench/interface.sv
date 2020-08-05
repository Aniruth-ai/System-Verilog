interface rtl_intf(input logic clk, reset);
  
  logic [3:0] in0;
  logic [3:0] in1;
  logic [3:0] in2;
  logic [3:0] in3;  
  logic [1:0] sel_input;
  
  logic [3:0] mux_output;   
  
endinterface
