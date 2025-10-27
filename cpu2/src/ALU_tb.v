//`timescale <time_unit>/<time_precision>
`timescale 1ns / 1ps 

module ALU_tb(); // no input or output for a test bench!
  reg [7:0] a, b;
  reg [1:0] op;
  wire [7:0] c;
  
  integer i;

  ALU alu(.operandA(a), .operandB(b), .operation(op), .result(c));

  initial begin
    a = 0;
	 b = 0;
	 op = 0;

    $monitor ("T=%0t a=%0b b=%0b c=%0b", $time, a, b, op, c);
	 
	 for (i = 0; i < 10; i = i+1) 
	 begin
    	#1 	
		a  = i;
      b  = i+1;
		op = i % 4;
    end
	 #1
	 // end simulation
	 //$finish; -> will try to close simulator app
	 // just stop simulation
	 $stop;
  end
endmodule