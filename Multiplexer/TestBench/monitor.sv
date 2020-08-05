class monitor;
  
  virtual rtl_intf vif;
  
  mailbox mon2chk;
  
  int trans_count = 0;
  
  function new(virtual rtl_intf vif, mailbox mon2chk);
    this.vif = vif;
    this.mon2chk = mon2chk;
  endfunction
  
  task main();
    
    forever begin
      
      transaction trans;
      
      trans = new();
      
      $display("[MONITOR] TRANSACTION NO = %0d",trans_count);
      
      @(posedge vif.clk);
      
      trans.in0 = vif.in0;
      trans.in1 = vif.in1;
      trans.in2 = vif.in2;
      trans.in3 = vif.in3;
      trans.sel_input = vif.sel_input;
      
      trans.mux_output = vif.mux_output;      
      
      @(posedge vif.clk);
      
      mon2chk.put(trans);
      
      trans.display("[Monitor]");
      
      trans_count++;

    end
    
  endtask

endclass
