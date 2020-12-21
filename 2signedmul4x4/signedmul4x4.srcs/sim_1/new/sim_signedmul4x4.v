`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/26 18:57:57
// Design Name: 
// Module Name: sim_signedmul4x4
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


module sim_signedmul4x4(
    output signed [6:0] ans
    );
    reg clk=0;
    reg signed [3:0] mul_left=0;
    reg signed [3:0] mul_right=0;
always #10 clk = ~clk; 
signedmul4x4 signedmul4x4_LH(
    .a(mul_left),
    .b(mul_right),
    .c(ans),
    .clk(clk)
    );
initial begin    
    #100    mul_left = -7;
            mul_right = 7;
            
    #100    mul_left = 7;
            mul_right = -7;
            
    #100    mul_left = 5;
            mul_right = 5;
            
    #100    mul_left = -5;
            mul_right = 5;
            
    #100    mul_left = 1;
            mul_right = 1;
            
    #100    mul_left = -1;
            mul_right = 1;
            
    #100    mul_left = 4;
            mul_right = -4;
            
    #100    mul_left = 3;
            mul_right = -7;
            
    #100    mul_left = -2;
            mul_right = 6;
            
    #100    mul_left = 6;
            mul_right = -6;
end

endmodule
