`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:34:18 12/06/2016 
// Design Name: 
// Module Name:    hazard 
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
module Hazard(
	 input [4:0] Rs_D,
	 input [4:0] Rt_D,
	 input [4:0] Rs_E,
	 input [4:0] Rt_E,
	 input [4:0] WriteReg_E,
	 input [4:0] WriteReg_M,
	 input [4:0] WriteReg_W,
	 input BranchD,
	 input JrD,
	 input JalM,
	 input [1:0] MemtoReg_E,
	 input RegWrite_E,
	 input [1:0] MemtoReg_M,
	 input RegWrite_M,
	 input RegWrite_W,
	 
	 output [1:0] ForwardA_D,
	 output [1:0] ForwardB_D,
	 output reg [1:0] ForwardA_E,
	 output reg [1:0] ForwardB_E,
	 output  Stall_F,
	 output  Stall_D,
	 output Flush_E,
	 output ForwardJal
    );
	 
	 wire lwstall, branchstall, jrstall;
	 
	 always @(*) begin
		if(Rs_E!=5'b00000 && Rs_E==WriteReg_M && RegWrite_M)
			ForwardA_E = 2'b10;
		else if(Rs_E!=5'b00000 && Rs_E==WriteReg_W && RegWrite_W)
			ForwardA_E = 2'b01;
		else ForwardA_E = 2'b00;			// ForwardA_E
		
		if(Rt_E!=5'b00000 && Rt_E==WriteReg_M && RegWrite_M)
			ForwardB_E = 2'b10;
		else if(Rt_E!=5'b00000 && Rt_E==WriteReg_W && RegWrite_W)
			ForwardB_E = 2'b01;
		else ForwardB_E = 2'b00;			// ForwardB_E				/*EX级ALU要使用的数据没有写回到寄存器中，但是已经算出来了传到了ME或者WB级*/
	 end
	 
	 assign lwstall = (Rs_D==Rt_E || Rt_D==Rt_E) && (MemtoReg_E==2'b01);			//lw阻塞
	 assign branchstall = (BranchD && RegWrite_E && (WriteReg_E==Rs_D || WriteReg_E==Rt_D)) ||	// Ex级阻塞后转发
								 (BranchD && MemtoReg_M==2'b01 && (WriteReg_M==Rs_D || WriteReg_M==Rt_D));		// lw指令MEM级阻塞
	 assign jrstall = (JrD && RegWrite_E && WriteReg_E==Rs_D ) ||
							 (JrD && MemtoReg_M==2'b01 && WriteReg_M==Rs_D);			
	 
								 
	 assign Stall_F = (lwstall || branchstall || jrstall);
	 assign Stall_D = (lwstall || branchstall || jrstall);
	 assign Flush_E = (lwstall || branchstall || jrstall);
	 
	 assign ForwardA_D = {(BranchD && (Rs_D==31) && JalM),((Rs_D!=0) && (Rs_D==WriteReg_M) && RegWrite_M)};		
	 assign ForwardB_D = {(BranchD && (Rt_D==31) && JalM),((Rt_D!=0) && (Rt_D==WriteReg_M) && RegWrite_M)};		// beq转发，从MEM级到ID
	 
	 assign ForwardJal = JrD && JalM && (Rs_D==31);  // jal nop jr

endmodule
