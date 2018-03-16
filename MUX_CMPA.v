`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:41:16 12/05/2016 
// Design Name: 
// Module Name:    MUX_CMPA 
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
module MUX_CMPA(
	 input [31:0] RD1,
	 input [31:0] ALU_O_M,
	 input [31:0] pc8,
	 input [1:0] ForwardA_D,
	 output [31:0] CMP_A
    );
	 
	 assign CMP_A = ForwardA_D==2'b00 ? RD1 : 
						 (ForwardA_D==2'b01 ? ALU_O_M : pc8);


endmodule
