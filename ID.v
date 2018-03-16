`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:12:17 11/30/2016 
// Design Name: 
// Module Name:    ID 
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
module ID(
	 input clk,
	 input reset,
	 
	 input [1:0] ForwardA_D,
	 input [1:0] ForwardB_D,
	 input [31:0] ALU_O_M,
	 
	 input [31:0] instr,
	 input [31:0] pc4,	//pc+4
	 input [31:0] WD,
	 input [4:0] A3,
	 input RegWrite,
	 input [31:0] pc8_M,
	 
	 output [31:0] RD1,
	 output [31:0] RD2,
	 output [31:0] Extimm,
	 output [31:0] npc4,		//pc+4
	 output [31:0] npcb,		//b的npc
	 output [31:0] npcj,		//jal和j的npc
	 output [31:0] npcjr,	//jr的npc
	 output [4:0] Rs_D,
	 output [4:0] Rt_D,
	 output [4:0] Rd_D,
	 output [31:0] pc8,		//pc+8
	 
	 output RegWrite_D,
	 output MemWrite_D,
	 output [1:0] MemtoReg_D,
	 output [1:0] RegDst_D,
	 output ALUSrc_D,
	 output [2:0] ALUOp_D,		
	 output [1:0] pcsrc_D,
	 output BranchD,
	 output Jr_D,
	 output Jal_D
    );
	 
	 wire zero, EXTOpD;
	 wire [31:0] rd1,rd2,cmpA, cmpB;
	 wire [31:0] extimm;
	// wire [31:0] writedata;
	 
	 assign RD1 = rd1;
	 assign RD2 = rd2;
	 assign Extimm = extimm;
	 assign Rs_D = instr[25:21];
	 assign Rt_D = instr[20:16];
	 assign Rd_D = instr[15:11];
	 assign pc8 = pc4 + 4;
	 
	 RF RF(.clk(clk), .reset(reset), .RegWriteW(RegWrite), .A1(instr[25:21]), .A2(instr[20:16]), .A3(A3), .WD(WD), .RD1(rd1), .RD2(rd2));
	 CMP CMP(.inputA(cmpA), .inputB(cmpB), .zero(zero));
	 MUX_CMPA MUX_CMPA(.RD1(rd1), .ALU_O_M(ALU_O_M), .pc8(pc8_M), .ForwardA_D(ForwardA_D), .CMP_A(cmpA));
	 MUX_CMPB MUX_CMPB(.RD2(rd2), .ALU_O_M(ALU_O_M), .pc8(pc8_M), .ForwardB_D(ForwardB_D), .CMP_B(cmpB));
	 EXT EXT(.EXTOp(EXTOpD), .imm(instr[15:0]), .extimm(extimm));
	 NPC NPC(.pc4(pc4), .instr(instr), .RD1(cmpA), .extimm(extimm), .npc4(npc4), .npcb(npcb), .npcj(npcj), .npcjr(npcjr));
	 control_D control_D(.instr(instr), .zero(zero), .RegWriteD(RegWrite_D), .MemWriteD(MemWrite_D), .MemtoRegD(MemtoReg_D), 
								.RegDstD(RegDst_D), .ALUSrcD(ALUSrc_D), .ALUOpD(ALUOp_D), .pcsrcD(pcsrc_D), .EXTOpD(EXTOpD),
								.BranchD(BranchD), .JrD(Jr_D), .JalD(Jal_D));
endmodule
