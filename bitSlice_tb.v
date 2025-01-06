`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2024 04:33:34 PM
// Design Name: 
// Module Name: bitSlice_tb
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


module bitSlice_tb;

reg r2, r3, c_in;
reg[2:0] ALUop;

wire r1, c_out, r1_v, c_out_v, errorFlag_c_out, errorFlag_r1;

bitSlice uut ( .r1(r1), .r2(r2), .r3(r3), .ALUop(ALUop), .c_out(c_out), .c_in(c_in) );

bitSlice_v vuut ( .r1(r1_v), .r2(r2), .r3(r3), .ALUop(ALUop), .c_out(c_out_v), .c_in(c_in) );

assign errorFlag_c_out = (c_out !== c_out_v);
assign errorFlag_r1 = (r1_v !== r1);

initial begin
    r2 = 0;
    r3 = 0;
    c_in = 0;
    ALUop = 3'b000;
    
    #100;

end

always
#5 r2 = ~r2;

always 
#10 r3 = ~r3;

always
#20 c_in = ~c_in;

always 
#40 ALUop = ALUop + 1;





endmodule
