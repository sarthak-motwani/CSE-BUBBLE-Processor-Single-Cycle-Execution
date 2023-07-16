# CSE-BUBBLE-Processor-Single-Cycle-Execution
This repository contains the implementation of Single-Cycle Execution Processor in Verilog, utilizing a 32-bit ISA (Instruction Set Architecture). 

#To Run the Verilog Code
After changing to the CSE_BUBBLE directory that contains testbench.v,
```bash
iverilog -o testbench.vvp testbench.v
vvp testbench.vvp
```
# Note
```bash
The array stored in Memory.v in the Memory.
We are sorting the array from Mem[11] to Mem[20]
We are sorting 10 elements. So n-1 = 9
If one wants to sort the array for some other n, change 
the value of n-1 (which is currently = 9, in reg_mem[3] in RegFile.v) to
the new value of n-1.

Instructions Decode:
add $t7, $s1, $zero => {0, 4, 0, 5, 0, 32} => 000000 00100 00000 00101 00000 100000
add $t7, $s7, $t7  => {0, 1, 5, 5, 0, 32}  => 000000 00001 00101 00101 00000 100000
lw $t0, 0($t7)     => {35, 5, 6, 0}	       => 100011 00101 00110 0000000000000000
lw $t1, 4($t7)     => {35, 5, 7, 1}        => 100011 00101 00111 0000000000000001
slt $t2, $t0, $t1  => {0, 6, 7, 8, 0, 42}  => 000000 00110 00111 01000 00000 101010
bne $t2, $zero, increment  => {5, 8, 0, 2} => 000101 01000 00000 0000000000000010
sw $t1, 0($t7) 			   => {43, 5, 7, 0} =>101011 00101 00111 0000000000000000
sw $t0, 4($t7)             => {43, 5, 6, 1} =>101011 00101 00110 0000000000000001
addi $s1, $s1, 1		   => {8, 4, 4, 1} => 001000 00100 00100 0000000000000001
sub $s5, $s6, $s0 		   => {0, 3, 2, 9, 0, 34 } =>000000 00011 00010 01001 00000 100010
bne  $s1, $s5, loop		   => {5, 4, 9, -11} =>000101 00100 01001 1111111111110101
addi $s0, $s0, 1 		   => {8, 2, 2, 1}  => 001000 00010 00010 0000000000000001
lw $s1, 0($zero) 		   => {35, 0, 4, 0} => 100011 00000 00100 0000000000000000
bne  $s0, $s6, loop		   => {5, 2, 3, -14} => 000101 00010 00011 1111111111110010
```
