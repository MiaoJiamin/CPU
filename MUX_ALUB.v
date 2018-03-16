`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:57:18 12/05/2016 
// Design Name: 
// Module Name:    MUX_ALUB 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MUX_ALUB(
	 input [31:0] RD2,
	 input [31:0] ResultW,
	 input [31:0] ALU_O_M,
	 input [1:0] ForwardB_E,
	 output [31:0] ALUB1
    );
	 
	 assign ALUB1 = ForwardB_E == 2'b00 ? RD2 :
								 (ForwardB_E == 2'b01 ? ResultW : ALU_O_M);


endmodule
