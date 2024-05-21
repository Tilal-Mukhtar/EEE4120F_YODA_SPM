`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// UCT EEE4120F
// Author: Tilal Zaheer Mukhtar
// 
// Create Date: 17.05.2024 10:59:33
// Project Name: YODA SPM
// Module Name: uart_tx
// Target Devices: Nexys A7-100T
// Tool Versions: Vivado ML 2023.2
// Description: UART transmitter module
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module uart_tx (
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Inputs
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    input wire clk,             // Clock line
    input wire reset,           // Reset line
    input wire enable,          // Enable line
    input wire [7:0] tx_data,   // Byte of data transmitted over UART tx line
    input wire tx_tick,         // Clock line at 16 times the baud rate
    input wire tx_start,        // Start flag for beginning UART transmission
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Outputs
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    output reg tx,      // UART tx line
    output reg tx_done  // Flag for indicating current transmission is complete
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Local Parameter Declarations
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// States
localparam IDLE = 0;
localparam START = 1;
localparam TRANSMIT = 2;
localparam STOP = 3;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Internal Variable Declarations
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
reg [1:0] state, next_state;            // Current and next states
reg [7:0] data, next_data;              // Next tx data value
reg next_tx_bit;                        // Next tx bit value
reg [3:0] tick_count, next_tick_count;  // Current and next tick count values
reg [3:0] bit_count, next_bit_count;    // Current and next bit count values
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Synchronous Logic
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
always @ (posedge clk or posedge reset) begin

    // Reset to initial state
    if (reset) begin
        state <= IDLE;
        data <= 0;
        tx <= 1;
        tick_count <= 0;
        bit_count <= 0;
    end 
    // Start processing if enabled
    else if (enable) begin
        // Update registers synchronously
        state <= next_state;
        data <= next_data;
        tx <= next_tx_bit;
        tick_count <= next_tick_count;
        bit_count <= next_bit_count;
    end
end
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Combinational Logic
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
always @ (*) begin
    // Use current values as default
    next_state = state;
    next_data = data;
    next_tx_bit = tx;
    next_tick_count = tick_count;
    next_bit_count = bit_count;

    // Reset flag for trasmission complete  
    tx_done = 0;

    case (state)
        IDLE: begin
            // Keep tx line high while not transmitting
            next_tx_bit = 1;         
            // If transmission flag set
            if (tx_start) begin
                next_state = START;                        
                next_data = tx_data;
                next_tick_count = 0;
            end
        end

        START: begin
            // Keep tx line low while transmitting start bit
            next_tx_bit = 0;

            // Update values on every tick           
            if (tx_tick) begin
                // Count to the end of the start bit
                if (tick_count == 15) begin
                    next_state = TRANSMIT;

                    // Reset tick count
                    next_tick_count = 0;

                    // Reset bit count
                    next_bit_count = 0;
                end
                // Increment tick count
                else begin                      
                    next_tick_count = tick_count + 1;
                end
            end
        end

        TRANSMIT: begin
            // Set next tx bit to first bit of data byte
            next_tx_bit = data[0];

            // Update values on every tick  
            if (tx_tick) begin
                // Count to the end of each data bit
                if(tick_count == 15) begin
                    // Shift current tx bit out of tx data
                    next_data = {1'b0, data[7:1]};

                    // Reset tick count
                    next_tick_count = 0;

                    // Count 8 data bits
                    if (bit_count == 7) begin
                        next_state = STOP;
                    end
                    // Increment bit count
                    else begin
                        next_bit_count = bit_count + 1;
                    end
                end
                // Increment tick count
                else begin
                    next_tick_count = tick_count + 1;
                end
            end
        end

        STOP: begin
            // Keep tx line high while transmitting stop bit
            next_tx_bit = 1;

            // Update values on every tick  
            if (tx_tick) begin
                // Count to the end of the stop bit
                if(tick_count == 15) begin
                    // Return to idle state
                    next_state = IDLE;

                    // Set flag for transmission complete
                    tx_done = 1;
                end
                // Increment tick counter
                else begin
                    next_tick_count = tick_count + 1;
                end
            end
        end
        
        // Set next state to idle by default
        default: begin
            next_state = IDLE;
        end
    endcase
end
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

endmodule
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
