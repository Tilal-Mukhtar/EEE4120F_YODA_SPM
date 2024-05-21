`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// UCT EEE4120F
// Author: Tilal Zaheer Mukhtar
// 
// Create Date: 17.05.2024 10:59:33
// Project Name: YODA SPM
// Module Name: top
// Target Devices: Nexys A7-100T
// Tool Versions: Vivado ML 2023.2
// Description: Top level module for YODA SPM project
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module top (
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Inputs
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    input wire clk,     // Clock line
    input wire reset_n, // Inverted reset line
    input wire enable,  // Enable line
    input wire rx,      // Uart rx line
    input wire start,   // Flag to start SPM processing
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Outputs
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    output wire tx,     // UART tx line
    output wire busy,   // Flag to indicate SPM busy processing
    output wire done    // Flag to indicate SPM done processing
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Local Parameter Declarations
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
localparam DELIMITER = 16'h8000;    // Value send to indicate break between min and max values
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Internal Variable Declarations
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Reset line from inverted reset line
wire reset;
assign reset = ~reset_n;

// Connect to the SPM module
// SPM input
wire [15:0] spm_data_in;
wire spm_data_in_ready;
wire spm_data_in_valid;

// SPM min output
wire [15:0] spm_min_out;
reg spm_min_out_ready;
wire spm_min_out_valid;

// SPM max output
wire [15:0] spm_max_out;
reg spm_max_out_ready;
wire spm_max_out_valid;

// SPM interval and timer
reg [31:0] interval;
wire [31:0] timer;

// Connect to the UART module
// UART input for transmission
reg [7:0] uart_data_in;
reg uart_data_in_valid;

wire tx_full;
wire uart_data_in_ready;
assign uart_data_in_ready = ~tx_full;

// UART output from receiver
wire [7:0] uart_data_out;
reg uart_data_out_ready;

wire rx_empty;
wire uart_data_out_valid;
assign uart_data_out_valid = ~rx_empty;

// Registers for UART transmission
reg [7:0] tx_counter;
reg [15:0] tx_delimiter;
reg send_delimiter;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Submodules
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// BRAM module for storing audio samples
bram bram(
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .data_out_ready(spm_data_in_ready),
    .data_out(spm_data_in),
    .data_out_valid(spm_data_in_valid)
);

// UART module for communication with host device
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

// Sound processing module to process audio samples
spm spm (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .start(start),
    .interval(interval),
    .data_in(spm_data_in),
    .data_in_valid(spm_data_in_valid),
    .min_out_ready(spm_min_out_ready),
    .max_out_ready(spm_max_out_ready),
    .min_out(spm_min_out),
    .max_out(spm_max_out),
    .data_in_ready(spm_data_in_ready),
    .min_out_valid(spm_min_out_valid),
    .max_out_valid(spm_max_out_valid),
    .timer(timer),
    .done(done),
    .busy(busy)
);
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Synchronous Logic
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
always @(posedge clk or posedge reset) begin
    // Reset to initial state
    if (reset) begin
        // Reset SPM input
        interval <= 0;
        
        // Reset SPM output
        spm_min_out_ready <= 0;
        spm_max_out_ready <= 0;

        // Reset UART input
        uart_data_in <= 0;
        uart_data_in_valid <= 0;
        
        // Reset UART output flag
        uart_data_out_ready <= 0;
        
        // Reset transmission management registers
        tx_counter <= 0;
        tx_delimiter <= DELIMITER;
        send_delimiter <= 0;
    end
    // Start processing if enabled
    else if (enable) begin
        // Flags set to default values
        spm_min_out_ready <= 0;
        spm_max_out_ready <= 0;
        uart_data_in_valid <= 0;
        uart_data_out_ready <= 0;
        
        // Receive interval from UART rx data
        if (!busy && uart_data_out_valid) begin
            uart_data_out_ready <= 1;
            interval <= {interval[31:8], uart_data_out};
        end
        
        // Transmit min and max values via UART tx line
        if (uart_data_in_ready && done && (spm_min_out_valid || spm_max_out_valid)) begin
            // Transmit min values
            if (spm_min_out_valid) begin
                // Send first byte
                if (tx_counter == 0) begin
                    // Set UART tx data
                    uart_data_in <= spm_min_out[15:8];
                    
                    // Set SPM and UART flags
                    spm_min_out_ready <= 1;
                    uart_data_in_valid <= 1;
                    
                    // Set transmission management registers
                    tx_counter <= 1;
                    send_delimiter <= 1;        
                end
                // Send second byte
                else if (tx_counter == 1) begin
                    // Set UART tx data
                    uart_data_in <= spm_min_out[7:0];
                    
                    // Set SPM and UART flags
                    spm_min_out_ready <= 0;
                    uart_data_in_valid <= 1;
                    
                    // Set transmission management registers
                    tx_counter <= 0;
                    send_delimiter <= 1; 
                end
            end
            // Transmit delimiter between min and max values
            else if (send_delimiter) begin
                // Send first byte
                if (tx_counter == 0) begin
                    // Set UART tx data
                    uart_data_in <= tx_delimiter[15:8];
                    
                    // Set UART flag
                    uart_data_in_valid <= 1;
                    
                    // Set transmission management registers    
                    tx_counter <= 1;
                    send_delimiter <= 1;          
                end
                // Send second byte
                else if (tx_counter == 1) begin
                    // Set UART tx data
                    uart_data_in <= tx_delimiter[7:0];
                    
                    // Set UART flag              
                    uart_data_in_valid <= 1;
                    
                    // Set transmission management registers  
                    tx_counter <= 0;
                    send_delimiter <= 0;            
                end
            end
            // Transmit max values
            else if (spm_max_out_valid) begin
                // Send first byte
                if (tx_counter == 0) begin
                    // Set UART tx data
                    uart_data_in <= spm_max_out[15:8];
                    
                    // Set SPM and UART flags
                    spm_max_out_ready <= 1;
                    uart_data_in_valid <= 1;
                    
                    // Set transmission management registers 
                    tx_counter <= 1;
                    send_delimiter <= 0;                     
                end
                // Send second byte
                else if (tx_counter == 1) begin
                    // Set UART tx data
                    uart_data_in <= spm_max_out[7:0];
                    
                    // Set SPM and UART flags
                    spm_max_out_ready <= 0;
                    uart_data_in_valid <= 1;
                    
                    // Set transmission management registers 
                    tx_counter <= 0;
                    send_delimiter <= 0;      
                end
            end      
        end
    end
end
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

endmodule
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
