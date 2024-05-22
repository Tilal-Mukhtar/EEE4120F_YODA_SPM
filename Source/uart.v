`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// UCT EEE4120F
// Reference: Based on code written by Anas Salah Eddin available at https://github.com/aseddin/ece_3300
// 
// Create Date: 17.05.2024 10:59:33
// Project Name: YODA SPM
// Module Name: uart
// Target Devices: Nexys A7-100T
// Tool Versions: Vivado ML 2023.2
// Description: Wrapper for UART rx and tx modules
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module uart #(
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Input Parameters
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    parameter CLOCK_RATE = 100_000_000, //
    parameter BAUD_RATE = 921_600       //
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
)(
    
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Inputs
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    input wire clk,             // Clock line
    input wire reset,           // Reset line
    input wire enable,          // Enable line
    input wire rx,              // Uart rx line
    input wire [7:0] tx_data,   // Uart tx data
    input wire read_rx_data,    // Read rx data 
    input wire write_tx_data,   // Write tx data
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Outputs
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    output wire [7:0] rx_data,  // Uart rx data
    output wire tx,             // Uart tx line
    output wire rx_empty,       // Indicate uart rx FIFO empty
    output wire tx_full         // Indicate uart tx FIFO full
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Submodules
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Baud Rate Generator module
wire tick;
baud_rate_generator #(
    .CLOCK_RATE(CLOCK_RATE),
    .BAUD_RATE(BAUD_RATE)
) baud_rate_generator (
    .clk(clk),
    .reset(reset),
    .enable(1),
    .tick(tick)
);

// UART Receiver module
wire rx_done;
wire [7:0] rx_fifo_data_in;
uart_rx uart_rx (
    .clk(clk), 
    .reset(reset), 
    .enable(enable),
    .rx(rx),
    .rx_tick(tick),
    .rx_data(rx_fifo_data_in),
    .rx_done(rx_done)
);

// UART Transmitter module
wire tx_empty, tx_done;
wire [7:0] tx_fifo_data_out;
uart_tx uart_tx (
    .clk(clk), 
    .reset(reset),
    .enable(enable),
    .tx_data(tx_fifo_data_out),
    .tx_tick(tick),        
    .tx_start(~tx_empty),
    .tx(tx),
    .tx_done(tx_done)
);
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// IP modules
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// UART Receiver FIFO IP module
fifo_generator_0 rx_fifo (
    .clk(clk),
    .rst(reset),
    .din(rx_fifo_data_in),
    .wr_en(rx_done),
    .rd_en(read_rx_data),
    .dout(rx_data),
    .full(),
    .empty(rx_empty)
);

// UART Transmitter FIFO IP module
fifo_generator_0 tx_fifo (
    .clk(clk),
    .rst(reset),
    .din(tx_data),
    .wr_en(write_tx_data),
    .rd_en(tx_done),
    .dout(tx_fifo_data_out),
    .full(tx_full),
    .empty(tx_empty)
);   
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

endmodule
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
