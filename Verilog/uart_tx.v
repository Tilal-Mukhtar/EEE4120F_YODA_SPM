`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2021 11:47:35 AM
// Design Name: 
// Module Name: uart_tx
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


module uart_tx (
    input wire clk,
    input wire reset,
    input wire enable,
    input wire [15:0] tx_data,
    input wire tx_tick,
    input wire tx_start,
    output wire tx,
    output reg tx_done
);

// States
localparam IDLE = 0;
localparam START = 1;
localparam DATA = 2;
localparam STOP = 3;

// Internal registers          
reg [1:0] state, next_state;
reg [15:0] data, next_data;
reg tx_bit, next_tx_bit;
reg [3:0] tick_count, next_tick_count;
reg [3:0] bit_count, next_bit_count;

// Sequential logic
always @(posedge clk, negedge reset) begin
    if (reset) begin
        state <= IDLE;
        data <= 0;
        tx_bit <= 1;
        tick_count <= 0;
        bit_count <= 0;
    end
    else if (enable) begin
        state <= next_state;
        data <= next_data;
        tx_bit <= next_tx_bit;
        tick_count <= next_tick_count;
        bit_count <= next_bit_count;
    end
end

// Combinational logic
always @(*) begin
    next_state = state;
    next_data = data;
    next_tick_count = tick_count;
    next_bit_count = bit_count;
    tx_done = 0;

    case (state)
        IDLE: begin    
            next_tx_bit = 1;         
            if (tx_start) begin
                next_state = START;                        
                next_data = tx_data;
                next_tick_count = 0;
            end
        end    

        START: begin
            next_tx_bit = 0;            
            if (tx_tick) begin
                if (tick_count == 15) begin
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
            next_tx_bit = data[0];
            if (tx_tick) begin
                if(tick_count == 15) begin
                    next_data = {1'b0, data[15:1]};
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
            next_tx_bit = 1;
            if (tx_tick) begin
                if(tick_count == 15) begin
                    next_state = IDLE;
                    tx_done = 1;
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
assign tx = tx_bit;

endmodule
