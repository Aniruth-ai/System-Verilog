class transaction;
  
  rand bit [3:0] in0;
  rand bit [3:0] in1;
  rand bit [3:0] in2;
  rand bit [3:0] in3;
  rand bit [1:0] sel_input;
  
  bit [3:0] mux_output;

  function void display(string name);
    
    $display("-------------------------");
    $display("- %s [Time = %0dns]",name, $time);
    $display("-------------------------");    
    
    $display("=======> in0 = %0h, in1 = %0h, in2 = %0h, in3 = %0h",in0, in1, in2, in3);
    $display("=======> sel = %0h, MUX_OUTPUT = %0h",sel_input, mux_output);
    $display("-------------------------"); 

  endfunction

endclass
