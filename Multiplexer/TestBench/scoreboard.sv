class scoreboard;
  
  mailbox mon2chk;
  
  int transactions;
  
  function new(mailbox mon2chk);
    this.mon2chk = mon2chk;
  endfunction
  
  task main();
    
    transaction trans;
    
    forever begin
      
      mon2chk.get(trans);
      
      if(trans.sel_input == 2'b00) begin
        
        if(trans.mux_output == trans.in0) begin         
          trans.display("[Scoreboard]");
          $display("Result as expected\n");          
        end
        
        else begin
          trans.display("[Scoreboard]");
          $display("Wrong Result. \n \t Expected: %0d Actual: %0d", trans.in0, trans.mux_output);  
        end
        
      end
      
      else if(trans.sel_input == 2'b01) begin

        if(trans.mux_output == trans.in1) begin
          trans.display("[Scoreboard]");
          $display("Result as expected\n");
        end

        else begin
          trans.display("[Scoreboard]");
          $display("Wrong Result. \n \t Expected: %0d Actual: %0d", trans.in1, trans.mux_output);
        end

      end
      
      else if(trans.sel_input == 2'b10) begin

        if(trans.mux_output == trans.in2) begin
          trans.display("[Scoreboard]");
          $display("Result as expected\n");          
        end
        
        else begin
          trans.display("[Scoreboard]");
          $display("Wrong Result. \n \t Expected: %0d Actual: %0d", trans.in2, trans.mux_output);  
        end
        
      end             
    
      else if(trans.sel_input == 2'b11) begin

        if(trans.mux_output == trans.in3) begin
          trans.display("[Scoreboard]");    
          $display("Result as expected\n");
        end

        else begin
          trans.display("[Scoreboard]");
          $display("Wrong Result. \n \t Expected: %0d Actual: %0d", trans.in3, trans.mux_output);   
        end

      end
      
      else begin
       $error("UNEXPECTED FAILURE....");
      end    
    
      transactions++;
      
    end
    
  endtask  
  
endclass
