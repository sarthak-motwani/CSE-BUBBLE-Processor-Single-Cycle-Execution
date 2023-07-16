
module DataMemory (clock, address, MemWrite, MemRead, WriteData, ReadData);

	input clock;
	input [6:0] address;
	input MemWrite, MemRead;
	input [31:0] WriteData; 
	
	output reg [31:0] ReadData;

	reg [31:0] Mem[0:127]; 

	initial begin
		Mem[0] = 0;
		//sorting from mem[11] to mem[20]
		Mem[11] = 80;
		Mem[12] = 10;
		Mem[13] = 0;
		Mem[14] = 3;
		Mem[15] = 7;
		Mem[16] = 9;
		Mem[17] = 2;
		Mem[18] = 70;
		Mem[19] = 25;
		Mem[20] = 0;

		#45000
		$display("%d\n", Mem[11]);
		$display("%d\n", Mem[12]);
		$display("%d\n", Mem[13]);
		$display("%d\n", Mem[14]);
		$display("%d\n", Mem[15]);
		$display("%d\n", Mem[16]);
		$display("%d\n", Mem[17]);
		$display("%d\n", Mem[18]);
		$display("%d\n", Mem[19]);
		$display("%d\n", Mem[20]);
		end
	
	always @ (negedge clock) begin
	
		if (MemWrite == 1) begin
			Mem[address[6:0]] <= WriteData;
		//	$display("Address: %d", address[6:0]);
		//	$display("Data Written: %d", WriteData);
		end
	end
	
	always @(*) begin
		if (MemRead == 1) begin
			ReadData <= Mem[address[6:0]];
	end
	end
endmodule








