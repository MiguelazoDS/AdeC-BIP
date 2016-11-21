`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:23:58 11/17/2016 
// Design Name: 
// Module Name:    Control 
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
module Control
(
	Instruction,SelA,SelB,Op,WrAcc,WrPC,WrRam,RdRam,Opcode,clock,PC,Operand,Result,reset
);

input wire clock;
input wire [15:0] Instruction;
output wire WrPC;
output wire SelA;
output wire SelB;
output wire Op;
output wire WrAcc;
output wire WrRam;
output wire RdRam;
output reg [4:0] Opcode;
output reg [10:0] Operand;
output reg [10:0] PC;
reg [10:0] PC_next;
output wire [10:0] Result; 
input wire reset;
reg OpPC;
reg [10:0]Constante;

always@*
begin
	PC_next=PC;
	if(WrPC)
		PC_next=Result;
end

always@(posedge clock,posedge reset)
begin 
		if(reset)
		begin
			PC<=0;
			OpPC=1;
			Constante=1;
		end
		else
		begin
			PC<=PC_next;
			Opcode<=Instruction[15:11];
			Operand<=Instruction[10:0];
		end
end

Instruction_decoder ID1
(		
		.WrPC(WrPC),
		.SelA(SelA),
		.SelB(SelB),
		.WrAcc(WrAcc),
		.Op(Op),
		.WrRam(WrRam),
		.RdRam(RdRam),
		.Opcode(Opcode)
);

BAU BAU1
(		
		.A(PC), 
		.B(Constante), 
		.Op(OpPC),
		.Result(Result)
);
	


endmodule
