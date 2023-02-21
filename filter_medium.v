// Recommend:   Open with Sublime Text
//Note: Can Lost data
/*
*   Window Memory: 4 x 3
*   Window Filter: 3 x 3  ==> 2 pixel / scan (16bitDRAM/scan)
*
*     Skip 1 pixel at boundary left and right
*     Skip 1 pixel at boundary top and bottom
*
*   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
*   x 0  1  2  3                                                   x
*   x 4  5  6  7                                                   x
*   x 8  9  10 11                                                  x          
*   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
*/
module filter_medium
  (
    input   wire clk_f_nios,    // Clock from dt_filter
    input   wire rst_f_nios,    // reset from dt_filter
    input   wire [7:0] dt_f_nios, // data from NIOS (img1)
    output  reg clk_out,
    output  wire [15:0] data_raw  // data after Median Filter as 8 bit
  );
  
  localparam [3:0]   c0 = 4'b0000,                                           
                     c1 = 4'b0001,                       
                     c2 = 4'b0010,                                           
                     c3 = 4'b0011,                       
                     c4 = 4'b0100,
                     c5 = 4'b0101, 
                     c6 = 4'b0110, 
                     c7 = 4'b0111,                                            
                     c8 = 4'b1000,
                     c_rst = 4'b1010,
                     c_wait = 4'b1001;    // buffer state                                            
  reg [3:0] c_reg, c_next;

  reg [3:0] cnt_reg, cnt_next;  // Counter number pixel > 0
  reg [7:0] data_raw_reg;
  //reg rst_cnt;
  wire rst_gen;
  reg [7:0] dt_f_nios_reg;

  always @(posedge clk_f_nios or posedge rst_f_nios) begin
    if (rst_f_nios) begin
      c_reg <= c_rst;
      cnt_reg <= 4'h0;
      dt_f_nios_reg <= 8'h00;
    end
    else begin
      c_reg <= c_next;
      cnt_reg <= cnt_next;
      dt_f_nios_reg <= dt_f_nios;
    end
  end
  
  always @(cnt_reg, dt_f_nios_reg, c_reg)
    begin
    //  data_raw_reg = 8'h00;
    //rst_cnt = 1'b0;
    cnt_next = cnt_reg + dt_f_nios_reg[0];
      case (c_reg)
        c_rst: begin
          c_next = c0;
          clk_out = 1'b1;
          end
        c0: begin
            c_next = c1;
            clk_out = 1'b1;
          end
        c1: begin
            c_next = c2;
            clk_out = 1'b1;
          end
        c2: begin
            c_next = c3;
            clk_out = 1'b1;
          end
        c3: begin
            c_next = c4;
            clk_out = 1'b0;                 /************************************/
          end
        c4: begin
            c_next = c5;
            clk_out = 1'b0;
          end
        c5: begin
            c_next = c6;
            clk_out = 1'b0;
          end
        c6: begin
            c_next = c7;
            clk_out = 1'b0;
          end
        c7: begin
            c_next = c8;
            clk_out = 1'b0;
          end
        c8: begin
            c_next = c_wait;
            clk_out = 1'b0;
            if (cnt_reg > 4'h4)
                data_raw_reg = 8'hFF;  
            else if (cnt_reg == 4'h4)
                    if (dt_f_nios_reg[0] == 1'b1) 
                      data_raw_reg = 8'hFF;
                    else 
                      data_raw_reg = 8'h00;
            else 
                data_raw_reg = 8'h00;

          end
        c_wait: begin
            c_next = c0;
            cnt_next = 4'b0;
            clk_out = 1'b1;
          end
        default : begin
            c_next = c0;
            clk_out = 1'b0;
          end
      endcase
    end

  assign data_raw = {8'h00, data_raw_reg};
endmodule