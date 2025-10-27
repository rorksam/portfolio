# README:	Simple CPU Project
Authors:	Sam Rork, Professor Oren Segal
Date:		24 October 2025

## Description
This is a simple CPU design including an ALU, separate instruction and data memory, and a control
module. Each module type has a testbench, and the testbench CPU_tb.v tests all functionality.

## Definitions
The instruction memory holds 34 bits per entry, in the following format:

[4-bit operator][10-bit address A][10-bit address B][10-bit address C]

In general, the 4 bit operator defines which ALU operation will be performed on A and B to provide
an output in address C. 

There is one operation computed by the ALU, the Jump function, which points the program counter to
the instruction in address A in instruction memory. 
Ex. [11_10][00_0000_0000][XXXX_XXXX_XX][XX_XXXX_XXXX]
	This instruction word executes the jump command (defined by the operator [1110]) to point 
	the program counter pc at address [00_0000_0000] in the instruction memory.


### ALU
The ALU module has 3 functions, defined in four bits:

[0000]: OR function
[0001]: AND function
[0010]: XOR function

The ALU accepts these 4 bit values for *operation*, a 34 bit value for *operanda* and another 34
bit value for *operandb*, and returns a 34 bit value *result*, which is the result of *operanda*
*operation* *operandb*.

Ex. operation = [0000], operanda = [00_00000000_00000000_00000000_01010101], operandb =
	[00_00000000_00000000_00000000_10101010]. This executes as operanda OR operandb, leading 
	to result returning [00_00000000_00000000_00000000_11111111].

As explained in **Definitions**, if the operation is [1110], the ALU will NOT perform an operation
and Ctrl.v will perform this step on its own. 

### RAM
The RAM module takes 4 inputs and 1 output:
	**INPUTS**
	clock clk;
	write enable we;
	data in din;
	input address addr
	
	**OUTPUT**
	data output dout
	
The RAM is synchronized to the clock which is defined only in a testbench. An array mem[] is
defined which has depth 1 << RAM_SIZE. In the case that write enable is set to 1, the data found in
din will be sent to the memory module at address [addr]. If write enable is set to 0, then the
module is in read-only mode, so the value found in the memory at address [addr] will be placed in
dout.

Ex. we = 1, din = 'd10, addr = 'd0: the value 10 (the value in din) is placed in mem[0] (defined by
	addr). If we = 0, the value found in mem[0] 

### Ctrl
The Ctrl module takes many inputs, sends many outputs, and contains 3 parameters. This module
handles the state machine for the system, walking through the CPU functionality to fetch, interpret
and execute instructions found in instruction memory. The state machine looks as follows:

[WAIT_INS]: 	A pause state, used to delay when memory access takes extra time outside a 
		clock cycle. The next state must be defined before entering this state, as it can
		point to any state. 
		
		Next state: ANY

[FETCH_INS]:	This state loads the instruction index from the program counter, then increments
		the program counter. This instruction passes to WAIT_INS before proceeding. 
		
		Next state: READ_INS_A

[READ_INS_A]:	This is the first of two read states. This parses the instruction and requests 
		the value of address a from data memory. This state passes to WAIT_INS before
		proceeding.
		
		Next state: READ_INS_B
		
[READ_INS_B]:	The second read state, this first handles the CPU_OP_JUMP command. If the operation
		matches the value for CPU_OP_JUMP, the address from operand A is stored in the
		program counter, and the next state will be WAIT_INS. Otherwise, it stores the 
		answer from data ram and requests the value of address B. In this case, this state
		passes to WAIT_INS before proceeding.
		
		Next states: FETCH_INS or EXEC_INS
		
[EXEC_INS]:	This state sends the value for A and B into the ALU with the operation key. 

		Next state: WRITE_INS
		
[WRITE_INS]:	This state receives the result of the ALU and stores it into the addr2w.

		Next state: FETCH_INS
		
### CPU
The top module, this holds all other modules underneath it in the hierarchy. This takes two inputs,
the clock clk and a reset command. It instantiates the ALU, two RAM modules (iRAM and data ram),
and the Ctrl.

##Testbench
The testbench CPU_tb.v loads 4 commands and 7 data values. Before the CPU runs, it prints out all
instructions and data. After runtime, the data values are printed again. A successful run can be
found when data memory indexes 10, 12, and 14 are populated with exepcted values based on the 
operations.
