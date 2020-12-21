//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/03 21:03:57
// Design Name: 
// Module Name: miaobiao
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


module miaobiao(
    input   clk,
    input   rst,
    output  reg [3:0] second_01,
    output  reg [3:0] second_1,
    output  reg [3:0] second_10
    );
    reg [23:0]  cnt;
    
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            cnt <= 24'd0;
        end
        else if (cnt == 24'd99)//cn计数到24'd9999_999改成计数到99，0.1S变成1us,1s变成10us,10s变成100us
            cnt <= 0;
        else
            cnt <= cnt + 1;
    end
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            second_01 <= 4'd0;
        end
        else if (cnt == 24'd99 && second_01 == 4'd9)
            second_01 <= 0;
        else if (cnt == 24'd99)
            second_01 <= second_01 + 1;
        else
            second_01 <= second_01; 
    end
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            second_1 <= 4'd0;
        end
        else if (cnt == 24'd99 && second_01 == 4'd9 && second_1 == 4'd9)
            second_1 <= 0;
        else if (cnt == 24'd99 && second_01 == 4'd9)
            second_1 <= second_1 + 1;
        else
            second_1 <= second_1; 
    end
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            second_10 <= 4'd0;
        end
        else if (cnt == 24'd99 && second_01 == 4'd9 && second_1 == 4'd9 && second_10 == 4'd9)
            second_10 <= 0;
        else if (cnt == 24'd99 && second_01 == 4'd9 && second_1 == 4'd9)
            second_10 <= second_10 + 1;
        else
            second_10 <= second_10; 
    end
endmodule
