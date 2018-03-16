`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:51:19 12/05/2016 
// Design Name: 
// Module Name:    MUX_ALUA 
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
module MUX_ALUA(
	 input [31:0] RD1,
	 input [31:0] ResultW,
	 input [31:0] ALU_O_M,
	 input [1:0] ForwardA_E,
	 output [31:0] Out_to_ALU1	 
    );
	 
	 assign Out_to_ALU1 = ForwardA_E == 2'b00 ? RD1 :
								 (ForwardA_E == 2'b01 ? ResultW : ALU_O_M);
								 

endmodule
