`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:32:10 12/08/2016 
// Design Name: 
// Module Name:    CMBGEZ 
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
module CMBGEZ(
	 input [31:0] input1,
	 output BGEZ
    );
	 
	 assign BGEZ = ((input1==0)||(input1[31]==0)) ? 1 : 0;


endmodule
