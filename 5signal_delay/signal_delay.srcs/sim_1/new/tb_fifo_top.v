`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/09 20:09:21
// Design Name: 
// Module Name: tb_fifo_top
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


module tb_fifo_top();

// fifo_top Parameters
parameter PERIOD  = 10;


// fifo_top Inputs
reg   clk                                  = 0 ;
reg   rst                                  = 0 ;

// fifo_top Outputs



initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    #(PERIOD*2) rst  =  1;
end

fifo_top  u_fifo_top (
    .clk                     ( clk   ),
    .rst                     ( rst   )
);

initial
begin

    $finish;
end

endmodule
