//���ü���ʽ����
module control_D(                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
	 input [31:0] instr,
	 input zero,
	 output RegWriteD,
	 output MemWriteD,
	 output [1:0] MemtoRegD,
	 output [1:0] RegDstD,
	 output ALUSrcD,
	 output [2:0] ALUOpD,
	 output EXTOpD,		
	 output [1:0] pcsrcD,
	 output BranchD,
	 output JrD,
	 output JalD
    );
	 
	 reg RegWrite;			//�Ĵ���дʹ��
	 reg MemWrite;			//DMдʹ��
	 reg [1:0]MemtoReg;	//�Ĵ���д������ѡ��	00 ALUOut; 01 DMOut; 10 pc4
	 reg [1:0] RegDst;			//�Ĵ���A3ѡ��	0 rd; 1 rt
	 reg ALUSrc;			//ALU�ڶ���������ѡ��	0 RD2; 1 imm
	 reg [2:0] ALUOp;		//ALU����ѡ��	
	 reg EXTOp;				//EXTѡ��	0 sign; 1 zero
	 reg [1:0]pcsrc;				//npcѡ���ź�	
	 reg Branch;
	 reg Jr;
	 reg Jal;
	 
	 initial begin
		RegWrite <= 0;
		MemWrite <= 0;
		MemtoReg <= 0;
		RegDst <= 0;
		ALUSrc <= 0;
		ALUOp <= 0;
		EXTOp <= 0;
		pcsrc <= 0;
		Branch <= 0;
		Jr <= 0;
		Jal <= 0;
	 end
	 
	 assign RegWriteD = RegWrite;
	 assign MemWriteD = MemWrite;
	 assign MemtoRegD = MemtoReg;
	 assign RegDstD = RegDst;
	 assign ALUSrcD = ALUSrc;
	 assign ALUOpD = ALUOp;
	 assign pcsrcD = pcsrc;
	 assign EXTOpD = EXTOp;
	 assign BranchD = Branch;
	 assign JrD = Jr;
	 assign JalD = Jal;
	 
	 always @(*)begin
		case(instr[31:26])	//R��ָ��
			6'b000000:begin	
				if(instr[5:0]==6'b100000)begin	//add
					RegWrite <= 1'b1;
					MemWrite <= 1'b0;
					MemtoReg <= 2'b00;
					RegDst <= 2'b00;
					ALUSrc <= 1'b0;
					ALUOp <= 3'b000;
					pcsrc <= 2'b00;
					Branch <= 1'b0;
					Jr <= 1'b0;
					Jal <= 1'b0;
				end
				else if(instr[5:0]==6'b100001)begin	//addu
					RegWrite <= 1'b1;
					MemWrite <= 1'b0;
					MemtoReg <= 2'b00;
					RegDst <= 2'b00;
					ALUSrc <= 1'b0;
					ALUOp <= 3'b000;
					pcsrc <= 2'b00;
					Branch <= 1'b0;
					Jr <= 1'b0;
					Jal <= 1'b0;
				end
				else if(instr[5:0]==6'b100010)begin	//sub
					RegWrite <= 1'b1;
					MemWrite <= 1'b0;
					MemtoReg <= 2'b00;
					RegDst <= 2'b00;
					ALUSrc <= 1'b0;
					ALUOp <= 3'b001;
					pcsrc <= 2'b00;
					Branch <= 1'b0;
					Jr <= 1'b0;
					Jal <= 1'b0;
				end
				else if(instr[5:0]==6'b100011)begin	//subu
					RegWrite <= 1'b1;
					MemWrite <= 1'b0;
					MemtoReg <= 2'b00;
					RegDst <= 2'b00;
					ALUSrc <= 1'b0;
					ALUOp <= 3'b001;
					pcsrc <= 2'b00;
					Branch <= 1'b0;
					Jr <= 1'b0;
					Jal <= 1'b0;
				end
				else if(instr[5:0]==6'b001000)begin	//jr
					RegWrite <= 1'b0;
					MemWrite <= 1'b0;
					pcsrc <= 2'b11;
					Branch <= 1'b0;
					Jr <= 1'b1;
					Jal <= 1'b0;
				end
				else if(instr[5:0]==6'b000000&&(instr!=32'h00000000))begin	//sll
					RegWrite <= 1'b1;
					MemWrite <= 1'b0;
					MemtoReg <= 2'b00;
					RegDst <= 2'b00;
					ALUSrc <= 1'b0;
					ALUOp <= 3'b110;
					pcsrc <= 2'b00;
					Branch <= 1'b0;
					Jr <= 1'b0;
					Jal <= 1'b0;
				end
				else if(instr[5:0]==6'b000010)begin	//srl
					RegWrite <= 1'b1;
					MemWrite <= 1'b0;
					MemtoReg <= 2'b00;
					RegDst <= 2'b00;
					ALUSrc <= 1'b0;
					ALUOp <= 3'b111;
					pcsrc <= 2'b00;
					Branch <= 1'b0;
					Jr <= 1'b0;
					Jal <= 1'b0;
				end
				else if(instr[5:0]==6'b100100)begin	//and
					RegWrite <= 1'b1;
					MemWrite <= 1'b0;
					MemtoReg <= 2'b00;
					RegDst <= 2'b00;
					ALUSrc <= 1'b0;
					ALUOp <= 3'b010;
					pcsrc <= 2'b00;
					Branch <= 1'b0;
					Jr <= 1'b0;
					Jal <= 1'b0;
				end
				else if(instr[5:0]==6'b100101)begin //or
					RegWrite <= 1'b1;
					MemWrite <= 1'b0;
					MemtoReg <= 2'b00;
					RegDst <= 2'b00;
					ALUSrc <= 1'b0;
					ALUOp <= 3'b011;
					pcsrc <= 2'b00;
					Branch <= 1'b0;
					Jr <= 1'b0;
					Jal <= 1'b0;
				end
				else if(instr[5:0]==6'b100110)begin	//xor
					RegWrite <= 1'b1;
					MemWrite <= 1'b0;
					MemtoReg <= 2'b00;
					RegDst <= 2'b00;
					ALUSrc <= 1'b0;
					ALUOp <= 3'b100;
					pcsrc <= 2'b00;
					Branch <= 1'b0;
					Jr <= 1'b0;
					Jal <= 1'b0;
				end
				else begin
					RegWrite <= 0;
					MemWrite <= 0;
					MemtoReg <= 0;
					RegDst <= 0;
					ALUSrc <= 0;
					ALUOp <= 0;
					EXTOp <= 0;
					pcsrc <= 0;
					Branch <= 0;
					Jr <= 1'b0;
					Jal <= 1'b0;
				end
			end
			
			6'b001000:begin		//addi
				RegWrite <= 1'b1;
				MemWrite <= 1'b0;
				MemtoReg <= 2'b00;
				RegDst <= 2'b01;
				ALUSrc <= 1'b1;
				ALUOp <= 3'b000;
				EXTOp <= 1'b0;
				pcsrc <= 2'b00;
				Branch <= 1'b0;
				Jr <= 1'b0;
				Jal <= 1'b0;
			end
			
			6'b001001:begin	//addiu
				RegWrite <= 1'b1;
				MemWrite <= 1'b0;
				MemtoReg <= 2'b00;
				RegDst <= 2'b01;
				ALUSrc <= 1'b1;
				ALUOp <= 3'b000;
				EXTOp <= 1'b0;
				pcsrc <= 2'b00;
				Branch <= 1'b0;
				Jr <= 1'b0;
				Jal <= 1'b0;
			end
			
			6'b000100:begin	//beq
				RegWrite <= 1'b0;
				MemWrite <= 1'b0;
				EXTOp <= 1'b0;
				Branch <= 1'b1;
				Jr <= 1'b0;
				Jal <= 1'b0;
				if(zero)
					pcsrc <= 2'b01;
				else
					pcsrc <= 2'b00;
			end
			
			6'b000101:begin	//bne
				RegWrite <= 1'b0;
				MemWrite <= 1'b0;
				EXTOp <= 1'b0;
				Branch <= 1'b1;
				Jr <= 1'b0;
				Jal <= 1'b0;
				if(zero)
					pcsrc <= 2'b00;
				else
					pcsrc <= 2'b01;
			end
			
			6'b000010:begin	//j
				RegWrite <= 1'b0;
				MemWrite <= 1'b0;
				EXTOp <= 1'b0;
				pcsrc <= 2'b10;
				Branch <= 1'b0;
				Jr <= 1'b0;
				Jal <= 1'b0;
			end
			
			6'b000011:begin	//jal
				RegWrite <= 1'b1;
				MemWrite <= 1'b0;
				MemtoReg <= 2'b10;
				RegDst <= 2'b10;
				EXTOp <= 1'b0;
				pcsrc <= 2'b10;
				Branch <= 1'b0;
				Jr <= 1'b0;
				Jal <= 1'b1;
			end
			
			6'b100011:begin	//lw
				RegWrite <= 1'b1;
				MemWrite <= 1'b0;
				MemtoReg <= 2'b01;
				RegDst <= 2'b01;
				ALUSrc <= 1'b1;
				ALUOp <= 3'b000;
				EXTOp <= 1'b0;
				pcsrc <= 2'b00;
				Branch <= 1'b0;
				Jr <= 1'b0;
				Jal <= 1'b0;
			end
			
			6'b101011:begin	//sw
				RegWrite <= 1'b0;
				MemWrite <= 1'b1;
				ALUSrc <= 1'b1;
				ALUOp <= 3'b000;
				EXTOp <= 1'b0;
				pcsrc <= 2'b00;
				Branch <= 1'b0;
				Jr <= 1'b0;
				Jal <= 1'b0;
			end
			
			6'b001111:begin	//lui
				RegWrite <= 1'b1;
				MemWrite <= 1'b0;
				MemtoReg <= 2'b00;
				RegDst <= 2'b01;
				ALUSrc <= 1'b1;
				ALUOp <= 3'b101;
				EXTOp <= 1'b0;
				pcsrc <= 2'b00;
				Branch <= 1'b0;
				Jr <= 1'b0;
				Jal <= 1'b0;
			end
			
			6'b001101:begin	//ori
				RegWrite <= 1'b1;
				MemWrite <= 1'b0;
				MemtoReg <= 2'b00;
				RegDst <= 2'b01;
				ALUSrc <= 1'b1;
				ALUOp <= 3'b011;
				EXTOp <= 1'b1;
				pcsrc <= 2'b00;
				Branch <= 1'b0;
				Jr <= 1'b0;
				Jal <= 1'b0;
			end
			
			default: begin
				RegWrite <= 0;
				MemWrite <= 0;
				MemtoReg <= 0;
				RegDst <= 0;
				ALUSrc <= 0;
				ALUOp <= 0;
				EXTOp <= 0;
				pcsrc <= 0;
				Branch <= 0;
				Jr <= 1'b0;
				Jal <= 1'b0;
			end
				
		endcase
	 end

endmodule
