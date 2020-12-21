//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/09 19:58:03
// Design Name: 
// Module Name: fifo_top
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


module fifo_top(
    input    clk,                   // 时钟信号
    input    rst                    // 复位信号
    );

    //wire define
wire            wrreq   ;         // 写请求信号
wire    [7:0]   data    ;         // 写入FIFO的数据

wire            rdreq   ;         // 读请求信号
wire    [7:0]   q       ;         // 从FIFO输出的数据
wire            empty ;         // 读侧空信号
wire            full  ;         // 读侧满信号

//例化FIFO模块
fifo_generator_0 your_instance_name (
  //.rst(rst),                  // input wire rst
  .wr_clk(clk),            // input wire wr_clk
  .rd_clk(clk),            // input wire rd_clk
  .din(data),                  // input wire [7 : 0] din
  .wr_en(wrreq),              // input wire wr_en
  .rd_en(rdreq),              // input wire rd_en
  .dout(q),                // output wire [7 : 0] dout
  .full(full),                // output wire full
  .empty(empty),              // output wire empty
  .wr_rst_busy(wr_rst_busy),  // output wire wr_rst_busy
  .rd_rst_busy(rd_rst_busy)  // output wire rd_rst_busy
);

//例化写FIFO模块
fifo_wr u_fifo_wr(
    .clk     (clk ),          // 写时钟
    .rst_n   (rst),         // 复位信号

    .wrreq   (wrreq   ),          // 写请求
    .data    (data    ),          // 写入FIFO的数据
    .wrempty (empty ),          // 写空信号
    .wrfull  (full  )           // 写满信号
);

//例化读FIFO模块
fifo_rd u_fifo_rd(
    .clk     (clk ),          // 读时钟
    .rst_n   (rst),         // 复位信号

    .rdreq   (rdreq   ),          // 读请求
    .data    (q       ),          // 从FIFO输出的数据
    .rdempty (empty ),          // 读空信号
    .rdfull  (full  )           // 读满信号
);

endmodule
