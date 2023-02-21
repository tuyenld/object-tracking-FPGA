//Edge detection
module adder(result,clk,data);
  input [4:0] data;
  input clk;
  output reg result;
  
  integer i=0,count=0;
  
  always @ (posedge clk)
  begin
      if  (data[2]>0) 
              result <= 1'b1; 
      else begin
           for (i = 0; i<5; i = i+1) 
           begin
             if (data[i] == 1'b0) count = count +1;
              //i=i+1;
           end 
           if  (count <5) result <= 1'b0; 
          else result <= 1'b1;
        end 
  end
  
endmodule
