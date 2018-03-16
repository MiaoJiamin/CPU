`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:14:07 11/30/2016 
// Design Name: 
// Module Name:    RF 
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
module RF(
    input clk,
    input reset,
	 input RegWriteW,
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,
    input [31:0] WD,
    output [31:0] RD1,
    output [31:0] RD2
    );
	 
	 integer i;
	 reg [31:0] _grf [31:0];
	 
	 always @(negedge clk)begin
		if(reset)begin
			for(i = 0; i < 32; i = i + 1)
				_grf[i] <= 0;
		end
		else begin
			if(RegWriteW)begin
				if(A3!=0)begin
					_grf[A3] <= WD;
					$display("$%d <= %h",A3,WD);
				end
				
			end
		end
	 end
	 
	 assign RD1 = (A1==0 ? 0 :_grf[A1]);
	 assign RD2 = (A2==0 ? 0 :_grf[A2]);

endmodule
