//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/12 12:34:27
// Design Name: 
// Module Name: measure_f
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


module measure_f(
    input clk,
    input rst,
    input wave,
    output reg [26:0] freq
    );

    reg wave1,wave2;
    reg [26:0] count_pos;
    reg [26:0] count_time;
    reg [9:0] second;
    //边沿检测,计数上升沿,加除
    always @(posedge clk) begin
        if (!rst) begin
            freq <= 0;
            wave1 <= 0;
            wave2 <= 0;
            count_pos <= 0;
        end
        else begin
            wave1 <= wave;
            wave2 <= wave1;
            count_pos <= count_pos + (({wave2,wave1}==2'b01)?1:0);
            if (second == 10'd1000) begin
                freq <= count_pos/second;
                count_pos <= 0;
            end
        end
    end

    //秒信号
    always @(posedge clk) begin
        if (!rst) begin
            count_time <= 0;
            second <= 0;
        end
        else if (count_time <= 27'd9999) begin//1秒缩小成0.1毫秒
            count_time <= count_time + 1;
            if (second == 10'd1000) begin
                second <= 0;
            end
        end
        else begin
            count_time <= 0;
            second <= second + 1;
        end
    end
endmodule
