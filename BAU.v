`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:09:08 11/17/2016 
// Design Name: 
// Module Name:    BAU 
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
module BAU #(parameter msb=10)
(
input wire [msb:0] A,
input wire [msb:0] B,
input wire Op,
output reg signed [msb:0]Result
);

always @(*)
	case(Op)
		1: Result=A+B;				//ADD
		0: Result=A-B;				//SUB
		default: Result=0;
	endcase
endmodule
