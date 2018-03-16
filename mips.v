module mips(
	 input clk,
	 input reset
    );
	 
	 wire RegWriteW, RegWriteD, RegWriteE, RegWriteM;
	 wire MemWriteD, MemWriteE, MemWriteM;
	 wire [1:0] RegDstD, RegDstE;
	 wire ALUSrcD, ALUSrcE;
	 wire [2:0] ALUOpD, ALUOpE;
	 wire [1:0] MemtoRegD, MemtoRegE, MemtoRegM, MemtoRegW;
	 
	 wire StallF, StallD, FlushE;
	 wire [1:0] ForwardAD, ForwardBD, ForwardAE, ForwardBE;
	 wire [31:0] npc4, npcb, npcj, npcjr, pc4F, pc4D, pc8E, pc8M, pc8W;
	 wire [31:0] pc8;
	 wire [31:0] instrF, instrD, instrE;
	 wire [1:0] pcsrc;
	 wire [31:0] ALU_OM, ResultW, ALU_OE, WriteDataE, WriteDataM, ReadDataM, ReadDataW, ALU_OW;
	 wire [4:0] WriteRegW, WriteRegE, WriteRegM;
	 wire [31:0] RD1_D, RD2_D, RD1_E, RD2_E;
	 wire [31:0] extimmD, extimmE;
	 wire [4:0] Rs_D, Rt_D, Rd_D, Rs_E, Rt_E, Rd_E, Rs_Hazard, Rt_Hazard;
	 wire BranchD, JrD, JalD, JalE, JalM;
	 wire ForwardJal;
	
	 
	 IF IF(.clk(clk), .reset(reset), .pc_en(~StallF), .ForwardJal(ForwardJal), .npcsrc(pcsrc), .pc8_M(pc8M),.npcb(npcb), .npcj(npcj), .npcjr(npcjr), .instr(instrF), .pc4(pc4F)); 
	 
	 IF_ID IF_ID(.clk(clk), .reset(reset), .IF_ID_en(~StallD), .instr(instrF), .pc4(pc4F), .instr_D(instrD), 
					 .pc4_D(pc4D));							
					 
	 ID ID(.clk(clk), .reset(reset), .ForwardA_D(ForwardAD), .ForwardB_D(ForwardBD), .ALU_O_M(ALU_OM), .instr(instrD), .pc4(pc4D),
			 .WD(ResultW), .A3(WriteRegW), .RegWrite(RegWriteW), .pc8_M(pc8M), .RD1(RD1_D), .RD2(RD2_D), .Extimm(extimmD), .npc4(npc4),
			 .npcb(npcb), .npcj(npcj), .npcjr(npcjr), .Rs_D(Rs_D), .Rt_D(Rt_D), .Rd_D(Rd_D), .pc8(pc8), .RegWrite_D(RegWriteD),
			 .MemWrite_D(MemWriteD), .MemtoReg_D(MemtoRegD), .RegDst_D(RegDstD), .ALUSrc_D(ALUSrcD), .ALUOp_D(ALUOpD), .pcsrc_D(pcsrc),
			 .BranchD(BranchD), .Jr_D(JrD), .Jal_D(JalD));
			 
	
	 ID_EX ID_EX(.clk(clk), .reset(reset), .clr(FlushE), .instr(instrD), .RD1(RD1_D), .RD2(RD2_D), .extimm(extimmD), .pc8_D(pc8),
					 .RegWrite_D(RegWriteD), .MemWrite_D(MemWriteD), .MemtoReg_D(MemtoRegD), .RegDst_D(RegDstD), .ALUSrc_D(ALUSrcD), .ALUOp_D(ALUOpD),
					 .Jal_D(JalD), .instr_E(instrE), .RD1_E(RD1_E), .RD2_E(RD2_E), .extimm_E(extimmE), .Rs_E(Rs_E), 
					 .Rt_E(Rt_E), .Rd_E(Rd_E), .pc8_E(pc8E), .RegWrite_E(RegWriteE), .MemWrite_E(MemWriteE), 
					 .MemtoReg_E(MemtoRegE), .RegDst_E(RegDstE), .ALUSrc_E(ALUSrcE), .ALUOp_E(ALUOpE), .Jal_E(JalE));	
					 
	 EX EX(.instr_E(instrE), .RD1(RD1_E), .RD2(RD2_E), .ResultW(ResultW), .ALU_O_M(ALU_OM), .ForwardA_E(ForwardAE), .ForwardB_E(ForwardBE),
			 .Rs_E(Rs_E), .Rt_E(Rt_E), .Rd_E(Rd_E), .extimm(extimmE), .RegDst_E(RegDstE), .ALUSrc_E(ALUSrcE), .ALUOp_E(ALUOpE), 
			 .ALUOut(ALU_OE), .WriteData_E(WriteDataE), .WriteReg_E(WriteRegE), .Rs_Hazard(Rs_Hazard), .Rt_Hazard(Rt_Hazard));
	 
	 EX_ME EX_ME(.clk(clk), .reset(reset), .ALUOut(ALU_OE), .WriteData_E(WriteDataE), .WriteReg_E(WriteRegE), 
					 .pc8_E(pc8E), .RegWrite_E(RegWriteE), .MemtoReg_E(MemtoRegE), .MemWrite_E(MemWriteE), 
					 .Jal_E(JalE), .pc8_M(pc8M), .ALUOut_M(ALU_OM), .WriteData_M(WriteDataM), .WriteReg_M(WriteRegM),
					 .RegWrite_M(RegWriteM), .MemtoReg_M(MemtoRegM), .MemWrite_M(MemWriteM), .Jal_M(JalM));
					 
	 ME ME(.clk(clk), .reset(reset), .MemWrite_M(MemWriteM), .ALUOut_M(ALU_OM), .Jal_M(JalM),.WriteData_M(WriteDataM), 
			 .WriteReg_M(WriteRegM), .MemRD(ReadDataM));
	 
	 ME_WB ME_WB(.clk(clk), .reset(reset), .MemRD(ReadDataM), .ALUOut_M(ALU_OM), .WriteReg_M(WriteRegM), .pc8_M(pc8M),
					 .RegWrite_M(RegWriteM), .MemtoReg_M(MemtoRegM), .ReadData_W(ReadDataW), .ALUOut_W(ALU_OW), .WriteReg_W(WriteRegW),
					 .pc8_W(pc8W), .RegWrite_W(RegWriteW), .MemtoReg_W(MemtoRegW));
					 
	 WB WB(.ReadData_W(ReadDataW), .ALUOut_W(ALU_OW), .MemtoReg_W(MemtoRegW), .WriteReg_W(WriteRegW), .pc8(pc8W), .Result_W(ResultW));
	 
	 Hazard Hazard(.Rs_D(Rs_D), .Rt_D(Rt_D), .Rs_E(Rs_Hazard), .Rt_E(Rt_Hazard), .WriteReg_E(WriteRegE), .WriteReg_M(WriteRegM),
						.WriteReg_W(WriteRegW), .BranchD(BranchD), .JrD(JrD), .JalM(JalM), .MemtoReg_E(MemtoRegE), .RegWrite_E(RegWriteE), .MemtoReg_M(MemtoRegM),
						.RegWrite_M(RegWriteM), .RegWrite_W(RegWriteW), .Stall_F(StallF), .Stall_D(StallD), .Flush_E(FlushE),
						.ForwardA_D(ForwardAD), .ForwardB_D(ForwardBD), .ForwardA_E(ForwardAE), .ForwardB_E(ForwardBE), .ForwardJal(ForwardJal));
	 					
	 
endmodule
/*pc4要初始化为0x00003000*/