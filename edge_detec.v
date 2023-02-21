// Recommend:   Open with Sublime Text

module edge_detec
  (
    input   wire clk_f_nios,    // Clock from dt_filter
    input   wire rst_f_nios,    // reset from dt_filter
    input   wire [7:0] dt_f_nios, // data from NIOS (img1)
    output  reg  clk_out,
    output  wire [15:0] data_raw  // data after Median Filter as 8 bit
  );
  
  localparam [2:0]   c_rst  = 3'b000,
                     c0     = 3'b001,                                           
                     c1     = 3'b010,                       
                     c2     = 3'b011,                                           
                     c3     = 3'b100,                       
                     c4     = 3'b101,
                     c_wait = 3'b110;    // buffer state                                            
  reg [2:0] c_reg, c_next;

  reg [2:0] cnt_reg, cnt_next;  // Counter number pixel > 0
  reg [7:0] data_raw_reg;
  reg [7:0] dt_f_nios_reg;
  reg adder_2;

  always @(posedge clk_f_nios or posedge rst_f_nios) begin
    if (rst_f_nios) begin
      c_reg <= c_rst;
      cnt_reg <= 3'h0;
      dt_f_nios_reg <= 8'h00;
    end
    else begin
      c_reg <= c_next;
      cnt_reg <= cnt_next;
      dt_f_nios_reg <= dt_f_nios;
    end
  end
  
  always @(cnt_reg, dt_f_nios_reg, c_reg, adder_2)
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
            clk_out = 1'b0;
            adder_2 = dt_f_nios_reg[0];
          end
        c3: begin
            c_next = c4;
            clk_out = 1'b0;                 /************************************/
          end
        c4: begin
            c_next = c_wait;
            clk_out = 1'b0;

            if (adder_2 == 1'b1) data_raw_reg = 8'h00;
            else
              if (cnt_reg > 1'b0) data_raw_reg = 8'hFF;
              else 
                data_raw_reg = 8'h00;
  
          end
        c_wait: begin
            c_next = c0;
            cnt_next = 3'b0;
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