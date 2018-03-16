`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:11:00 12/05/2016 
// Design Name: 
// Module Name:    DM 
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
module DM(
    input clk,
	 input reset,
    input [31:0] MemAddr,
    input [31:0] MemData,
    input MemWrite_M,	 
    output [31:0] MemRD	//DM中输出的数
    );
	 
	 reg [31:0] _reg[1023:0];
	 
	 integer i;
	 
	 initial begin
		for(i=0;i<1024;i=i+1)
			_reg[i]<=0;
	 end
	 
	 always@(posedge clk)begin
		if(reset)begin
			for(i=0;i<1024;i=i+1)
				_reg[i]<=0;
		end
		else begin
			if(MemWrite_M)begin
				_reg[MemAddr[11:2]] <= MemData;
				$display("*%h <= %h",MemAddr, MemData);
			end
		end
	 end
	 
	 assign MemRD = _reg[MemAddr[11:2]];

endmodule