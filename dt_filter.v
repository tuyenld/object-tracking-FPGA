// data from DRAM to block Filter_Medium
module dt_filter
	(
		input wire clk,
		input wire rst,
		input wire [7:0] data_in,
		output reg clk_out,
		output reg [71:0] arr12 // 9 element x 8bit =  72
	);
	localparam [3:0] c0 = 4'b0000,                                           
                     c1 = 4'b0001,                       
                     c2 = 4'b0010,                                           
                     c3 = 4'b0011,                       
                     c4 = 4'b0100,
                     c5 = 4'b0101, 
                     c6 = 4'b0110, 
                     c7 = 4'b0111,                                            
                     c8 = 4'b1000;                                             
  reg [3:0] c_reg, c_next;
  reg clk_reg;
  reg [71:0] arr12_reg ;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      clk_out <= 1'b0;
      c_next <= c0;
    end
    else begin
      c_next <= c_reg;
      clk_out <= clk_reg;  
      arr12 <= arr12_reg;
    end
  end
  
  always @(*)
    case (c_reg)
      c0: begin
       		c_next = c1;
       		arr12_reg[0] = data_in;
       		clk_reg = 1'b0;
        end
      c1: begin
        	c_next = c2;
        	arr12_reg[1] = data_in;
        	clk_reg = 1'b0;
        end
      c2: begin
       		c_next = c3;
       		arr12_reg[2] = data_in;
       		clk_reg = 1'b0;
        end
      c3: begin
        	c_next = c4;
        	arr12_reg[3] = data_in;
        	clk_reg = 1'b0;
        end
      c4: begin
       		c_next = c5;
       		arr12_reg[4] = data_in;
       		clk_reg = 1'b0;
        end
      c5: begin
        	c_next = c6;
       		arr12_reg[5] = data_in;
       		clk_reg = 1'b0;
        end
      c6: begin
        	c_next = c7;
       		arr12_reg[6] = data_in;
       		clk_reg = 1'b0;
        end
      c7: begin
	        c_next = c8;
	       	arr12_reg[7] = data_in;
	       	clk_reg = 1'b0;
        end
      c8: begin
       		c_next = c0;
       		arr12_reg[8] = data_in;
       		clk_reg = 1'b1;
        end
      default : begin
        	c_next = c0;
       		arr12_reg [8:0] = 8'b0;
       		clk_reg = 1'b0;
        end
    endcase
endmodule