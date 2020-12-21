`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/26 18:55:12
// Design Name: 
// Module Name: sim_fuzhitest
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


module sim_fuzhitest(
     output [3:0] d1,
     output [3:0] d2
    );
    
    reg clk=0;
    reg [3:0] a=4'b0101;
always #10 clk = ~clk; 

fuzhitest fuzhitest_LH(
    .a(a),
    .d1(d1),
    .d2(d2),
    .clk(clk)
    );
endmodule
