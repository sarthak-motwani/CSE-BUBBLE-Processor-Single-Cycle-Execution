
module Mux1(inst20_16, inst15_11, RegDst, WriteReg);

	input [20:16] inst20_16;
	input [15:11] inst15_11;
	input RegDst;
	
	output reg [4:0] WriteReg;

	always @ (RegDst, inst20_16, inst15_11) begin
		case(RegDst) 
			0 : WriteReg <= inst20_16;
			1 : WriteReg <= inst15_11;
		endcase
	end
endmodule

module Mux2 (ALUSrc, ReadData2, Extend32, ALU_B);

	input ALUSrc;
	input [31:0] ReadData2,Extend32;	
	
	output reg [31:0] ALU_B;
	
	always @(ALUSrc, ReadData2, Extend32) begin
		case (ALUSrc)
			0: ALU_B <= ReadData2 ;
			1: ALU_B <= Extend32;
		endcase
	end
endmodule


module Mux4 (PCout, Add_ALUOut, AndGateOut, PCin);

	input [31:0] PCout, Add_ALUOut;
	input AndGateOut;	
	
	output reg [31:0] PCin;
	
	initial begin
		PCin <= 0;
	end
	
	always @(*) begin
		case (AndGateOut)
			0: PCin <= PCout ;
			1: PCin <= Add_ALUOut;
		endcase
	end
endmodule

module Mux3 (ReadData, ALUOut, MemtoReg, WriteData_Reg);

	input [31:0] ReadData, ALUOut;
	input MemtoReg;	
	
	output wire [31:0] WriteData_Reg;
	assign WriteData_Reg = (MemtoReg==0) ? ALUOut : ReadData;
	
endmodule