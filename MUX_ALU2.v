`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:12:06 12/05/2016 
// Design Name: 
// Module Name:    MUX_ALU2 
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
module MUX_ALU2(
	 input ALUSrcE,
	 input [31:0] input1,
	 input [31:0] input2,
	 output [31:0] Out_to_ALU2
    );
	 
	 assign Out_to_ALU2 = (ALUSrcE==0 ? input1 : input2);


endmodule
