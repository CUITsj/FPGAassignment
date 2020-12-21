//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/26 18:54:52
// Design Name: 
// Module Name: fuzhitest
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


module fuzhitest(
    input clk,
    input [3:0] a,
    
    output reg [3:0] d1,
    output reg [3:0] d2
    );
    reg [3:0] b1 = 4'b1111;
    reg [3:0] c1 = 4'b1111;
    reg [3:0] b2 = 4'b1111;
    reg [3:0] c2 = 4'b1111;

always @(posedge clk) begin
    b1=a;
    c1=b1;
    d1=c1;  
    
    b2<=a;
    c2<=b2;
    d2<=c2;
end
endmodule
