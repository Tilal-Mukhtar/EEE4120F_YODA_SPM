`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2021 11:47:35 AM
// Design Name: 
// Module Name: uart_rx
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


module uart_rx (
    input wire clk, 
    input wire reset, 
    input wire enable,
    input wire rx,
    input wire rx_tick,
    output wire[15:0] rx_data,
    output reg rx_done
);

// States
localparam IDLE = 0;
localparam START = 1;
localparam DATA = 2;
localparam STOP = 3;

// Internal registers        
reg [1:0] state, next_state;
reg [15:0] data, next_data;
reg [3:0] tick_count, next_tick_count;
reg [3:0] bit_count, next_bit_count;

// Sequential logic
always @ (posedge clk, posedge reset) begin
    if (reset) begin
        state <= IDLE;
        data <= 0;
        tick_count <= 0;
        bit_count <= 0;
    end 
    else if (enable) begin
        state <= next_state;
        data <= next_data;
        tick_count <= next_tick_count;
        bit_count <= next_bit_count;
    end
end

// Combinational logic
always @ (*) begin
    next_state = state;
    next_data = data;
    next_tick_count = tick_count;
    next_bit_count = bit_count;
    rx_done = 0;

    case (state)
        IDLE: begin           
            if (~rx) begin
                next_state = START;                        
                next_tick_count = 0;
            end
        end

        START: begin         
            if (rx_tick) begin
                if (tick_count == 7) begin
                    next_state = DATA;
                    next_tick_count = 0;
                    next_bit_count = 0;
                end
                else begin                        
                    next_tick_count = tick_count + 1;
                end
            end
        end

        DATA: begin
            if (rx_tick) begin
                if(tick_count == 15) begin
                    next_data = {rx, data[15:1]};
                    next_tick_count = 0;
                    if (bit_count == 15) begin
                        next_state = STOP;
                    end
                    else begin
                        next_bit_count = bit_count + 1;
                    end
                end
                else begin
                    next_tick_count = tick_count + 1;
                end
            end
        end

        STOP: begin
            if (rx_tick) begin
                if (tick_count == 15) begin
                    next_state = IDLE;
                    rx_done = 1;
                end
                else begin
                    next_tick_count = tick_count + 1;
                end
            end
        end

        default: begin
            next_state = IDLE;
        end
    endcase
end

// Output continuous assignment
assign rx_data = data;

endmodule
