`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:22:03 12/05/2016 
// Design Name: 
// Module Name:    Mem 
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
module ME(
	 input clk,
	 input reset,
	 input MemWrite_M,
	 inout [31:0] ALUOut_M,
	 inout Jal_M,
	 input [31:0] WriteData_M,
	 inout [4:0] WriteReg_M,
	 output [31:0] MemRD
    ); 
	 
	 DM DM(.clk(clk), .reset(reset), .MemAddr(ALUOut_M), .MemData(WriteData_M), .MemWrite_M(MemWrite_M), .MemRD(MemRD));

endmodule
