`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:41:30 11/30/2016 
// Design Name: 
// Module Name:    IM 
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
module IM(
	 input [31:0] pc,
	 output[31:0] instr
    );
	 
	 reg [31:0] _im[1023:0];
	 
	 initial begin
		$readmemh("code.txt",_im);
	 end
	 
	 assign instr = _im[pc[11:2]];
	 
	 
endmodule
