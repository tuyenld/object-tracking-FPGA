module top_module
	(
		input  wire        CLOCK_50,             //          clk.clk
		input  wire [0:0]  KEY,       //        reset.reset_n
		//
		output wire        VGA_HS,              //             .HS
		output wire        VGA_VS,              //             .VS
		output wire [3:0]  VGA_R,               //             .R
		output wire [3:0]  VGA_G,               //             .G
		output wire [3:0]  VGA_B,               //             .B
		//
		output wire        DRAM_CLK,       //    sdram_clk.clk
		//
		inout  wire [15:0] SRAM_DQ,             //         sram.DQ
		output wire [17:0] SRAM_ADDR,           //             .ADDR
		output wire        SRAM_LB_N,           //             .LB_N
		output wire        SRAM_UB_N,           //             .UB_N
		output wire        SRAM_CE_N,           //             .CE_N
		output wire        SRAM_OE_N,           //             .OE_N
		output wire        SRAM_WE_N,           //             .WE_N
		//
		output wire [11:0] DRAM_ADDR,           //         dram.addr
		output wire  	   DRAM_BA_0,             //      
		output wire  	   DRAM_BA_1,             //        
		output wire        DRAM_CAS_N,          //             .cas_n
		output wire        DRAM_CKE,            //             .cke
		output wire        DRAM_CS_N,           //             .cs_n
		inout  wire [15:0] DRAM_DQ,             //             .dq
		output wire 	   DRAM_LDQM,            //             
		output wire 	   DRAM_UDQM,            //             
		output wire        DRAM_RAS_N,          //             .ras_n
		output wire        DRAM_WE_N,           //             .we_n
		//
		output wire [21:0] FL_ADDR,             //           fl.ADDR
		//output wire        FL_CE_N,             //             .CE_N
		output wire        FL_OE_N,             //             .OE_N
		output wire        FL_WE_N,             //             .WE_N
		output wire        FL_RST_N,            //             .RST_N
		inout  wire [7:0]  FL_DQ,               //             .DQ
		//
		input  wire [2:0]  SW,           //           sw.export
		output wire [3:0]  LEDR          //          led.export
		//==============================================================

	);

	wire [7:0]  img1;
	wire [7:0]  img2;
	wire rst_f_nios;
	//
	wire clk_f_nios;
	//reg clk_f_nios_reg;
	reg clk_f_nios_median;
	reg clk_f_nios_thr;
	//=================
	wire [15:0] data2nios_dt;	// From block Delta Frame
	wire [15:0] data2nios_thr;	// From block Threshold
	wire [15:0] data2nios_median;	// From Median Filter

	//wire [15:0] data2nios;		// To NIOS system
	reg [15:0] data2nios;

	wire clk_f_delta;
	//wire clk2nios;
	reg clk2nios;
	wire clk_f_median;
	reg [7:0] dt_f_nios_median;

	// Edge detection
	reg clk_f_nios_edge; 
	wire rst_f_nios_edge; 
	wire [7:0] dt_f_nios_edge;
	wire clk_out_edge;
	wire [15:0] data_raw_edge;

	//wire [15:0] dram2thr;		// 16 bit from DRAM to block Threshold
	//=================
	vga_v1 VGACtrl (
		.CLOCK_50   		(CLOCK_50)   			,			
		.KEY				(KEY)					,		
		 //											,
		.VGA_HS				(VGA_HS)				,		
		.VGA_VS				(VGA_VS)				,		
		.VGA_R				(VGA_R)					,	
		.VGA_G				(VGA_G)					,	
		.VGA_B				(VGA_B)					,	
		.DRAM_CLK			(DRAM_CLK)				,		
		//	
		.SRAM_DQ			(SRAM_DQ)				,		
		.SRAM_ADDR			(SRAM_ADDR)				,		
		.SRAM_LB_N			(SRAM_LB_N)				,		
		.SRAM_UB_N			(SRAM_UB_N)				,		
		.SRAM_CE_N			(SRAM_CE_N)				,		
		.SRAM_OE_N			(SRAM_OE_N)				,		
		.SRAM_WE_N			(SRAM_WE_N)				,		
		//	
		.DRAM_ADDR			(DRAM_ADDR)				,		
		.DRAM_BA_0			(DRAM_BA_0)				,
		.DRAM_BA_1			(DRAM_BA_1)				,		
		.DRAM_CAS_N			(DRAM_CAS_N)			,			
		.DRAM_CKE			(DRAM_CKE)				,		
		.DRAM_CS_N			(DRAM_CS_N)				,		
		.DRAM_DQ			(DRAM_DQ)				,		
		.DRAM_LDQM			(DRAM_LDQM)				,	
		.DRAM_UDQM			(DRAM_UDQM)				,	
		.DRAM_RAS_N			(DRAM_RAS_N)			,			
		.DRAM_WE_N			(DRAM_WE_N)				,		
		//	
		.FL_ADDR			(FL_ADDR)				,		
		.FL_OE_N			(FL_OE_N)				,		
		.FL_WE_N			(FL_WE_N)				,		
		.FL_RST_N			(FL_RST_N)				,		
		.FL_DQ				(FL_DQ)					,	
		//	
		.SW					(SW)					,	
		.LEDR				(LEDR)					,
		//	
		.img1				(img1)					,
		.img2				(img2)					,
		.rst_f_nios			(rst_f_nios)			,
		.clk_f_nios			(clk_f_nios)			,
		.clk2nios_export 	(clk2nios)     			,
		.data2nios_export   (data2nios) 
		);
	
	delta_frame DeltaFrame (
		.clk_in 			(clk_f_nios)		,
		.reset 				(rst_f_nios)		,
		.gray_o				(img1)				,
		.gray_bg 			(img2)				,
		//.clk_out 			(clk_f_delta)		,
		.data_out 			(data2nios_dt)			
		);
	threshold ThresHold (
		.clk 			(clk_f_nios_thr)			,
		.reset 			(rst_f_nios)			,
		.gray 			(img1)				,
		.thresh 		(8'h3c)					,
		.thr_out 		(data2nios_thr)
		);
	filter_medium FilterMedian (					
		.clk_f_nios		(clk_f_nios_median)			,		
		.rst_f_nios		(rst_f_nios)			,		
		.dt_f_nios		(img1)					,
		.clk_out		(clk_f_median)			,		
		.data_raw		(data2nios_median)					
		);
	edge_detec EdgeDetection (	
		 .clk_f_nios    	(clk_f_nios_edge)		,				
		 .rst_f_nios    	(rst_f_nios)		,				
		 .dt_f_nios			(img1)		,		
		 .clk_out			(clk_out_edge)			,	
		 .data_raw			(data_raw_edge)				
		);
	always @(*) begin	
		case (SW)
			3'h02 : begin
				data2nios = data2nios_dt;
				clk2nios = 1'b0;
				clk_f_nios_thr = 1'b0;
				clk_f_nios_edge = 1'b0;
				clk_f_nios_median = 1'b0;
			end
			3'h06 : begin
				data2nios = data2nios_thr;
				clk2nios = 1'b1;
				clk_f_nios_thr = clk_f_nios;
				clk_f_nios_edge = 1'b0;
				clk_f_nios_median = 1'b0;
			end
			3'h07 : begin
				data2nios = data2nios_median;
				clk2nios = clk_f_median;
				clk_f_nios_median = clk_f_nios;
				clk_f_nios_thr = 1'b0;
				clk_f_nios_edge = 1'b0;
			end
			3'h05 : begin
				data2nios = data_raw_edge;
				clk2nios = clk_out_edge;
				clk_f_nios_edge = clk_f_nios;
				clk_f_nios_thr = 1'b0;
				clk_f_nios_median = 1'b0;
			end
			default: begin
				data2nios = 16'h0;
				clk2nios = 1'b0;
				clk_f_nios_thr = 1'b0;
				clk_f_nios_edge = 1'b0;
				clk_f_nios_median = 1'b0;
			end
		endcase
	end
endmodule