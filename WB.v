`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:55:27 12/05/2016 
// Design Name: 
// Module Name:    WB 
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
module WB(
	// input clk,
	// input reset,
	 input [31:0] ReadData_W,
	 input [31:0] ALUOut_W,
	 input [1:0] MemtoReg_W,
	 inout [4:0] WriteReg_W,
	 input [31:0] pc8,
	 output [31:0] Result_W
    );
	 
	 MUX_ResultW MUX_ResultW(.inputA(ALUOut_W), .inputB(ReadData_W), .inputC(pc8), .MemtoReg(MemtoReg_W), .Result_W(Result_W));
//	 RF RF(.clk(clk), .reset(reset), .RegWriteW(regwrite), .A1(), .A2(), .A3(), .WD(), .RD1(), .RD2());
	 

endmodule
