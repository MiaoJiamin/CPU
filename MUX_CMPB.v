`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:44:31 12/05/2016 
// Design Name: 
// Module Name:    MUX_CMPB 
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
module MUX_CMPB(
	 input [31:0] RD2,
	 input [31:0] ALU_O_M,
	 input [31:0] pc8,
	 input [1:0] ForwardB_D,
	 output [31:0] CMP_B
    );
	 
	 assign CMP_B = ForwardB_D==2'b00 ? RD2 : 
						 (ForwardB_D==2'b01 ? ALU_O_M : pc8);

endmodule
