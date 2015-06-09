//*****************************************************************//
// Top Level for calculating cos (theta) using taylor series
// Created By - Vrishbhan Singh Sisodia
// San Jose State University
// EE 278
//*****************************************************************//
module taylor_cos(clk_80, rst_80, factorial2_80, factorial4_80, radian_80, cos_value_80, add_n4_value, n2value_80, n4value_80, sub_n2_value_80, radian2_pow4_80, radian1_pow2_80);
  input clk_80,rst_80;
  input [7:0] factorial2_80, factorial4_80, radian_80;
  output [7:0] cos_value_80;
  output [15:0] radian1_pow2_80;
  output [15:0] radian2_pow4_80;
  output [7:0] add_n4_value;
  output  [7:0] n2value_80; 
  output [7:0]  n4value_80;
  output [7:0] sub_n2_value_80;
  
  reg	[7:0]		n2value_reg3_80;
  reg	[7:0]		n4value_reg4_80;
  reg	[7:0]		sub_n2_value_reg4_80;
  wire	[7:0]		rm2_80, rm4_80;
  reg	[7:0]		radian_reg1_80;
  reg [7:0]		pow2_reg2_80, pow4_reg3_80, pow2_reg3_80;
  wire [7:0]	pow2_80, pow4_80;
  reg [7:0] 	fact2_reg1_80, fact2_reg2_80;
  reg	[7:0]		fact4_reg1_80, fact4_reg2_80, fact4_reg3_80;
  
  
  parameter ADD = 1'b1;
  parameter SUB = 1'b0;
  	//Stage 4
	always @ (posedge clk_80)
	begin
		if (rst_80) begin
			sub_n2_value_reg4_80	<= 0;
			n4value_reg4_80		<=	0;
		end
		else begin
			sub_n2_value_reg4_80	<= sub_n2_value_80;
			n4value_reg4_80		<=	n4value_80;
		end
	end
	
	add_sub_8 add_n4(.add_sub(ADD),.dataa(sub_n2_value_reg4_80),.datab(n4value_reg4_80),.result(add_n4_value));	
				 
	assign	cos_value_80	=	(rst_80)?0:add_n4_value;
	
	//Stage 3
	always @ (posedge clk_80)
	begin
		if (rst_80)	begin
			pow4_reg3_80		<=	0;
			fact4_reg3_80		<=	0;
			n2value_reg3_80	<=	0;
		end
		else begin
			pow4_reg3_80		<=	pow4_80;
			fact4_reg3_80		<=	fact4_reg2_80;
			n2value_reg3_80	<=	n2value_80;
		end
	end
	//calculates 1-x2/2!				 
	add_sub_8 sub_n2( .add_sub(SUB),.dataa(128),.datab(n2value_reg3_80),.result(sub_n2_value_80));	

	div8	i_n4value(.denom(fact4_reg3_80),.numer(pow4_reg3_80),.quotient(n4value_80),.remain(rm4_80));

	//Stage2
	always @ (posedge clk_80)
	begin
		if (rst_80) begin
			pow2_reg2_80		<=	0;
			fact2_reg2_80		<=	0;
			fact4_reg2_80		<=	0;
		end
		else begin
			pow2_reg2_80		<=	pow2_80;
			fact2_reg2_80		<=	fact2_reg1_80;
			fact4_reg2_80		<=	fact4_reg1_80;
		end
	end
	//calculates x^4 term					 
	sq_8 i_pow4 (.dataa (pow2_reg2_80),.result(radian2_pow4_80)); 
					 					 
	div8	i_n2value(.denom(fact2_reg2_80),.numer(pow2_reg2_80),.quotient(n2value_80),.remain(rm2_80));
						
	assign pow4_80=(radian2_pow4_80[15]==0)?((radian2_pow4_80[14:6]==9'b0111_11111)?8'b0111_1111:(radian2_pow4_80[14:7]+radian2_pow4_80[6])):((radian2_pow4_80[14:7]==8'b1000_0000)?1000_0001:(radian2_pow4_80[14:7]+radian2_pow4_80[6]));					

	//Stage 1
	always @  (posedge clk_80)
	begin
		if (rst_80) begin
			radian_reg1_80		<=	0;
			fact2_reg1_80		<=	0;
			fact4_reg1_80		<=	0;
		end
		else begin
			radian_reg1_80		<=	radian_80;
			fact2_reg1_80		<=	factorial2_80;
			fact4_reg1_80		<=	factorial4_80;
		end
	end	
	//calculates x^2 term
	sq_8 i_pow2 (.dataa (radian_reg1_80),.result(radian1_pow2_80)); 
					 
	assign pow2_80 =(radian1_pow2_80[15]==0)?((radian1_pow2_80[14:6]==9'b0111_11111)?8'b0111_1111:(radian1_pow2_80[14:7]+radian1_pow2_80[6])):((radian1_pow2_80[14:7]==8'b1000_0000)?1000_0001:(radian1_pow2_80[14:7]+radian1_pow2_80[6]));

endmodule
