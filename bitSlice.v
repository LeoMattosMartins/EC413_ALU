`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2024 03:36:57 PM
// Design Name: 
// Module Name: bitSlice
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


module bitSlice(
    input r2, r3, c_in,
    input[2:0] ALUop,
    output c_out, r1
);

wire select0, 
     select1, 
     select2, 
     select3, 
     select4, 
     select5,
     select2_c_out, 
     select3_c_out,
     not_select3_c_out, 
     not_r3;

assign select0 = r2;

// do every action, choose which one with ALUop
not not1 (not_r3, r3);
not not2 (select1, r2);
not not3 (not_select3_c_out, select3_c_out);

FA add1 (.c_in(c_in), .a(r2), .b(r3), .c_out(select2_c_out), .sum(select2) );
FA sub1 (.c_in(1'b1), .a(r2), .b(not_r3), .c_out(select3_c_out), .sum(select3) );

or or1 (select4, r2, r3);

and and1 (select5, r2, r3);

// 3 bit MUX
assign r1    = (ALUop[2]) ? ( (ALUop[1]) ? ( (ALUop[0]) ? ( 1'bx              ) : 
                                                          ( select3_c_out     ) ) : 
                                           ( (ALUop[0]) ? ( select5           ) : 
                                                          ( select4           ) ) ) : 
                            ( (ALUop[1]) ? ( (ALUop[0]) ? ( select3           ) : 
                                                          ( select2           ) ) : 
                                           ( (ALUop[0]) ? ( select1           ) : 
                                                          ( select0           ) ) );
                                                          
// 3 bit MUX                                                       
assign c_out = (ALUop[2]) ? ( (ALUop[1]) ? ( (ALUop[0]) ? ( 1'bx              ) : 
                                                          ( 1'bx              ) ) : 
                                           ( (ALUop[0]) ? ( 1'bx              ) : 
                                                          ( 1'bx              ) ) ) : 
                            ( (ALUop[1]) ? ( (ALUop[0]) ? ( not_select3_c_out ) : 
                                                          ( select2_c_out     ) ) : 
                                           ( (ALUop[0]) ? ( 1'bx              ) : 
                                                          ( 1'bx              ) ) );

endmodule
