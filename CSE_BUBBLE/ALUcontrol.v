module ALUControl (ALUOp, FuncCode, ALUCtl);

	input [1:0] ALUOp;
	input [5:0] FuncCode;
	output reg [3:0] ALUCtl;
	
	always @(ALUOp, FuncCode) begin
	if(ALUOp == 0)
		ALUCtl <= 2;    
	else if(ALUOp == 1)
		ALUCtl <= 6;		
	else if(ALUOp == 3)
		ALUCtl <= 13;		
	else
		case(FuncCode)
			32: ALUCtl <= 2;
			34: ALUCtl <= 6; 	
			36: ALUCtl <= 0; 
			37: ALUCtl <= 1; 	
			39: ALUCtl <= 12;
			42: ALUCtl <= 7; 
			default: ALUCtl <= 15; 
		endcase
	end
endmodule