`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:32:15 11/30/2016 
// Design Name: 
// Module Name:    ID_EX 
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
module ID_EX(
	 input clk,
	 input reset,
	 input clr,
	 input [31:0] instr,
	 input [31:0] RD1,
	 input [31:0] RD2,
	 input [31:0] extimm,
	 input [31:0] pc8_D,
	 
	 input RegWrite_D,
	 input MemWrite_D,
	 input [1:0] MemtoReg_D,
	 input [1:0] RegDst_D,
	 input ALUSrc_D,
	 input [2:0] ALUOp_D,
	 input Jal_D,
	 
	 output reg [31:0] instr_E,
	 output reg [31:0] RD1_E,
	 output reg [31:0] RD2_E,
	 output reg [31:0] extimm_E,
	 output reg [4:0] Rs_E,
	 output reg [4:0] Rt_E,
	 output reg [4:0] Rd_E,
	 output reg [31:0] pc8_E,
	 
	 output reg RegWrite_E,
	 output reg MemWrite_E,
	 output reg [1:0] MemtoReg_E,
	 output reg [1:0] RegDst_E,
	 output reg ALUSrc_E,
	 output reg [2:0] ALUOp_E,
	 output reg Jal_E
    );
	 
	 initial begin
		instr_E <= 0;
		pc8_E <= 0;
		RD1_E <= 0;
		RD2_E <= 0;
		extimm_E <= 0;
		Rs_E <= 0;
		Rt_E <= 0;
		Rd_E <= 0;
			
		RegWrite_E <= 0;
		MemWrite_E <= 0;
		MemtoReg_E <= 0;
		RegDst_E <= 0;
		ALUSrc_E <= 0;
		ALUOp_E <= 0;
		Jal_E <= 0;
	 end
	 
	 always @(posedge clk)begin
		if(reset||clr)begin
			instr_E <= 0;
			pc8_E <= 0;
			RD1_E <= 0;
			RD2_E <= 0;
			extimm_E <= 0;
			Rs_E <= 0;
			Rt_E <= 0;
			Rd_E <= 0;
			
			RegWrite_E <= 0;
			MemWrite_E <= 0;
			MemtoReg_E <= 0;
			RegDst_E <= 0;
			ALUSrc_E <= 0;
			ALUOp_E <= 0;
			Jal_E <= 0;
		end
		else begin
			instr_E <= instr;
			pc8_E <= pc8_D;
			RD1_E <= RD1;
			RD2_E <= RD2;
			extimm_E <= extimm;
			Rs_E <= instr[25:21];
			Rt_E <= instr[20:16];
			Rd_E <= instr[15:11];
			
			RegWrite_E <= RegWrite_D;
			MemWrite_E <= MemWrite_D;
			MemtoReg_E <= MemtoReg_D;
			RegDst_E <= RegDst_D;
			ALUSrc_E <= ALUSrc_D;
			ALUOp_E <= ALUOp_D;
			Jal_E <= Jal_D;
		end
	 end

endmodule
