`include "Defs.vh"

module ALU
	#(
		parameter MEMORY_WORD_SIZE =`MEMORY_WORD_SIZE,
		parameter RAM_SIZE =`RAM_SIZE,
		parameter OPERATOR_SIZE = `OPERATOR_SIZE
	)
	(
	input wire [`MEMORY_WORD_SIZE-1:0] operandA,
	input wire [`MEMORY_WORD_SIZE-1:0] operandB,
	input wire [`OPERATOR_SIZE - 1:0] operation,
	output reg [`MEMORY_WORD_SIZE-1:0] result
	);
// ALU operation based on op code
always @ (*) 
begin : 
   ALU_comb
	case (operation)
		`ALU_OP_AND: result = operandA & operandB ; // AND
		`ALU_OP_OR : result = operandA | operandB ; // OR
		`ALU_OP_XOR: result = operandA ^ operandB; // XOR
	default : result = 8'h00 ; // Default
	endcase
end
endmodule