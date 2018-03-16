`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:52:33 11/30/2016 
// Design Name: 
// Module Name:    IF 
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
module IF(
	 input clk,
	 input reset,
	 input pc_en,
	 input ForwardJal,
	 input [1:0] npcsrc,
	 input [31:0] npcb,
	 input [31:0] npcj,
	 input [31:0] npcjr,	//¶Á³öµÄRD 
	 input [31:0] pc8_M,	//pc+8
	 output [31:0] instr,
	 output [31:0] pc4
    );
	 
	 wire [31:0] pc;
	 wire [31:0] npc;
	 wire [31:0] pcjr;
	 IM IM(.pc(pc), .instr(instr));
	 PC PC(.clk(clk), .reset(reset), .pc_en(pc_en), .npc(npc), .pc(pc));
	 ADD4 ADD4(.pc(pc), .pc4(pc4));
	 NPC_SRC NPC_SRC(.npcsrc(npcsrc), .npc4(pc4), .npcb(npcb), .npcj(npcj), .npcjr(pcjr), .npc(npc));
	 MUX_PC8 MUX_PC8(.inputA(npcjr), .inputB(pc8_M), .ForwardJal(ForwardJal), .pcjr(pcjr));

endmodule
