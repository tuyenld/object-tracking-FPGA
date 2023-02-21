module threshold
	(
	  input wire [7:0] gray, 		// Two pixel stored in SDRAM
	  input wire clk,
	  input wire reset,
	  input wire [7:0] thresh,
	  output wire [15:0] thr_out
  	);
  reg [7:0] thresh_reg;
  wire [7:0] thresh_cur;
  reg [7:0] gray_reg;

  	always @(posedge clk or posedge reset) begin
  		if (reset)
        gray_reg <= 8'h0;
  		else 
        gray_reg <= gray;
  	end

    always @(*) begin
      if (gray_reg > thresh) thresh_reg = 8'hFF;
      else thresh_reg = 8'h00;
    end

    assign thresh_cur = thresh_reg;
    assign thr_out = {8'h00, thresh_cur};
    
endmodule

