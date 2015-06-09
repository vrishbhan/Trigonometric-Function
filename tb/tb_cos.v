//*****************************************************************//
// Testbench for calculating cos (theta) using taylor series
// Created By - Vrishbhan Singh Sisodia
// San Jose State University
// EE 278
//*****************************************************************//
module tb_cos();
   reg clk_80, reset_80;
	reg [7:0] fact2_80, fact4_80;
	reg [7:0] radian_80;
	wire [7:0] cos_value_80;
	wire	[15:0] radian1_pow2_80, radian2_pow4_80; 
	wire [7:0]  n2value_80, n4value_80;
	wire	[7:0]	add_n4_value_80, sub_n2_value_80;
	
	taylor_cos t1(clk_80, reset_80, fact2_80, fact4_80, radian_80, cos_value_80, add_n4_value_80, n2value_80, n4value_80, sub_n2_value_80, radian2_pow4_80, radian1_pow2_80);
	
	initial begin
	  clk_80 = 0;
	  forever #5 clk_80 =~ clk_80;
	end
	initial begin
	  reset_80 = 1;
	  @(posedge (clk_80));
	  #1;
	  reset_80 = 0;
	  fact2_80 = 0;
	  fact4_80 = 0;
     @(posedge(clk_80));
	  @(posedge(clk_80));
	  #1
	  radian_80 = 8'b0001_0110;	// 10 Degree
	  fact2_80	=	8'b10;
	  fact4_80	=	8'b0001_1000;
	  
	  @(posedge(clk_80))
	  radian_80	=	8'b00101101;	// 20 Degree
	  
	  @(posedge(clk_80))
	  radian_80	=	8'b01000011;	// 30 Degree

	  @(posedge(clk_80))
	  radian_80	=	8'b01011001;	// 40 Degree

	  @(posedge(clk_80))
	  radian_80	=	8'b01101111;	// 50 Degree
	  
	  @(posedge(clk_80))
	  radian_80	=	8'b10000110;	// 60 Degree

	  @(posedge(clk_80))
	  radian_80	=	8'b10011101;	// 70 Degree

	  @(posedge(clk_80))
	  radian_80	=	8'b10110011;	// 80 Degree

	  @(posedge(clk_80))
	  radian_80	=	8'b11001001;	// 90 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b11011111; //100 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b11110101; //110 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b1000011; //120 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b10010001; //130 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b100111; //140 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b10101; //150 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b10110011; //160 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b10111111; //170 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b11001001; //180 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b110101; //190 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b11011111; //200 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b11101011; //210 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b11110111; //220 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b10000000; //230 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b1000011; //240 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b100011; //250 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b10010001; //260 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b10010111; //270 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b10011100; //280 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b1010001; //290 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b10101; //300 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b10101101; //310 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b10110011; //320 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b10111000; //330 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b1011111; //340 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b110001; //350 Degree
	  
	  @(posedge(clk_80));	
	  radian_80	=	8'b11001001; //360 Degree
	  
	  repeat(5)	@(posedge(clk_80));
	  $finish;
	end
endmodule