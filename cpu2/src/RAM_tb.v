`timescale 1ns/1ps  //  time delay/resolution
module RAM_tb();

reg we;
reg clk;
reg [7:0] din;
wire [7:0] dout;
reg [9:0] addr;

always #1 clk = ~clk;

RAM ram(
	.we(we), .clk(clk), .din(din), .dout(dout), .addr(addr)
);

initial
begin
   clk = 0; // need to init clk!
	#2;
	we = 1'b1;
	addr = 2'h00;
	din = 8'b0000_0101;
	#2;
	we = 1'b0;
	//addr = 2'h01;
	#2;
	we = 1'b1;
	addr = 2'h01;
	din = 8'b0001_0101;
	#2;
	we = 1'b0;
	#2;

$display("addr = %d, data = %d", addr, dout);
	
end
endmodule