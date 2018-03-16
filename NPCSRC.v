`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:35:15 12/07/2016 
// Design Name: 
// Module Name:    NPCSRC 
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
module NPC_SRC(
	 input [1:0] npcsrc,
	 input [31:0] npc4,
	 input [31:0] npcb,
	 input [31:0] npcj,
	 input [31:0] npcjr,
	 output [31:0] npc
    );
	 
	 assign npc = npcsrc==2'b00 ? npc4 :
					  (npcsrc==2'b01 ? npcb :
					  (npcsrc==2'b10 ? npcj : npcjr));


endmodule
