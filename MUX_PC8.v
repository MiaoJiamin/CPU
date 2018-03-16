`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:46:25 12/08/2016 
// Design Name: 
// Module Name:    MUX_PC8 
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
module MUX_PC8(
	 input [31:0] inputA,
	 input [31:0] inputB,
	 input ForwardJal,
	 output [31:0] pcjr
    );
	 
	 assign pcjr = ForwardJal==1'b0 ? inputA : inputB;


endmodule
