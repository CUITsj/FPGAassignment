`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/25 21:55:24
// Design Name: 
// Module Name: sim_mul4x4
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

module sim_mul4x4(
    output [9:0] ans
    );
    reg clk=0;
    reg signed [3:0] mul_left=0;
    reg signed [3:0] mul_right=0;
    reg sign_falg=0;
always #10 clk = ~clk; 
mul4x4 mul4x4_LH(
    .a(mul_left),
    .b(mul_right),
    .c(ans),
    .sign_flag(sign_falg),
    .clk(clk)
    );
initial begin    
    #10    sign_falg = 0;
            mul_left = 15;
            mul_right = 15;
            
    #10    sign_falg = 1;
            mul_left = -7;
            mul_right = -7;
            
    #10    sign_falg = 0;
            mul_left = 1;
            mul_right = 1;
            
    #10    sign_falg = 1;
            mul_left = -1;
            mul_right = -1;
            
    #10    sign_falg = 0;
            mul_left = 9;
            mul_right = 9;
            
    #10    sign_falg = 1;
            mul_left = 0;
            mul_right = 0;
            
    #10    sign_falg = 0;
            mul_left = 6;
            mul_right = 6;
            
    #10    sign_falg = 1;
            mul_left = -5;
            mul_right = 5;
            
    #10    sign_falg = 1;
            mul_left = 5;
            mul_right = -6;
            
    #10    sign_falg = 0;
            mul_left = -7;
            mul_right = 7;
    #10 $finish;
end

endmodule

