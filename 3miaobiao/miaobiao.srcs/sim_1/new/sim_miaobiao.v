`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/03 21:23:36
// Design Name: 
// Module Name: sim_miaobiao
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


module sim_miaobiao();
    reg clk = 1'b0;
    reg rst = 1'b1;
    wire [3:0] second_01;
    wire [3:0] second_1;
    wire [3:0] second_10;
    
    always #5 clk <= ~clk;
    
    miaobiao miaobiao_LH(
    .clk(clk),
    .rst(rst),
    .second_01(second_01),
    .second_1(second_1),
    .second_10(second_10)
    );
    
    initial begin
    #5      rst = 1'b0;
    #5      rst = 1'b1;
            
    end
endmodule
