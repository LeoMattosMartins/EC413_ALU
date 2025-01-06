`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2024 01:19:39 PM
// Design Name: 
// Module Name: Nbit_Register
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
module Nbit_Register(outo, ino, clk);

parameter n = 32;

input [n-1:0] ino;
output [n-1:0] outo;
input clk;

genvar i;

// dff for each of the bits
generate
for (i = 0; i < n; i = i + 1) begin: registerblk
dff Dflipflop(.q(outo[i]) , .d(ino[i]), .clk(clk) );
end
endgenerate

endmodule

