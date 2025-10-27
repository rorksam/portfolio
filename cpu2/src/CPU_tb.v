`include "Defs.vh"

`timescale 1ns/1ps  //  time delay/resolution

`define SIM_STEPS 30
`define RAM_RANGE 20


module CPU_tb();

// cpu wires
reg clk;
reg rst;
integer i;

CPU cpu(.clk(clk),.rst(rst)); 

// alt way to describe clock
//initial 
//begin
//	clk = 0; // need to init clk!
//   forever #(1) clk = ~clk; // Toggle clock every half period
//end
always #1 clk = ~clk;

initial 
begin
	clk = 0; // need to init clk!
	rst = 1;
	#2
	rst = 0;
	//////////////////
	// instruction mem [MOVED TO iRAM ASSIGNMENTS]
	//////////////////
	
	/*
	cpu.ram.mem[0] = {`ALU_OP_AND,10'd008,10'd009,10'd010};
	cpu.ram.mem[1] = {`CPU_OP_JUMP,10'd004,10'd000,10'd000};
	cpu.ram.mem[4] = {`ALU_OP_OR,10'd010,10'd011,10'd012};
	*/
	
	//////////////////
	// iRAM assignments
	//////////////////
	cpu.iRAM.mem[0] = {`ALU_OP_OR,10'd008,10'd009,10'd010};
	cpu.iRAM.mem[1] = {`CPU_OP_JUMP,10'd004,10'd000,10'd000};
	cpu.iRAM.mem[4] = {`ALU_OP_AND,10'd010,10'd011,10'd012};
	cpu.iRAM.mem[5] = {`ALU_OP_XOR,10'd12,10'd13,10'd14};
	//////////////////
	// data mem
	//////////////////
	cpu.ram.mem[8]  = 32'b00000000_10001001_00000000_00000101;
	cpu.ram.mem[9]  = 32'b00000000_10001000_00000000_00000110;
	cpu.ram.mem[10] = 32'b00000000_00000000_00000000_00000000;
	cpu.ram.mem[11] = 32'b00000000_11111001_00000000_00000101;
	cpu.ram.mem[12] = 32'b00000000_00000000_00000000_00000000;
	cpu.ram.mem[13] = 32'b00000000_10001001_00000000_11111111;
	cpu.ram.mem[14] = 32'b00000000_00000000_00000000_00000000;
	
	// show memory before run
	$display("iRAM before run:");
	for (i = 0; i < `RAM_RANGE; i = i+1) 
	begin
		$display("instruction addr = %03d, instruction = %b", i, cpu.iRAM.mem[i]);
	end
	
	$display("\n\ndata ram before run:");
	for (i = 0; i < `RAM_RANGE; i = i+1) 
	begin
		$display("addr = %03d, data = %b", i, cpu.ram.mem[i]);
	end
	
	
	#2
	$display("CPU in action");	
	for (i = 0; i < `SIM_STEPS; i = i+1) 
	begin
		#2;
		$display("addr = %d, dataIn = %d, dataOut = %d", cpu.addrW, cpu.dinW, cpu.doutW);
	end

	// show memory after run
	$display("RAM after run:");
	for (i = 0; i < `RAM_RANGE; i = i+1) 
	begin
		$display("addr = %03d, data = %b", i, cpu.ram.mem[i]);
	end

	$stop;
  
end

endmodule