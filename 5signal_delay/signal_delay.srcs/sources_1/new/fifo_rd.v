//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/09 19:58:40
// Design Name: 
// Module Name: fifo_rd
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

module fifo_rd(
    //system clock
    input                    clk    ,        // 时钟信号
    input                    rst_n  ,        // 复位信号（低有效）

    //user interface
    input           [7:0]    data   ,        // 从FIFO输出的数据
    input                    rdfull ,        // 读满信号
    input                    rdempty,        // 读空信号
    output   reg             rdreq           // 读请求
);

//reg define
reg   [7:0]                  data_fifo;      // 读取的FIFO数据
reg   [1:0]                  flow_cnt ;      // 状态流转计数
reg   [7:0]                  delay;

//*****************************************************
//**                    main code
//*****************************************************

//从FIFO中读取数据
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        rdreq <= 1'b0;
        data_fifo <= 8'd0;
        delay <= 0;
    end
    else begin
        case(flow_cnt)
            2'd0: begin
                if(rdfull && !rdempty) begin
                    //rdreq <= 1'b1;
                    flow_cnt <= flow_cnt + 1'b1;
                end
                else
                    flow_cnt <= flow_cnt;
            end 
            2'd1: begin
                if (delay <= 47)
                    delay <= delay + 1;
                else begin
                    delay <= 0;
                    rdreq <= 1'b1;
                    flow_cnt <= flow_cnt + 1'b1;
                end
            end
            2'd2: begin
                if(rdempty) begin
                    rdreq <= 1'b0;
                    data_fifo <= 8'd0;
                    flow_cnt  <= 2'd0;
                end
                else begin
                    rdreq <= 1'b1;
                    data_fifo <= data;
                end 
            end 
            default: flow_cnt <= 2'd0;
        endcase
    end
end

endmodule
