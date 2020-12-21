`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/08 18:37:19
// Design Name: 
// Module Name: sim_edge_detection
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


module sim_edge_detection();

// edge_detection Parameters
parameter PERIOD  = 10;


// edge_detection Inputs
reg   rst                                  = 0 ;
reg   clk                                  = 0 ;
reg   puls                                 = 0 ;

// edge_detection Outputs
wire  puls_r1                              ;
wire  puls_r2                              ;
wire  puls_pos                             ;
wire  puls_neg                             ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    #(PERIOD*2) rst  =  1;
end

edge_detection  u_edge_detection (
    .rst                     ( rst        ),
    .clk                     ( clk        ),
    .puls                    ( puls       ),

    .puls_r1                 ( puls_r1    ),
    .puls_r2                 ( puls_r2    ),
    .puls_pos                ( puls_pos   ),
    .puls_neg                ( puls_neg   )
);

initial
begin
    #20 puls = 1;
    #50 puls = 0;
    $finish;
end

endmodule
