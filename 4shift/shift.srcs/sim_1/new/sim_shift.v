`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/04 09:49:51
// Design Name: 
// Module Name: sim_shift
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


module sim_shift();
    parameter INWIDTH = 16;
    parameter OUTWIDTH = 2;
    reg clk=0;
    reg rst=1;
    reg [INWIDTH-1:0] din;
    reg din_en=0;
    wire [OUTWIDTH-1:0]dout;
    wire dout_en;
    
    always #5 clk = ~clk;
    
    shift #(
    .INWIDTH(INWIDTH),
    .OUTWIDTH(OUTWIDTH)
    )shift_LH( 
    .clk(clk),
    .rst(rst),
    .din(din),
    .din_en(din_en),
    .dout_en(dout_en),
    .dout(dout)
    );
     /**********************并转串***************************/
    initial begin
    #4 rst=0;
    #4 rst=1;
    
    #4  din=16'b11111111_00000000;//1111_00000000;
        din_en=1;
    #10 din_en=0;
    
    #200  din=16'b01010101_01010101;//1111_00000000;
        din_en=1;
    #10 din_en=0;
    
    
    end
    /**********************串转并***************************/
//    initial begin
//    #4 rst=0;
//    #4 rst=1;
    
//    #4  din=7'b1111_000;//1111_00000000;
//        din_en=1;
//    #10  din_en=0;
    
//    #50  din=7'b0000_111;//1111_00000000;
//        din_en=1;
//    #10  din_en=0;
    
//    #100  din=7'b0000_000;//1111_00000000;
//        din_en=1;
//    #10  din_en=0;
    
//    #50  din=7'b1111_000;//1111_00000000;
//        din_en=1;
//    #10  din_en=0;
//    end
endmodule
