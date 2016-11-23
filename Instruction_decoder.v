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
output reg WrPC,
output reg [1:0] SelA,
output reg SelB,
output reg WrAcc,
output reg Op,
output reg WrRam,
output reg RdRam,
input [4:0]Opcode
);

always@*
case(Opcode)
	//HALT: WrPC=0,WrRam=0,RdRam=0
	5'b00000: 
	begin
				WrPC=0;
				SelA=2'b00;
				SelB=0;
				WrAcc=0;
				Op=0;
				WrRam=0;
				RdRam=0;
	end
	//STO: WrPC=1,WrRam=1,RdRam=0,
	5'b00001:			
	begin
				WrPC=1;
				SelA=2'b00;
				SelB=0;
				WrAcc=0;
				Op=0;
				WrRam=1;
				RdRam=0;	
	end
	//LD: WrPC=1,WrRam=0,RdRam=1,SelA=2'b00,WrAcc=1
	5'b00010:			
	begin
				WrPC=1;
				SelA=2'b00;
				SelB=0;
				WrAcc=1;
				Op=0;
				WrRam=0;
				RdRam=1;
	end
	//LDI: WrPC=1, WrRam=0, RdRam=0,WrAcc=1,SelA=2'b01
	5'b00011:			
	begin
				WrPC=1;
				SelA=2'b01;
				SelB=0;
				WrAcc=1;
				Op=0;
				WrRam=0;
				RdRam=0;
	end
	//ADD: WrPC=1,WrRam=0,RdRam=1,SelA=2'b10,SelB=0,WrAcc=1,Op=1
	5'b00100:			
	begin
				WrPC=1;
				SelA=2'b10;
				SelB=0;
				WrAcc=1;
				Op=1;
				WrRam=0;
				RdRam=1;
	end
	//ADDI: WrPC=1,WrRam=0,RdRam=0,SelA=2'b10,SelB=1,Op=1,WrAcc=1
	5'b00101:			
	begin
				WrPC=1;
				SelA=2'b10;
				SelB=1;
				WrAcc=1;
				Op=1;
				WrRam=0;
				RdRam=0;
	end
	//SUB: WrPC=1,SelA=2'b10,SelB=0,WrAcc=1,Op=0,WrRam=0,RdRam=1
	5'b00110:			
	begin
				WrPC=1;
				SelA=2'b10;
				SelB=0;
				WrAcc=1;
				Op=0;
				WrRam=0;
				RdRam=1;
	end
	//SUBI: WrPC=1,WrRam=0,RdRam=0,SelA=2'b10,SelB=1,WrAcc=1,Op=0
	5'b00111:			
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
