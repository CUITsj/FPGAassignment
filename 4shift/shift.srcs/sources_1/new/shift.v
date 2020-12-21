//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/04 07:53:38
// Design Name: 
// Module Name: shift
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


module shift(clk,rst,din,din_en,dout,dout_en);
    parameter INWIDTH = 7;
    parameter OUTWIDTH = 14;
    input   clk,rst,din_en;
    input   [INWIDTH-1:0]   din;
    output  reg [OUTWIDTH-1:0]   dout;
    output  reg dout_en;
    reg [INWIDTH-1:0] inbuff;
    reg [OUTWIDTH-1:0] outbuff;
    reg [5:0] cnt;
    reg [5:0] cnt1;
    reg finish1;
    reg [5:0] geshu;
    always @(clk or negedge rst) begin
        if (!rst) begin
            dout <= 0;
            dout_en <= 0;
            inbuff <= 0;
            outbuff <= 0;
            cnt<=0;
            cnt1<=0;
            finish1<=0;
            geshu<=0;
        end
        /**********************并转串***************************/
        if (clk && din_en && INWIDTH >= OUTWIDTH) begin
            inbuff <= din;
            finish1<=0;
        end
        else if (clk && !din_en && !finish1 && INWIDTH >= OUTWIDTH) begin
            outbuff[0] = inbuff[INWIDTH-1];
            inbuff = inbuff<<1;
            cnt = cnt + 1;
            dout_en = 0;
            if (cnt < OUTWIDTH)outbuff = outbuff<<1;
            
            if (cnt == OUTWIDTH) begin
                cnt1=cnt1+cnt;
                cnt = 0;
                dout = outbuff;
                dout_en = 1;
                if (cnt1 == INWIDTH+OUTWIDTH)begin
                    cnt1<=0;
                    dout_en <=0;
                    finish1<=1;
                end
            end
        end
        if (!clk && INWIDTH >= OUTWIDTH)dout_en = 0;
        
        /**********************串转并***************************/
        if (clk && din_en && INWIDTH <= OUTWIDTH) begin
            inbuff <= din;
            geshu <= geshu+1;
            finish1 <= 0;
        end
        else if (clk && !finish1 && geshu <= OUTWIDTH/INWIDTH && !din_en && INWIDTH <= OUTWIDTH) begin
            outbuff = outbuff+inbuff;
            cnt = cnt+1;
            finish1 = 1;
            if (cnt <= OUTWIDTH/INWIDTH-1) outbuff = outbuff<<INWIDTH;
            if (geshu == OUTWIDTH/INWIDTH) begin
                dout = outbuff;
                dout_en = 1;
                geshu = 0;
                finish1 = 1;
                outbuff = 0;
                cnt=0;
            end
        end
        
        
    end
endmodule
