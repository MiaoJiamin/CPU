`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:45:37 12/05/2016 
// Design Name: 
// Module Name:    MEM_WB 
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
module ME_WB(
	 input clk,
	 input reset,
	 input [31:0] MemRD,
	 input [31:0] ALUOut_M,
	 input [4:0] WriteReg_M,
	 input [31:0] pc8_M,
	 
	 input RegWrite_M,
	 input [1:0] MemtoReg_M,
	 
	 output reg [31:0] ReadData_W,
	 output reg [31:0] ALUOut_W,
	 output reg [4:0] WriteReg_W,
	 output reg [31:0] pc8_W,
	 
	 output reg RegWrite_W,
	 output reg [1:0] MemtoReg_W
    ); 
	 
	 initial begin
		pc8_W <= 0;
		ReadData_W <= 0;
		ALUOut_W <= 0;
		WriteReg_W <= 0;
			
		MemtoReg_W <= 0;
		RegWrite_W <= 0;
	 end
	 
	 always @(posedge clk)begin
		if(reset)begin
			pc8_W <= 0;
			ReadData_W <= 0;
			ALUOut_W <= 0;
			WriteReg_W <= 0;
			
			MemtoReg_W <= 0;
			RegWrite_W <= 0;
		end
		else begin
			pc8_W <= pc8_M;
			ReadData_W <= MemRD;
			ALUOut_W <= ALUOut_M;
			WriteReg_W <= WriteReg_M;
			
			MemtoReg_W <= MemtoReg_M;
			RegWrite_W <= RegWrite_M;
		end
	 end


endmodule
