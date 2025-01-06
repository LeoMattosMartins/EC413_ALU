`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2024 05:51:18 PM
// Design Name: 
// Module Name: FA_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module FA_tb;

	// Inputs
	reg a;
	reg b;
	reg c_in;

	// Outputs
	wire c_out;
	wire sum;

	// Instantiate the Unit Under Test (UUT)
	FA uut (
		.c_out(c_out), 
		.sum(sum), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		c_in = 0;
		#100;
	end
      
	always
#10	{a,b,c_in} = {a,b,c_in}+1;
endmodule
