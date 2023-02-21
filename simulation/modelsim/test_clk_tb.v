`timescale 1 ns / 100 ps
module test_clk_tb();

reg clk;
reg rst;
reg [7:0]data_in;
wire[9:0]count_rows;
wire[9:0]count_cols;
wire control_out;
wire data_or_none;
wire [8:0]data_out;
wire [7:0]data_out_8;
wire choose;

test_clk U1 (	.clk(clk),
				.rst(rst),
				.count_rows(count_rows),
				.count_cols(count_cols),
				.control_out(control_out),
				.data_or_none(data_or_none),
				.data_in(data_in),
				.data_out(data_out),
				.data_out_8(data_out_8),	
				.choose(choose)			
				
			);
			
always 
begin
clk<=1'b0;
#5 
clk=~clk;
#5;
end
initial 
begin
rst<=0;
$monitor($time," <<row = %d , col = %d , control_out = %d , data_or_none = %d , data = %b , out %d   %d>>"
		,count_rows, count_cols, control_out,data_or_none,data_out,data_out_8,choose);
//$monitor($time,"out = %d",data_out);
#10
rst<=1;
data_in<=8'd0;
#5
#6400 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd0;
#10 data_in<=8'd0;
#10 data_in<=8'd0;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
#10 data_in<=8'd255;
#10 data_in<=8'd255;
#10 data_in<=8'd0;
/*
#5 $display($time," << control_out = %d , data_or_none = %d >>",control_out,data_or_none);
#5 $display($time," << control_out = %d , data_or_none = %d >>",control_out,data_or_none);
#5 $display($time," << control_out = %d , data_or_none = %d >>",control_out,data_or_none);
#5 $display($time," << control_out = %d , data_or_none = %d >>",control_out,data_or_none);
#5 $display($time," << control_out = %d , data_or_none = %d >>",control_out,data_or_none);
#5 $display($time," << control_out = %d , data_or_none = %d >>",control_out,data_or_none);
#5 $display($time," << control_out = %d , data_or_none = %d >>",control_out,data_or_none);
*/
#10
//#3080000
$stop;
end
endmodule

