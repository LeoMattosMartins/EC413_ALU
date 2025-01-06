`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2024 07:25:52 PM
// Design Name: 
// Module Name: Nbit_ALU_tb
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


module Nbit_ALU_tb;

parameter n = 32;

reg[n-1:0] r2, r3;
reg[2:0] ALUop;
reg clk;
wire[n-1:0] r1, r1_v;
wire errorFlag;

Nbit_ALU_Register #(n) uut (.r0(r1), .r2(r2), .r3(r3), .ALUop(ALUop), .clk(clk) );

ALU_behavioral #(n) vuut  (.R1(r1_v), .R2(r2), .R3(r3), .ALUOp(ALUop) );

assign errorFlag = (r1[n-1:0] !== r1_v[n-1:0]);

initial begin
    clk = 0;
    // MOV
    ALUop = 0;
    r3 = 32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx;
    r2 = 32'b1011_0001_1110_1110_1100_0000_1000_0010;
    
    // NOT
    #10;
    ALUop = 1;
    r3 = 32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx;
    r2 = 32'b1011_0001_1110_1110_1100_0000_1000_0010;
    
    // OR
    #10;
    ALUop = 4;
    r3 = 32'b1111_0001_1110_1010_0100_0101_1000_0100;
    r2 = 32'b1011_0001_1110_1110_1100_0000_1000_0010;
    
    // AND
    #10;
    ALUop = 5;
    r3 = 32'b1111_0001_1110_1010_0100_0101_1000_0100;
    r2 = 32'b1011_0001_1110_1110_1100_0000_1000_0010;
    
    // ADD
    // big values with overflow
    #10; 
    ALUop = 2;
    r2 = 32'h7fff_ffff;
    r3 = 32'h7fff_ffff;
    // big values without overflow
    #10;
    r2 = 32'h0123_4567;
    r3 = 32'h7654_3210;
    // small values
    #10;
    r2 = 32'h0000_0002;
    r3 = 32'h0000_0003;
    // negative + positive
    #10;
    r2 = 32'hffff_ffff;
    r3 = 32'h0000_0003;
    // positive + negative
    #10;
    r2 = 32'h0000_0003;
    r3 = 32'hffff_ffff;    
    
    //SUB
    ALUop = 3;   
    // big values with overflow
    #10; 
    r2 = 32'h7fff_ffff;
    r3 = 32'h7fff_ffff;
    // big values without overflow
    #10;
    r2 = 32'h0123_4567;
    r3 = 32'h7654_3210;
    // small values
    #10;
    r2 = 32'h0000_0002;
    r3 = 32'h0000_0003;
    // negative - positive
    #10;
    r2 = 32'hffff_ffff;
    r3 = 32'h0000_0003;
    // positive - negative
    #10;
    r2 = 32'h0000_0003;
    r3 = 32'hffff_ffff; 
    // subtract 0
    #10;
    r2 = 32'h0000_0002;
    r3 = 32'h0000_0000;
    
    //SLT
    ALUop = 6;
    // R2 is bigger 
    #10;
    r2 = 32'h0000_0003;
    r3 = 32'h0000_0002;

    #10;
    r2 = 32'h0000_0003;
    r3 = 32'hffff_fffe;
    // R2 is smaller
    #10;
    r3 = 32'h0000_0003;
    r2 = 32'h0000_0002;

    #10;
    r3 = 32'h0000_0003;
    r2 = 32'hffff_fffe;
    //R2 = R3
    #10;
    r2 = 32'h0000_0003;
    r3 = 32'h0000_0003; 
    
    #10;
    r2 = 32'hffff_fffe;
    r3 = 32'hffff_fffe;
    
    #10;
    r2 = 32'h0000_0000;
    r3 = 32'h0000_0000;
    // one register is 0;
    #10;
    r2 = 32'h0000_0003;
    r3 = 32'h0000_0000;
    
    #10;
    r3 = 32'h0000_0003;
    r2 = 32'h0000_0000;

    #10;
    r2 = 32'hffff_ffff;
    r3 = 32'h0000_0000;
    
    #10;
    r3 = 32'hffff_ffff;
    r2 = 32'h0000_0000;
    


end

always
    #1 clk = ~clk;

endmodule
