class generator;
  
  rand transaction trans;
  
  event ended;
  
  int count;
  
  mailbox gen2driv;
  
  function new(mailbox gen2driv, event ended);
    this.gen2driv = gen2driv;
    this.ended = ended;
  endfunction
  
  task main();
    
    repeat(count) begin
      trans = new();
      if(!trans.randomize()) $fatal("[GEN]: Did not randomize!");
      trans.display("[ Generator ]");
      gen2driv.put(trans);
    end

   	-> ended;
    
  endtask
  
endclass
