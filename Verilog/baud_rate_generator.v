`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2021 01:45:32 PM
// Design Name: 
// Module Name: timer_parameter
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


module baud_rate_generator #(
    parameter CLOCK_RATE = 100_000_000,
    parameter BAUD_RATE = 460_800
)(
    input wire clk,
    input wire reset,
    input wire enable,
    output wire tick
);

// Baud rate parameters
localparam TICK_PERIOD = $rtoi(CLOCK_RATE / (BAUD_RATE * 16) + 0.5);
localparam COUNTER_WIDTH = $clog2(UART_CLOCK_PERIOD);

// Counter to prescale clock down to baud rate
reg [COUNTER_WIDTH - 1:0] counter, next_counter;

// Sequential logic
always @(posedge clk, posedge reset) begin
    if (reset) begin
        counter <= 0;
    end
    else if (enable) begin
        counter <= next_counter;
    end
end

// Combinational logic
always @(*) begin
    if (tick) begin
        next_counter = 0;
    end
    else begin
        next_counter = next_counter + 1;
    end
end

// Output assignment
assign tick (counter == UART_CLOCK_PERIOD-1);

endmodule