`timescale 1ns / 1ps

module spm (
    input wire clk,
    input wire reset,
    input wire enable,
    input wire [15:0] data_in,
    input wire data_in_available,
    input wire data_out_available,
    output reg [15:0] data_out,
    output reg data_in_ready,
    output reg data_out_ready
);  

localparam IDLE = 0;
localparam START = 1;
localparam COMPARE = 2;
localparam STOP = 3;
localparam MIN = 16'h0000;
localparam MAX = 16'hFFFF;
localparam DATA_MSB = 16'h8000;

reg[2:1] state;
reg[31:0] timer;
reg[3:0] counter;
reg[15:0] sample;
reg[15:0] min;
reg[15:0] max;
reg[31:0] total_sample_counter;
reg[31:0] total_samples;
reg[31:0] interval_sample_counter;
reg[31:0] samples_per_interval;

// Sequential logic
always @ (posedge clk, posedge reset) begin
    if (reset) begin
        state = IDLE;
        timer = 0;
        counter = 0;
        sample = 0;
        min = MAX;
        max = MIN;
        total_sample_counter = 0;
        total_samples = 0;
        interval_sample_counter = 0;
        samples_per_interval = 0;
        data_out = 0;
        data_in_ready = 0;
        data_out_ready = 0;
    end
    else if (enable) begin
        data_in_ready = 0;
        data_out_ready = 0;
        data_out = 0;

        case (state)
            IDLE: begin
                if (data_in_available) begin
                    state = START;
                end
            end

            START: begin
                if (data_in_available) begin
                    data_in_ready = 1;
                    sample = data_in;
                    timer = timer + 1;

                    case (counter)
                        0: begin
                        end

                        1: begin
                            total_samples[15:0] = sample;
                        end

                        2: begin
                            total_samples[31:16] = sample;
                        end

                        3: begin
                            samples_per_interval[15:0] = sample;
                        end

                        4: begin
                            samples_per_interval[31:16] = sample;
                        end

                        default: begin
                            counter = 0;
                            state = COMPARE;
                        end
                    endcase

                    counter = counter + 1;
                end
            end

            COMPARE: begin
                if (data_in_available) begin
                    data_in_ready = 1;
                    sample = data_in;
                    timer = timer + 1;
                    
                    if (sample + DATA_MSB < min) begin
                        min = sample;
                    end

                    if (sample + DATA_MSB > max) begin
                        max = sample;
                    end

                    if (total_sample_counter >= total_samples-1) begin
                        data_in_ready = 0;
                        counter = 0;
                        state = STOP;
                    end
                    else if (interval_sample_counter >= samples_per_interval-1) begin
                        data_in_ready = 0;
                        counter = 0;
                        state = STOP;
                    end

                    interval_sample_counter = interval_sample_counter + 1;
                    total_sample_counter = total_sample_counter + 1;
                end
            end

            STOP: begin
                if (data_out_available) begin
                    case (counter)
                        0: begin
                            data_out = min;
                            data_out_ready = 1;
                        end

                        1: begin
                            data_out = max;
                            data_out_ready = 1;
                        end

                        default: begin
                            if (total_sample_counter >= total_samples-1) begin
                                timer = 0;
                                counter = 0;
                                sample = 0;
                                min = MAX;
                                max = MIN;
                                total_sample_counter = 0;
                                total_samples = 0;
                                interval_sample_counter = 0;
                                samples_per_interval = 0;
                                data_out = 0;
                                data_in_ready = 0;
                                data_out_ready = 0;
                                state = IDLE;
                            end
                            else begin
                                counter = 0;
                                interval_sample_counter = 0;
                                min = MAX;
                                max = MIN;
                                state = COMPARE;
                            end
                        end
                    endcase
                    
                    counter = counter + 1;
                end
            end
            
            default: begin
                state = IDLE;
            end
                    
        endcase
    end
end

endmodule
