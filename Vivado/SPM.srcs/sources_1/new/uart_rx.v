`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// UCT EEE4120F
// Reference: Based on code written by Anas Salah Eddin available at https://github.com/aseddin/ece_3300
// 
// Create Date: 17.05.2024 10:59:33
// Project Name: YODA SPM
// Module Name: uart_rx
// Target Devices: Nexys A7-100T
// Tool Versions: Vivado ML 2023.2
// Description: UART receiver module
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module uart_rx (
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Inputs
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    input wire clk,         // Clock line
    input wire reset,       // Reset line
    input wire enable,      // Enable line
    input wire rx,          // UART rx line
    input wire rx_tick,     // Clock line at 16 times the baud rate
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Outputs
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    output reg [7:0] rx_data,   // Byte of data received over UART rx line
    output reg rx_done          // Flag for indicating current receive is complete
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Local Parameter Declarations
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// States
localparam IDLE = 0;
localparam START = 1;
localparam RECEIVE = 2;
localparam STOP = 3;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Internal Variable Declarations
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
reg [1:0] state, next_state;            // Current and next states
reg [7:0] next_rx_data;                 // Next rx data value
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
        rx_data <= 0;
        tick_count <= 0;
        bit_count <= 0;
    end 
    // Start processing if enabled
    else if (enable) begin
        // Update registers synchronously
        state <= next_state;
        rx_data <= next_rx_data;
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
    next_rx_data = rx_data;
    next_tick_count = tick_count;
    next_bit_count = bit_count;

    // Reset flag for receive complete
    rx_done = 0;

    case (state)
        IDLE: begin
            // Wait for rx line to be pulled low       
            if (~rx) begin
                next_state = START;                        
                next_tick_count = 0;
            end
        end

        START: begin
            // Update values on every tick  
            if (rx_tick) begin
                // Count to the centre of the start bit
                if (tick_count == 7) begin
                    next_state = RECEIVE;
                    
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

        RECEIVE: begin
            // Update values on every tick  
            if (rx_tick) begin
                // Count to the centre of each data bit
                if(tick_count == 15) begin
                    // Shift current rx bit into rx data
                    next_rx_data = {rx, rx_data[7:1]};
                    
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
            // Update values on every tick  
            if (rx_tick) begin
                // Count to the centre of the stop bit
                if (tick_count == 15) begin
                    // Return to idle state
                    next_state = IDLE;
                    
                    // Set flag for receive complete
                    rx_done = 1;
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
