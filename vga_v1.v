module vga_v1 
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
		output wire [3:0]  LEDR,          //          led.export
		//
		output wire [7:0]  img1,         //         img1.export
		output wire [7:0]  img2,         //         img2.export
		output wire        rst_f_nios, // reset_f_nios.export
		output wire        clk_f_nios,    //   clk_f_nios.export
		input  wire        clk2nios_export,     //     clk2nios.export
		input  wire [15:0]  data2nios_export     //    data2nios.export
	);
wire [1:0]  DQM;
wire [1:0] BA;
t_vga_v1 VGAController (
	.clk_clk         		(CLOCK_50)   			,			
	.reset_reset_n      	(KEY[0])				,		
	//.vga_out_CLK        							,
	.vga_HS         		(VGA_HS)				,		
	.vga_VS         		(VGA_VS)				,		
	.vga_R          		(VGA_R)					,	
	.vga_G          		(VGA_G)					,	
	.vga_B          		(VGA_B)					,	
	.sdram_clk_clk      	(DRAM_CLK)				,		
	//					
	.sram_DQ       	(SRAM_DQ)				,		
	.sram_ADDR     	(SRAM_ADDR)				,		
	.sram_LB_N     	(SRAM_LB_N)				,		
	.sram_UB_N     	(SRAM_UB_N)				,		
	.sram_CE_N     	(SRAM_CE_N)				,		
	.sram_OE_N     	(SRAM_OE_N)				,		
	.sram_WE_N     	(SRAM_WE_N)				,		
						
	.dram_addr         	(DRAM_ADDR)				,		
	.dram_ba           	(BA)					,	
	.dram_cas_n        	(DRAM_CAS_N)			,			
	.dram_cke          	(DRAM_CKE)				,		
	.dram_cs_n         	(DRAM_CS_N)				,		
	.dram_dq           	(DRAM_DQ)				,		
	.dram_dqm          	(DQM)					,	
	.dram_ras_n        	(DRAM_RAS_N)			,			
	.dram_we_n         	(DRAM_WE_N)				,		
						
	.fl_ADDR            	(FL_ADDR)				,		
	//.fl_CE_N            	(FLb0)				,		
	.fl_OE_N            	(FL_OE_N)				,		
	.fl_WE_N            	(FL_WE_N)				,		
	.fl_RST_N           	(FL_RST_N)				,		
	.fl_DQ              	(FL_DQ)					,	
	//					
	.sw_export          	(SW)					,	
	.led_export         	(LEDR)					,
	//
	.img1_export        	(img1)					,
	.img2_export        	(img2)					,
	.reset_f_nios_export	(rst_f_nios)			,
	.clk_f_nios_export  	(clk_f_nios)			,
	.clk2nios_export 		(clk2nios_export)		,
	.data2nios_export 		(data2nios_export) 		
	);

assign DRAM_BA_0 = BA[0];
assign DRAM_BA_1 = BA[1];
assign DRAM_UDQM = DQM[1];
assign DRAM_LDQM = DQM[0];

endmodule