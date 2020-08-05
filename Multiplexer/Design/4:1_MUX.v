module 4:1_MUX(clk, in0, in1, in2, in3, sel, out, reset);
  
  input clk;
  input reset;
  
  input [3:0] in0;
  input [3:0] in1;
  input [3:0] in2;
  input [3:0] in3;
  input [1:0] sel;
  
  output reg [3:0] out;
  
  parameter S0 = 2'b00;
  parameter S1 = 2'b01;
  parameter S2 = 2'b10;
  parameter S3 = 2'b11;
  
  always @(posedge clk) begin
    
    if(reset)      
      out <= 0;
    
    else begin
     
      case(sel)

        (S0): out <= in0;
        (S1): out <= in1;
        (S2): out <= in2;
        (S3): out <= in3;

        default: begin
           out <= in0;
        end

      endcase
      
    end
    
  end     

endmodule 
