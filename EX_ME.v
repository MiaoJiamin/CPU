`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:24:09 12/05/2016 
// Design Name: 
// Module Name:    EX_ME 
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
module EX_ME(
	 input clk,
	 input reset,
	 input [31:0] ALUOut,
	 input [31:0] WriteData_E,
	 input [4:0] WriteReg_E,
	 input [31:0] pc8_E,
	 
	 input RegWrite_E,
	 input [1:0] MemtoReg_E,
	 input MemWrite_E,
	 input Jal_E,
	 
	 output reg [31:0] pc8_M,
	 output reg [31:0] ALUOut_M,
	 output reg [31:0] WriteData_M,
	 output reg [4:0] WriteReg_M,
	 
	 output reg RegWrite_M,
	 output reg [1:0] MemtoReg_M,
	 output reg MemWrite_M,
	 output reg Jal_M
    );
	 
	 initial begin
		pc8_M <= 0;
		ALUOut_M <= 0;
		WriteData_M <= 0;
		WriteReg_M <= 0;
			
		RegWrite_M <= 0;
		MemtoReg_M <= 0;
		MemWrite_M <= 0;
		Jal_M <= 0;
	 end
	 
	 always @(posedge clk)begin
		if(reset)begin
			pc8_M <= 0;
			ALUOut_M <= 0;
			WriteData_M <= 0;
			WriteReg_M <= 0;
			
			RegWrite_M <= 0;
			MemtoReg_M <= 0;
			MemWrite_M <= 0;
			Jal_M <= 0;
		end
		else begin
			pc8_M <= pc8_E;
			ALUOut_M <= ALUOut;
			WriteData_M <= WriteData_E;
			WriteReg_M <= WriteReg_E;
			
			RegWrite_M <= RegWrite_E;
			MemtoReg_M <= MemtoReg_E;
			MemWrite_M <= MemWrite_E;
			Jal_M <= Jal_E;
		end
	 end

endmodule
