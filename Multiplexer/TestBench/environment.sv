`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  
  /* generator, driver, monitor, checker instances */
  generator gen;
  driver drive;
  monitor mon;
  scoreboard check;
  
  /* mailbox's handle */
  mailbox gen2driv;
  mailbox mon2chk;
  
  /* virtual interface */
  virtual rtl_intf vif;
  
  /* event instance */
  event ended;
  
  function new(virtual rtl_intf vif);
    
    this.vif = vif;
    
    gen2driv = new();
    mon2chk = new();
    
    gen = new(gen2driv, ended);
    drive = new(vif, gen2driv);
    mon = new(vif, mon2chk);
    check = new(mon2chk);
    
  endfunction
  
  task pre_test();
    
    drive.reset();
    
  endtask
  
  task test();
    
    fork
      
      gen.main();
      drive.main();
      mon.main();
      check.main();
      
    join_any
    
  endtask
  
  task post_test();
    wait(gen.ended.triggered);
    wait(gen.count == drive.repeat_count);
    wait(gen.count == check.transactions);    
  endtask
    
  task run();
    pre_test();
    test();
    post_test();
    $finish;
  endtask  
  
endclass
