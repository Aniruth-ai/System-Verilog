class driver;
  
  virtual rtl_intf vif;
  
  mailbox gen2driv;
  
  int repeat_count;
  
  function new(virtual rtl_intf vif, mailbox gen2driv);    
    this.vif = vif;
    this.gen2driv = gen2driv;    
  endfunction
  
  task reset();
    wait(vif.reset);
    $display("[Driver] - Reset Started");
    vif.in0 <= 0;
    vif.in1 <= 0;
    vif.in2 <= 0;
    vif.in3 <= 0;
    vif.sel_input <= 2'b00;
    wait(!vif.reset);
    $display("[Driver] - Reset Ended");    
  endtask
  
  task main();
    
    forever begin
         
      transaction trans;

      gen2driv.get(trans);
      
      $display("[DRIVER] TRANSACTION NO = %0d",repeat_count);
      
      vif.in0 <= trans.in0;
      vif.in1 <= trans.in1;
      vif.in2 <= trans.in2;
      vif.in3 <= trans.in3;
      vif.sel_input <= trans.sel_input;      

      @(posedge vif.clk);
      
      trans.mux_output = vif.mux_output;
      
      trans.display("[Driver]");
      
      repeat_count++;      
      
    end
    
  endtask  
  
endclass
