`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:39:14 12/05/2016 
// Design Name: 
// Module Name:    MUX_WriteReg_E 
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
module MUX_WriteReg_E(
	 input [4:0] Rt,
	 input [4:0] Rd,
	 input [1:0] RegDst,
	 output [4:0] WriteReg_E
    );
	 
	 assign WriteReg_E = RegDst==2'b00 ? Rd : 
							  (RegDst==2'b01 ? Rt : 31);

endmodule
