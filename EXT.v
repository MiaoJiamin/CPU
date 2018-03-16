`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:21:51 11/30/2016 
// Design Name: 
// Module Name:    EXT 
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
module EXT(
	 input EXTOp,
	 input [15:0] imm,
	 output [31:0] extimm
    );	/*EXTOp==0 signextend; EXTOp==1 zeroextend*/
	 
	 assign extimm = (EXTOp==0 ? {{16{imm[15]}},imm[15:0]} : {16'h0000,imm[15:0]});


endmodule
