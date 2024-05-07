`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2021 11:47:35 AM
// Design Name: 
// Module Name: uart
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


module uart #(
    parameter CLOCK_RATE = 100_000_000,
    parameter BAUD_RATE = 460_800
    )(
    input wire clk, 
    input wire reset,
    input wire enable,
    input wire rx,
    input wire [15:0] write_tx_data,
    input wire enable_rx_read,
    input wire enable_tx_write,
    output wire [15:0] read_rx_data,
    output wire tx,
    output wire rx_empty,
    output wire tx_full
);
    
// Timer as baud rate generator
wire tick;
baud_rate_generator #(
    .CLOCK_RATE(CLOCK_RATE),
    .BAUD_RATE(BAUD_RATE)
) baud_rate_generator (
    .clk(clk),
    .reset(reset),
    .enable(1),
    .done(tick)
);

// UART Receiver
wire rx_done;
wire [15:0] rx_data;
uart_rx uart_rx (
    .clk(clk), 
    .reset(reset), 
    .enable(enable),
    .rx(rx),
    .rx_tick(tick),
    .rx_data(rx_data),
    .rx_done(rx_done)
);

// UART Receiver FIFO
fifo_generator_0 rx_fifo (
    .clk(clk),
    .srst(reset),
    .din(rx_data),
    .wr_en(rx_done),
    .rd_en(enable_rx_read),
    .dout(read_rx_data),
    .full(),
    .empty(rx_empty)
);

// UART Transmitter
wire tx_empty, tx_done;
wire [15:0] tx_data;
uart_tx uart_tx (
    .clk(clk), 
    .reset(reset),
    .enable(enable),
    .tx_data(tx_data),
    .tx_tick(tick),        
    .tx_start(~tx_empty),
    .tx(tx),
    .tx_done(tx_done)
);

// UART Transmitter FIFO
fifo_generator_0 tx_fifo (
    .clk(clk),
    .srst(reset),
    .din(write_tx_data),
    .wr_en(enable_tx_write),
    .rd_en(tx_done),
    .dout(tx_data),
    .full(tx_full),
    .empty(tx_empty)
);   
 
endmodule
