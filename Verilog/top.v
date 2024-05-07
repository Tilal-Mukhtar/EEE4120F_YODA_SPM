`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2021 03:02:43 PM
// Design Name: 
// Module Name: terminal_demo
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


module top.v(
    input wire clk, 
    input wire reset,
    input wire enable,
    input rx,
    output wire tx,
    output wire rx_empty,
    output wire tx_full,
);

// Sound Processing Module
spm #(
    .SAMPLING_RATE(44_100)
)spm (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .data_in(rx_data)
    .data_in_available(~rx_empty)
    .data_out_available(~tx_full)  
    .data_out(tx_data)
    .data_in_ready(enable_rx_read)
    .data_out_ready(enable_tx_write)
);

// UART Module
uart #(
    .CLOCK_RATE(100_000_000),
    .BAUD_RATE(460_800)
) uart (
    .clk(clk), 
    .reset(reset),
    .enable(enable),
    .rx(rx),
    .write_tx_data(tx_data),
    .enable_rx_read(enable_rx_read),
    .enable_tx_write(enable_tx_write),
    .read_rx_data(rx_data),
    .tx(tx),
    .rx_empty(rx_empty),
    .tx_full(tx_full),
);
    
    
endmodule
