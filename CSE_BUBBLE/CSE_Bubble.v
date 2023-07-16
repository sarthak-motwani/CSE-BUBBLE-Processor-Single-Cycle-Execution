
`include "ALU.v"
`include "ALUControl.v"
`include "AndGate.v"
`include "Memory.v"
`include "Instruction.v"
`include "MC.v"
`include "Muxes.v"
`include "Programcounter.v"
`include "RegFile.v"
`include "ShiftLeft2.v"
`include "SignExtend.v"

module MipsCPU(clk, rst, 
					pc_in,pc_out,
					inst,
					reg_dst, reg_write, alusrc, mem_to_reg, mem_read, mem_write, branch,
					aluop,
					write_reg,
					Data1, Data2,
					extend32,
					alu_b,
					shiftout,
					aluctrl,
					Zero,
					ALUOut,
					Add_ALUOut,
					AndGateOut,
					ReadData,
					write_data_reg);
					
	input clk;
	input rst;
	output wire [31:0] pc_in, pc_out;
	output wire [31:0] inst;
	output wire reg_dst, reg_write, alusrc, mem_to_reg, mem_read, mem_write, branch;
	output wire [1:0] aluop;
	output wire [4:0]  write_reg;
	output wire [31:0] Data1, Data2;
	output wire[31:0] write_data_reg;
	output wire [31:0] extend32;output wire [31:0] alu_b;output wire [31:0] shiftout;output wire [3:0] aluctrl;
	output wire Zero;
	output wire [31:0] ALUOut;
	output wire [31:0] Add_ALUOut;
	output wire AndGateOut;
	output wire [31:0] ReadData;
	//Connection of PC
	
	PC pc_0(
		//inputs
		.clock(clk),
		.reset(rst),
		.PCin(pc_in),
		//outputs
		.PCout(pc_out)	
	);
	
	
	InstMem instmem_0(
		//inputs
		.clock(clk),
		.address(pc_in),
		//outputs
		.inst(inst)	
	);
	
	
	MainControl main_control_0(
// inputs
.opcode(inst[31:26]),
// outputs
.reg_dst(reg_dst),
.reg_write(reg_write),
.alu_src(alusrc),
.mem_to_reg(mem_to_reg),
.mem_read(mem_read),
.mem_write(mem_write),
.branch(branch),
.alu_op(aluop)
);


	
	
	Mux1 mux1_0(
		//inputs
		.inst20_16(inst[20:16]),
		.inst15_11(inst[15:11]),
		.RegDst(reg_dst),
		//outputs
		.WriteReg(write_reg)	
	);
	

	RegFile regfile_0(
		//inputs
		.clock(clk),
		.ReadReg1(inst[25:21]),
		.ReadReg2(inst[20:16]),
		.RegWrite(reg_write),
		.WriteReg(write_reg),	
		.WriteData(write_data_reg),
		//outputs
		.ReadData1(Data1),
		.ReadData2(Data2)	
	);
	
	
	SignExtend sign_extend_0(
		//inputs
		.inst15_0(inst[15:0]),
		//outputs
		.Extend32(extend32)
	);
	
	
	Mux2 mux2_0(
		//inputs
		.ALUSrc(alusrc),
		.ReadData2(Data2),
		.Extend32(extend32),
		//outputs
		.ALU_B(alu_b)	
	);
	
	
	assign shiftout = extend32;

	
	ALUControl alu_control_0(
		//inputs
		.ALUOp(aluop),
		.FuncCode(inst[5:0]),
		//outputs
		.ALUCtl(aluctrl)	
	);
	

	ALU alu_0(
		//inputs
		.A(Data1),
		.B(alu_b),
		.ALUCtl(aluctrl),
		//outputs
		.ALUOut(ALUOut),
		.Zero(Zero)
	);

	wire dummy;
	
	ALU alu_1(
		//inputs
		.A(pc_out),
		.B(shiftout),
		.ALUCtl(4'd2),
		//outputs
		.ALUOut(Add_ALUOut),
		.Zero(dummy)
	);
	

	and_gate and_gate_0(
	//inputs
	.Branch(branch),
	.Zero(Zero),
	//outputs
	.AndGateOut(AndGateOut)
);

	
	Mux4 mux4_0(
		//inputs
		.PCout(pc_out),
		.Add_ALUOut(Add_ALUOut),
		.AndGateOut(AndGateOut),
		//outputs
		.PCin(pc_in)
	);
	
	DataMemory  data_memory_0(
		//inputs
		.clock(clk),
		.address(ALUOut[6:0]),
		.MemWrite(mem_write),
		.MemRead(mem_read),
		.WriteData(Data2),
		//outputs
		.ReadData(ReadData)
	);
	
	Mux3 mu3_0(
	//inputs
	.MemtoReg(mem_to_reg),
	.ReadData(ReadData),
	.ALUOut(ALUOut),
	//outputs
	.WriteData_Reg(write_data_reg)
	);	
endmodule