`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2024 04:38:40 PM
// Design Name: 
// Module Name: bitSlice_v
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


module bitSlice_v(
    input r2, r3, c_in,
    input[2:0] ALUop,
    output c_out, r1
    );
    reg r_c_out, r_r1;
    always @(*) begin
        case (ALUop)
        
            3'b000  :   {r_c_out, r_r1} = {1'bx, r2};
            
            3'b001  :   {r_c_out, r_r1} = {1'bx, ~r2};
            
            3'b010  :   {r_c_out, r_r1} = r2 + r3 + c_in;
            
            3'b011  :   {r_c_out, r_r1} = r2 + ~r3 + 1'b1;

            3'b100  :   {r_c_out, r_r1} = {1'bx, r2 | r3};
            
            3'b101  :   {r_c_out, r_r1} = {1'bx, r2 & r3};
            
            3'b110  :   {r_c_out, r_r1} = (r2 < r3);
            
            3'b111  :   {r_c_out, r_r1} = {1'bx, 1'bx};
            
        endcase
    end
    
    assign c_out = r_c_out;
    assign r1 = r_r1;
endmodule
