class transaction;
  
  rand bit [3:0] in0;
  rand bit [3:0] in1;
  rand bit [3:0] in2;
  rand bit [3:0] in3;
  
  bit [3:0] mux_output;
  
  rand bit [1:0] sel_input;
  
  function void display(string name);
    
    $display("-------------------------");
    $display("- %s [Time = %0dns]",name, $time);
    $display("-------------------------");    
    
    $display("=======> in0 = %0h, in1 = %0h, in2 = %0h, in3 = %0h",in0, in1, in2, in3);
    $display("=======> sel = %0h, MUX_OUTPUT = %0h",sel_input, mux_output);
    $display("-------------------------"); 

  endfunction
  
  /*//deep copy method
  function transaction do_copy();
    transaction trans;
    trans = new();
    trans.in0  = this.in0;
    trans.in1 = this.in1;
    trans.in2 = this.in2;
    trans.in3 = this.in3;
    trans.sel_input = this.sel_input;
    return trans;
  endfunction */  
  
  //Sample Constraint
  //constraint in0_constraint {in0 inside{[4'h8: 4'hf]};}
  
    
  
endclass