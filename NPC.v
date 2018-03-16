`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:31:11 11/30/2016 
// Design Name: 
// Module Name:    NPC 
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
module NPC(
	 input [31:0] pc4,
	 input [31:0] instr,
	 input [31:0] RD1,
	 input [31:0] extimm,
	 output [31:0] npc4,
	 output [31:0] npcb,
	 output [31:0] npcj,
	 output [31:0] npcjr
    );	
	 
	 assign npc4 = pc4;
	 assign npcb = pc4 + (extimm<<2);
	 assign npcj = {pc4[31:28],instr[25:0],2'b00};
	 assign npcjr = RD1;
	 
	 /*00	add   pc+4;
		01	beq	pc+4+(extimm<<2)
		10	j		PC31..28||instr_index||00
		10	jal	PC31..28||instr_index||00 ; $31 = pc+4
		11	jr  	31
	 */
endmodule
