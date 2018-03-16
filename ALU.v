`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:45:26 12/05/2016 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
	 input [31:0] inputA,
	 input [31:0] inputB,
	 input [2:0] ALUOp,
	 input [4:0] shamt,
	 output [31:0] ALUOut
    );
	 
	 reg [31:0] result;
	 
	 always @(inputA or inputB or ALUOp or shamt)begin
		case(ALUOp)
			3'b000: result <= inputA + inputB;	//+
			3'b001: result <= inputA - inputB;	//-
			3'b010: result <= inputA & inputB; 	//and
			3'b011: result <= inputA | inputB;  //or
			3'b100: result <= inputA ^ inputB; 	//xor
			3'b101: result <= inputB<<16;			//lui
			3'b110: result <= inputB<<shamt;		//sll
			3'b111: result <= inputB>>shamt;		//srl
		endcase
	 end
	 
	 assign ALUOut = result;

endmodule
