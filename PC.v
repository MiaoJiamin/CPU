`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:37:38 11/29/2016 
// Design Name: 
// Module Name:    PC 
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
module PC(
    input clk,
    input reset,
	 input pc_en,
	 input [31:0] npc,
	 output reg[31:0] pc
    );
	 
	 parameter mips_pc = 32'h00003000;
	 initial pc = mips_pc;
	 
	 always @(posedge clk)begin
		if(reset)
			pc <= mips_pc;
		else begin
			if(pc_en!=0)
				pc <= npc;
		end
	 end

endmodule
