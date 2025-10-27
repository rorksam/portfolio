`include "Defs.vh"

module Ctrl
	#(
		parameter MEMORY_WORD_SIZE =`MEMORY_WORD_SIZE,
		parameter RAM_SIZE =`RAM_SIZE,
		parameter OPERATOR_SIZE = `OPERATOR_SIZE
	)
	(
	input wire rst,
	// ALU variables
	output reg [`OPERATOR_SIZE - 1:0] op,
	output reg [`OPERAND_SIZE - 1:0] a, 
	output reg [`OPERAND_SIZE - 1:0] b,
	input wire [`OPERAND_SIZE - 1:0] res,

	// RAM variables
	output reg we,
	input wire clk,
	output reg [`MEMORY_WORD_SIZE-1:0] din,
	input wire [`MEMORY_WORD_SIZE-1:0] dout,
	output reg [`RAM_SIZE-1:0] addr,
	
	// output reg weI,
	// output reg [`MEMORY_WORD_SIZE - 1 : 0] dinI,
	input wire [`MEMORY_WORD_SIZE - 1 : 0] doutI,
	output reg [`RAM_SIZE - 1 : 0] addrI
	
);

`define STATE_SIZE 3

localparam FETCH_INS  = `STATE_SIZE'b000;
localparam READ_INS_A = `STATE_SIZE'b001;
localparam READ_INS_B = `STATE_SIZE'b010;
localparam EXEC_INS   = `STATE_SIZE'b011;
localparam WRITE_INS  = `STATE_SIZE'b100;
localparam WAIT_INS   = `STATE_SIZE'b101;
localparam CPU_OP_JUMP = `CPU_OP_JUMP;


// Instruction format:
// {4b operator, 10b operand a addr, 10b operand b addr, 10b result addr}
// Data format:
// {32 bit operand}

	
reg [`RAM_SIZE - 1:0] pc; 
reg [2:0] state,nextState;
reg [`OPERATOR_SIZE - 1:0] alu_op;
reg [`RAM_SIZE - 1:0] addra;
reg [`RAM_SIZE - 1:0] addrb;
reg [`RAM_SIZE - 1:0] addr2w;
reg [`MEMORY_WORD_SIZE - 1:0] operanda;
//reg [`MEMORY_WORD_SIZE - 1:0] operandb;
reg [`MEMORY_WORD_SIZE - 1:0] res2w;

// async reset vs sync
//always @(posedge clk or posedge rst) 
always @(posedge clk) 
begin : ctrl_always
	if (rst)
	begin
	state <= FETCH_INS;
	pc <= 0;
	end
	else
	case (state) 
		WAIT_INS: 
		begin
			state <= nextState;
		end
		FETCH_INS: 
		begin
			we <= 1'b0;
			addrI <= pc;
         pc <= pc + 1'b1;
			state <= WAIT_INS;
			nextState <= READ_INS_A;
		end
		READ_INS_A: 
		begin
		   alu_op = doutI[`MEMORY_WORD_SIZE - 1 : `MEMORY_WORD_SIZE - `OPERATOR_SIZE]; 		// top of ram down to bottom of operation bits
			addra  = doutI[(`MEMORY_WORD_SIZE - `OPERATOR_SIZE) - 1 : (`MEMORY_WORD_SIZE - `OPERATOR_SIZE) - `RAM_SIZE];		// bottom of operation bits, down by the # of address bits
			addrb  = doutI[((`MEMORY_WORD_SIZE - `OPERATOR_SIZE) - `RAM_SIZE) - 1 : (`MEMORY_WORD_SIZE - `OPERATOR_SIZE) - (2 * `RAM_SIZE)];		// bottom of last address, down by the # of address bits
			addr2w = doutI[((`MEMORY_WORD_SIZE - `OPERATOR_SIZE) - (2 * `RAM_SIZE)) - 1 : (`MEMORY_WORD_SIZE - `OPERATOR_SIZE) - (3 * `RAM_SIZE)];			// bottom of last address, down by the # of address bits, should hit 0
			we <= 1'b0;
			addr <= addra;
			state <= WAIT_INS;
			nextState <= READ_INS_B;
		end
		READ_INS_B: 
		begin
		case (alu_op)
			CPU_OP_JUMP:
			begin
				pc <= addr;
				state <= FETCH_INS;
			end
			default : 
			begin
				we <= 1'b0;
				addr <= addrb;
				operanda <= dout;
				state <= WAIT_INS;
				nextState <= EXEC_INS;
			end
		endcase
		end
		EXEC_INS: 
		begin
		   // exec alu op		
			a  <= operanda;
			b  <= dout;
			op <= alu_op;
			state <= WRITE_INS;
		end
		WRITE_INS: 
		begin
		   // write mem
			we <= 1'b1;
			addr <= addr2w;
			din <= res;
			state <= FETCH_INS;
		end		
	endcase
end
endmodule