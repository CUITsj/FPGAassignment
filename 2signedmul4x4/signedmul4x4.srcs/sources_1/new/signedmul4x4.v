`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/26 18:57:33
// Design Name: 
// Module Name: signedmul4x4
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


module signedmul4x4(
    input clk,
    input signed [3:0] a,
    input signed [3:0] b,
    
    output reg signed [6:0] c
    );
    reg [5:0] aymsz=0;
    reg [2:0] bymsz=0;
    reg [5:0] cymsz=0;
    reg [1:0] movecount=0;
always @(*) begin
    c=0;
    if (a<0) begin
    aymsz[5:0] ={1'b0,1'b0,1'b0,~a[2:0]+1'b1};
    end
    else begin
    aymsz = a;
    end
    if (b<0) begin
    bymsz = ~b + 1'b1;
    end
    else bymsz = b;
    cymsz = 0;
    movecount = 0;
    if (bymsz[2] == 1'b1)
    {cymsz,movecount} = {aymsz<<2,2'd2};
    if (bymsz[1]  == 1'b1)
    {cymsz,movecount} = {cymsz + (aymsz<<1),movecount+1'b1};
    if (bymsz[0] == 1'b1)
    cymsz = cymsz+aymsz;
    if (a[3]^b[3])
    c[6:0] = {a[3]^b[3],~cymsz+1'b1};
    else c[6:0] = {a[3]^b[3],cymsz};
end
endmodule
