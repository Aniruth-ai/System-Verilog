`include "environment.sv"

program test(rtl_intf intf);
  
  environment env;
  
  initial begin
    
    env = new(intf);
    
    env.gen.count = 10;
    
    env.run();
    
  end
  
endprogram
