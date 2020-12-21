//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/25 21:48:28
// Design Name: 
// Module Name: mul4x4
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


module mul4x4(
    input clk,
    input signed [3:0] a,
    input signed [3:0] b,
    input sign_flag,
    
    output reg [9:0] c
    );
    reg [9:0] akw=0;
    reg [3:0] unsigneda=0;
    
    reg [5:0] aymsz=0;
    reg [2:0] bymsz=0;
    reg [5:0] cymsz=0;
    reg [1:0] movecount=0;
always @(*) begin
    unsigneda <= a;
if (!sign_flag)begin
    c=0;
    akw = unsigneda;
    if (b[3] == 1'b1)
    c = c+(akw<<3);
    if (b[2]  == 1'b1)
    c = c+(akw<<2);
    if (b[1]  == 1'b1)
    c = c+(akw<<1);
    if (b[0] == 1'b1)
    c = c+a;
    
end
else begin
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
    {c[9:6],c[5:0]} = {{4{1'b1}},~cymsz+1'b1};
    else c = cymsz;
end
end
    
endmodule
