`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2024 03:15:11 PM
// Design Name: 
// Module Name: Nbit_ALU_Register
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


module Nbit_ALU_Register (r2, r3, ALUop, r0, clk);
parameter n = 32;

input[n-1:0] r2, r3;
input[2:0] ALUop;
input clk;
output [n-1:0] r0;

wire[n-1:0] r1;
// put ALU and store in register together
Nbit_ALU #(n) alu1 (.r1(r1), .r2(r2), .r3(r3), .ALUop(ALUop) );
Nbit_Register #(n) reg1 (.outo(r0), .ino(r1), .clk(clk) );





endmodule
