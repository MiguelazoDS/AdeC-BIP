`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:22:35 11/17/2016 
// Design Name: 
// Module Name:    Instruction_decoder 
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
module Instruction_decoder
( 
WrPC,SelA,SelB,WrAcc,Op,WrRam,RdRam,Opcode
);
	output reg WrPC;
	output reg [1:0] SelA;
	output reg SelB;
	output reg WrAcc;
	output reg Op;
	output reg WrRam;
	output reg RdRam;
	input [4:0]Opcode;

always@*
case(Opcode)
	5'b00000: 
	begin
				WrPC=0; //HALT	
				SelA=0;
				SelB=0;
				WrAcc=0;
				Op=0;
				WrRam=0;
				RdRam=0;
	end			
	5'b00001:			//STO
	begin
				WrPC=1;
				SelA=0;
				SelB=0;
				WrAcc=0;
				Op=0;
				WrRam=1;
				RdRam=0;	
	end
	5'b00010:			//LD
	begin
				WrPC=1;
				SelA=2'b00;
				SelB=0;
				WrAcc=1;
				Op=0;
				WrRam=0;
				RdRam=1;
	end
	5'b00011:			//LDI
	begin
				WrPC=1;
				SelA=2'b01;
				SelB=0;
				WrAcc=1;
				Op=0;
				WrRam=0;
				RdRam=0;
	end
	5'b00100:			//ADD
	begin
				WrPC=1;
				SelA=2'b10;
				SelB=0;
				WrAcc=1;
				Op=1;
				WrRam=0;
				RdRam=1;
	end
	5'b00101:			//ADDI
	begin
				WrPC=1;
				SelA=2'b10;
				SelB=1;
				WrAcc=1;
				Op=1;
				WrRam=0;
				RdRam=0;
	end
	5'b00110:			//SUB
	begin
				WrPC=1;
				SelA=2'b10;
				SelB=0;
				WrAcc=1;
				Op=0;
				WrRam=0;
				RdRam=1;
	end
	5'b00111:			//SUBI
	begin
				WrPC=1;
				SelA=2'b10;
				SelB=1;
				WrAcc=1;
				Op=0;
				WrRam=0;
				RdRam=0;	
	end
	default:
	begin
				WrPC=0;
				SelA=2'b00;
				SelB=0;
				WrAcc=0;
				Op=0;
				WrRam=0;
				RdRam=0;
	end
	endcase
endmodule
