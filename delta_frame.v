module delta_frame
  (
  input wire clk_in,
  input wire reset,
  input wire [7:0] gray_o,
  input wire [7:0] gray_bg,
  // output reg clk_out,
  output wire [15:0] data_out
  );
    
  reg [7:0] data_reg;
  reg [7:0] data_raw;
  
  always @(posedge clk_in or posedge reset) begin
    if (reset) 
      data_raw <= 0;
    else 
      data_raw <= data_reg;
  end
  
  always @(*) begin
    if (gray_bg > gray_o) data_reg = gray_bg - gray_o;
    else  data_reg = gray_o - gray_bg ;
  end

  assign data_out = {8'h00, data_raw};

endmodule