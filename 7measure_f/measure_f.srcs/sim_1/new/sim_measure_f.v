`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/12 13:08:13
// Design Name: 
// Module Name: tb_measure_f
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

module tb_measure_f;

// measure_f Parameters
parameter PERIOD  = 10;


// measure_f Inputs
reg   clk                                  = 0 ;
reg   rst                                  = 0 ;
reg   wave                                 = 0 ;

// measure_f Outputs
wire  freq                                 ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    #(PERIOD*2) rst  =  1;
end

measure_f  u_measure_f (
    .clk                     ( clk    ),
    .rst                     ( rst    ),
    .wave                    ( wave   ),

    .freq                    ( freq   )
);

initial
begin
    forever #(PERIOD*2) wave = ~wave;
    $finish;
end

endmodule
