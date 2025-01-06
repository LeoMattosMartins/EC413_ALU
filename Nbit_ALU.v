`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2024 06:39:11 PM
// Design Name: 
// Module Name: Nbit_ALU
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


module Nbit_ALU(r1, r2, r3, ALUop);
parameter n = 32;

input[n-1:0] r2, r3;
input[2:0] ALUop;
output[n-1:0] r1;

// wires for sum and subtraction propagate
wire[n:0] carrySum,
          carryDiff;

wire[n-1:0] select0, 
            select1, 
            select2,
            select2_x,
            select3, 
            select4, 
            select5,
            select6,
            selectX, 
            not_r3;
            
wire sum_c_out,
     diff_c_out;
 
// initial carries 
assign carrySum[0] = 1'b0;
assign carryDiff[0] = 1'b1; 

// preset last 31 bits of select6 
assign select6[n-1:1] = 31'b000_0000_0000_0000_0000_0000_0000_0000;        

genvar ii;

generate
// do every option, select which one you want with ALUop
for(ii = 0; ii < n; ii = ii + 1)
begin

    bitSlice bx (.r1(selectX[ii]), .r2(1'bx), .r3(r3[ii]), .ALUop(3'b000) );

    bitSlice b0 (.r1(select0[ii]), .r2(r2[ii]), .r3(r3[ii]), .ALUop(3'b000) );
    bitSlice b1 (.r1(select1[ii]), .r2(r2[ii]), .r3(r3[ii]), .ALUop(3'b001) );
    
    bitSlice b2 (.r1(select2[ii]), .r2(r2[ii]), .r3(r3[ii]), .ALUop(3'b010), .c_in(carrySum[ii]), .c_out(carrySum[ii + 1]) );
    bitSlice b  (.r1(not_r3[ii]),  .r2(r3[ii]), .r3(r2[ii]), .ALUop(3'b001) );
    bitSlice b3 (.r1(select3[ii]), .r2(r2[ii]), .r3(not_r3[ii]), .ALUop(3'b010), .c_in(carryDiff[ii]), .c_out(carryDiff[ii + 1]) );
    
    bitSlice b4 (.r1(select4[ii]), .r2(r2[ii]), .r3(r3[ii]), .ALUop(3'b100) );
    bitSlice b5 (.r1(select5[ii]), .r2(r2[ii]), .r3(r3[ii]), .ALUop(3'b101) );
    
end

endgenerate

assign select6[0] = select3[n-1];

// 3 bit MUX
assign r1 = (ALUop[2]) ? ( (ALUop[1]) ? ( (ALUop[0]) ? ( selectX ) : 
                                                       ( select6 ) ) : 
                                        ( (ALUop[0]) ? ( select5 ) : 
                                                       ( select4 ) ) ) : 
                         ( (ALUop[1]) ? ( (ALUop[0]) ? ( select3 ) : 
                                                       ( select2 ) ) : 
                                        ( (ALUop[0]) ? ( select1 ) : 
                                                       ( select0 ) ) );

endmodule
