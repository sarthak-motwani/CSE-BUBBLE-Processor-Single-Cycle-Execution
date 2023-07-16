
module RegFile(clock, RegWrite, ReadReg1, ReadReg2, WriteReg, WriteData, ReadData1, ReadData2);

	input clock;
	input RegWrite;
	
	input [4:0] ReadReg1, ReadReg2, WriteReg;
	input [31:0] WriteData;
		
	output [31:0] ReadData1, ReadData2;
	
	reg [31:0] reg_mem [0:31];
	initial begin
		reg_mem[0] <= 0;
		reg_mem[1] <= 11; //$s7
		reg_mem[2] <= 0; //$s0
		reg_mem[3] <= 9; //$s6 #n-1
		reg_mem[4] <= 0; //$s1
		reg_mem[5] <= 0; //$t7
		reg_mem[6] <= 20; //$t0
		reg_mem[7] <= 20; //$t1
		reg_mem[8] <= 20; //$t2
		reg_mem[9] <= 20; //$s5
	end
	assign ReadData1 = reg_mem[ReadReg1];
	assign ReadData2 = reg_mem[ReadReg2];
	
	always @(negedge clock) begin
		if (RegWrite == 1)
			reg_mem[WriteReg] = WriteData;
	end	
endmodule