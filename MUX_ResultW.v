`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:56:10 12/05/2016 
// Design Name: 
// Module Name:    MUX_ResultW 
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
module MUX_ResultW(
	 input [31:0] inputA,
	 input [31:0] inputB,
	 input [31:0] inputC,
	 input [1:0] MemtoReg,	// 00 ALUOut; 01 DMOut; 10 pc4
	 output [31:0] Result_W
    );
	 
	 assign Result_W = MemtoReg==2'b00 ? inputA : 
							 (MemtoReg==2'b01 ? inputB : inputC);

endmodule
