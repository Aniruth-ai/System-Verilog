`include "interface.sv"
`include "test.sv"

module TB_top;
  
  bit clk;
  bit reset;
  
  always #5 clk = ~clk;
  
  initial begin
    reset = 1;
    #5 reset =0;
  end  
  
  rtl_intf i_intf(clk, reset);
  
  test t1(i_intf);
  
  mux DUT(.clk(i_intf.clk)
          .reset(i_intf.reset),
          .in0(i_intf.in0),
          .in1(i_intf.in1),
          .in2(i_intf.in2),
          .in3(i_intf.in3),
          .sel(i_intf.sel_input),
          .out(i_intf.mux_output));
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
  
endmodule
