
module MainControl(
input [5:0] opcode,
output reg reg_dst, reg_write, alu_src,
output reg mem_to_reg, mem_read, mem_write,
output reg branch,
output reg [1:0] alu_op
);

always @(*) begin
case(opcode)
0: begin
				reg_dst		<= 1;
				alu_src 		<= 0;
				mem_to_reg		<= 0;
				reg_write		<= 1;
				mem_read	<= 0;
				mem_write		<= 0;
				branch	<= 0;
				alu_op		<= 2'b10;
			end
4, 5: begin
reg_dst <= 0;
alu_src <= 0;
mem_to_reg <= 0;
reg_write <= 0;
mem_read <= 0;
mem_write <= 0;
branch <= 1;
alu_op <= opcode == 4 ? 2'b01 : 2'b11;
end
8, 35: begin
reg_dst <= 0;
alu_src <= 1;
mem_to_reg <= opcode == 35 ? 1 : 0;
reg_write <= 1;
mem_read <= opcode == 35 ? 1 : 0;
mem_write <= 0;
branch <= 0;
alu_op <= 2'b00;
end
43: begin
reg_dst <= 0;
alu_src <= 1;
mem_to_reg <= 0;
reg_write <= 0;
mem_read <= 0;
mem_write <= 1;
branch <= 0;
alu_op <= 2'b00;
end
endcase
end
endmodule







	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

























