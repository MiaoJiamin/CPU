`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:47:01 12/05/2016 
// Design Name: 
// Module Name:    EX 
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
module EX(
	 input [31:0] instr_E,
	 input [31:0] RD1,
	 input [31:0] RD2,
	 
	 input [31:0] ResultW,
	 input [31:0] ALU_O_M,
	 input [1:0] ForwardA_E,
	 input [1:0] ForwardB_E,
	 
	 input [4:0] Rs_E,
	 input [4:0] Rt_E,
	 input [4:0] Rd_E,
	 input [31:0] extimm,
	 
	 input [1:0] RegDst_E,
	 input ALUSrc_E,
	 input [2:0] ALUOp_E,
	 
	 output [31:0] ALUOut,
	 output [31:0] WriteData_E,
	 
	 output [4:0] WriteReg_E,
	 output [4:0] Rs_Hazard,
	 output [4:0] Rt_Hazard
    );
	 
	 
	 wire [31:0] out_to_ALU1,out_to_ALU2,ALUB;
	 
	 assign WriteData_E = ALUB;
	 assign Rt_Hazard = Rt_E;
	 assign Rs_Hazard = Rs_E;
	 
	 ALU ALU(.inputA(out_to_ALU1), .inputB(out_to_ALU2), .ALUOp(ALUOp_E), .shamt(instr_E[10:6]), .ALUOut(ALUOut));
	 MUX_ALU2 MUX_ALU2(.ALUSrcE(ALUSrc_E), .input1(ALUB), .input2(extimm), .Out_to_ALU2(out_to_ALU2));
	 MUX_ALUA MUX_ALUA(.RD1(RD1), .ResultW(ResultW), .ALU_O_M(ALU_O_M), .ForwardA_E(ForwardA_E), .Out_to_ALU1(out_to_ALU1));
	 MUX_ALUB MUX_ALUB(.RD2(RD2), .ResultW(ResultW), .ALU_O_M(ALU_O_M), .ForwardB_E(ForwardB_E), .ALUB1(ALUB));
	 MUX_WriteReg_E MUX_WriteReg_E(.Rt(Rt_E), .Rd(Rd_E), .RegDst(RegDst_E), .WriteReg_E(WriteReg_E));
	 
endmodule
