`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// UCT EEE4120F
// Author: Tilal Zaheer Mukhtar
// 
// Create Date: 17.05.2024 10:59:33
// Project Name: YODA SPM
// Module Name: top_tb
// Target Devices: Nexys A7-100T
// Tool Versions: Vivado ML 2023.2
// Description: Top level testbench for YODA SPM project
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module top_tb;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Local Parameter Declarations
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
localparam CLOCK_PERIOD = 10; // Period of the main clock in ns
localparam TIMEOUT = 150_000; // Maximum simulation duartion
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Internal Variable Declarations
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Connect to top module
// top module inputs
reg  clk;
reg reset;
reg enable;
wire rx;
reg start;
// top module outputs
wire tx;
wire busy;
wire done;

// Connect to uart module
// UART module inputs
reg [7:0] uart_data_in;
reg uart_data_in_valid;
wire tx_full;
wire uart_data_in_ready;
assign uart_data_in_ready = ~tx_full;

// UART module outputs
wire [7:0] uart_data_out;
reg uart_data_out_ready;
wire rx_empty;
wire uart_data_out_valid;
assign uart_data_out_valid = ~rx_empty;

// Flag for UART transmission
reg transmit;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Submodules
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Top module for SPM project
top top(
    .clk(clk),
    .reset_n(~reset),
    .enable(enable),
    .rx(tx),
    .start(start),
    .tx(rx),
    .busy(busy),
    .done(done)
);

// UART module to simulate host device
uart uart (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .rx(rx),
    .tx_data(uart_data_in),
    .read_rx_data(uart_data_out_ready),
    .write_tx_data(uart_data_in_valid),
    .rx_data(uart_data_out),
    .tx(tx),
    .rx_empty(rx_empty),
    .tx_full(tx_full)
);
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Simulation
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
initial begin
    // Set initial state
    clk = 0;
    reset = 0;
    enable = 1;
    start = 0;
    transmit = 0;
    uart_data_in_valid = 0;
    uart_data_out_ready = 0; 
    
    // Set reset line high and enable low
    #100
    reset = 1;
    enable = 0;
    
    // Set reset line low and enable high
    #100
    reset = 0;
    enable = 1;
    
    // Transmit interval value of 5 over UART tx
    #100
    uart_data_in = 5;
    transmit = 1;
    
    // Stop UART transmission
    #10
    transmit = 0;
    
    // Wait for interval to be transmitted before starting SPM processing
    #25000
    start = 1;
    
    // Reset start to low after SPM has begun processing
    #10
    start = 0;
    
    // Maximum simulation time
    #TIMEOUT
    $finish;
end

always #(CLOCK_PERIOD/2) clk = ~clk;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Synchronous Logic
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Simulate host device UART module
always @(posedge clk) begin
    // Reset to initial state
    if (reset) begin
        uart_data_in_valid <= 0;
        uart_data_out_ready <= 0;    
    end
    // If enabled begin processing
    else if (enable) begin
        // Set flags to default values
        uart_data_in_valid <= 0;
        uart_data_out_ready <= 0;    
        
        // UART transmission
        if (uart_data_in_ready && transmit) begin
            uart_data_in_valid <= 1;
        end
        
        // UART receiver
        if (uart_data_out_valid) begin
            uart_data_out_ready <= 1;
        end
    end
end
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

endmodule
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
