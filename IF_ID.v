`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:06:20 11/30/2016 
// Design Name: 
// Module Name:    IF_ID 
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
module IF_ID(
	 input clk,
	 input reset,
	 input IF_ID_en,
	 input [31:0] instr,
	 input [31:0] pc4,
	 output reg[31:0] instr_D,
	 output reg[31:0] pc4_D
    );
	 
	 initial begin
		instr_D <= 0;
		pc4_D <= 0;
	 end
	 
	 always @(posedge clk)begin
		if(reset)begin
			instr_D <= 0;
			pc4_D <= 32'h00003000;
		end
		else begin
			if(IF_ID_en!=0)begin
				instr_D <= instr;
				pc4_D <= pc4;
			end
		end
	 end	 

endmodule
