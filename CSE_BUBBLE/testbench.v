`include "CSE_Bubble.v"
module MipsCPU_tb;
    //inputs
    reg clk;
    reg rst;
    
    //outputs
    wire [31:0] pc_in, pc_out;
    wire [31:0] inst;
    wire reg_dst, reg_write, alusrc, mem_to_reg, mem_read,mem_write, branch;
    wire [1:0] aluop;
    wire [4:0] write_reg;
    wire [31:0] Data1, Data2;
    wire [31:0] extend32;
    wire [31:0] alu_b;
    wire [31:0] shiftout;
    wire [3:0] aluctrl;
    wire Zero;
    wire [31:0] ALUOut;
    wire [31:0] Add_ALUOut;
    wire AndGateOut;
    wire [31:0] ReadData;
    wire [31:0]write_data_reg;
    
    //instantiate the unit under test (UUT)
    MipsCPU uut (
        //inputs
        .clk(clk),
        .rst(rst),
        //outputs
        .pc_in(pc_in),
        .pc_out(pc_out),
        .inst(inst),
        .reg_dst(reg_dst),
        .reg_write(reg_write),
        .alusrc(alusrc),
        .mem_to_reg(mem_to_reg),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .branch(branch),
        .aluop(aluop),
        .write_reg(write_reg),
        .Data1(Data1),
        .Data2(Data2),
        .extend32(extend32),
        .alu_b(alu_b),
        .shiftout(shiftout),
        .aluctrl(aluctrl),
        .Zero(Zero),
        .ALUOut(ALUOut),
        .Add_ALUOut(Add_ALUOut),
        .AndGateOut(AndGateOut),
        .ReadData(ReadData),
        .write_data_reg(write_data_reg)
    );
    
    //initial block
    initial begin
        //initialize inputs
        // initialize a dumpfile and dumpvars
        $dumpfile("MipsCPU_tb.vcd");
        $dumpvars(0, MipsCPU_tb);
        clk = 0;
        rst = 0;
        #50000 $finish;
    end

    //always block
     always #5 clk = ~clk;
endmodule