`ifndef DEFS_VH
`define DEFS_VH

`define OPERAND_SIZE 		34		// size of elements sent into ALU
`define OPERATOR_SIZE 		4 		// # bits for operator 
`define MEMORY_WORD_SIZE 	34		// # bits for ram data
`define RAM_SIZE 				10		// # bits for ram address

`define ALU_OP_AND 	'b0000			// command for AND function for ALU
`define ALU_OP_OR  	'b0001			// command for OR function for ALU
`define ALU_OP_XOR 	'b0010			// command for XOR function for ALU
`define CPU_OP_JUMP	'b1110

`endif