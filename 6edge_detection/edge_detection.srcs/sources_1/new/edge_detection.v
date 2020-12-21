//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/08 10:48:06
// Design Name: 
// Module Name: edge_detection
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


module edge_detection(
    input rst,
    input clk,
    input puls,
    output reg puls_r1,
    output reg puls_r2,
    output reg puls_pos,
    output reg puls_neg
    );

    reg [31:0] peroid;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            puls_r1     <= 0;
            puls_r2     <= 0;
            puls_pos    <= 0;
            puls_neg    <= 0;
            peroid      <= 0;
        end
        else begin
            puls_r1 <= puls;
            puls_r2 <= puls_r1;
            puls_pos <= ({puls_r2,puls_r1}==2'b01)?1:0;
            puls_neg <= ({puls_r2,puls_r1}==2'b10)?1:0;
            if (puls_pos || peroid && !puls_neg) peroid <= peroid + 1;
            else if (puls_neg) peroid <= 0;
        end 
    end

endmodule
