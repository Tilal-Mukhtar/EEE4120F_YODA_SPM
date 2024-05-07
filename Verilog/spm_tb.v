`timescale 1ns / 1ps
`include "spm.v"

module spm_tb;
// Testing parameters
parameter CLOCK_PERIOD = 5;
parameter TOTAL_SAMPLES = 32;
parameter SAMPLES_PER_INTERVAL = 4;
parameter TIMEOUT = 1_000;

// SPM inputs
reg clk;
reg reset;
reg enable;
reg [15:0] spm_data_in;
reg spm_data_in_available;
reg spm_data_out_available;

// SPM outputs
wire [15:0] spm_data_out;
wire spm_data_in_ready;
wire spm_data_out_ready;

// Audio samples
reg [15:0] memory [1023:0];

reg [31:0] total_samples;
reg [31:0] samples_per_interval;

integer counter, input_memory_index, output_file, output_memory_index;

spm spm(
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .data_in(spm_data_in),
    .data_in_available(spm_data_in_available),
    .data_out_available(spm_data_out_available),
    .data_out(spm_data_out),
    .data_in_ready(spm_data_in_ready),
    .data_out_ready(spm_data_out_ready)
);  

initial begin
    $readmemh("input.mem", memory, 0, 1023);
    $dumpfile("dump.vcd");
    $dumpvars(0, spm_tb);

    output_file = $fopen("output.mem", "w");  
    
    clk = 0;
    reset = 1;
    enable = 0;
    spm_data_in = 0;
    spm_data_in_available = 1;
    spm_data_out_available = 1;

    total_samples = TOTAL_SAMPLES;
    samples_per_interval = SAMPLES_PER_INTERVAL;

    input_memory_index = 0;
    output_memory_index = 0;
    counter = 0;

    #100

    reset = 0;
    enable = 1;
end

always #(CLOCK_PERIOD/2) clk = ~clk;

always@(negedge clk) begin
    if (output_memory_index/2 == TOTAL_SAMPLES/SAMPLES_PER_INTERVAL || counter == TIMEOUT) begin
        $fclose(output_file);  
        $finish;
    end

    if (enable) begin
        if (spm_data_in_ready) begin
            case (counter)
                0: begin
                    spm_data_in = total_samples[15:0];
                end

                1: begin
                    spm_data_in = total_samples[31:16];
                end

                2: begin
                    spm_data_in = samples_per_interval[15:0];
                end

                3: begin
                    spm_data_in = samples_per_interval[31:16];
                end

                default: begin
                    if (input_memory_index == TOTAL_SAMPLES) begin
                        spm_data_in = 0;
                        spm_data_in_available = 0;
                    end
                    else begin
                        spm_data_in = memory[input_memory_index];
                        input_memory_index = input_memory_index + 1;
                    end
                end
            endcase

            counter = counter + 1;
        end
        
        if (spm_data_out_ready) begin
            $fdisplayh(output_file, spm_data_out);
            output_memory_index = output_memory_index + 1;
        end
    end
end

endmodule
