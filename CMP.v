`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:28:55 11/30/2016 
// Design Name: 
// Module Name:    CMP 
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
module CMP(
	 input [31:0] inputA,
	 input [31:0] inputB,
	 output zero
    );	//比较RD1和RD2是否相等
	 
	 assign zero = (inputA==inputB ? 1 : 0);


endmodule
