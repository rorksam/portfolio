`include "Defs.vh"

module RAM 
	#(
		parameter MEMORY_WORD_SIZE =`MEMORY_WORD_SIZE,
		parameter RAM_SIZE =`RAM_SIZE 
	)
	(
	input wire clk,
	input wire we,
	input wire [`MEMORY_WORD_SIZE-1:0] din,
	output reg [`MEMORY_WORD_SIZE-1:0] dout,
	input wire [`RAM_SIZE-1:0] addr
);

localparam RAM_DEPTH = 1 << `RAM_SIZE;

//reg [`MEMORY_WORD_SIZE-1:0] mem [0: 2 ** `RAM_SIZE -1];
reg [`MEMORY_WORD_SIZE-1:0] mem [0: RAM_DEPTH-1];

always @(posedge clk)
begin : RAM_abpe
	if(we)
		mem[addr] <= din;
	else
		dout <= mem[addr];

end
endmodule