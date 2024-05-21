`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// UCT EEE4120F
// Author: Tilal Zaheer Mukhtar
// 
// Create Date: 17.05.2024 10:59:33
// Project Name: YODA SPM
// Module Name: spm
// Target Devices: Nexys A7-100T
// Tool Versions: Vivado ML 2023.2
// Description: Sound processing module for finding min and max values over in audio
//              stream over a given interval and filtering out values outside one
//              standard deviation of their respective mean
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module spm (
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Inputs
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    input wire clk,                     // Clock line
    input wire reset,                   // Reset line
    input wire enable,                  // Enable line
    input wire start,                   // Start processing audio stream
    input wire [31:0] interval,         // Interval over which to find min and max in audio stream
    input wire signed [15:0] data_in,   // Input 16-bit signed audio samples
    input wire data_in_valid,           // Input data is valid
    input wire min_out_ready,           // Receiver ready to read min output
    input wire max_out_ready,           // Receiver ready to read max output
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Outputs
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    output wire signed [15:0] min_out,  // Output 16-bit signed min value from FIFO
    output wire signed [15:0] max_out,  // Output 16-bit signed max value from FIFO
    output wire data_in_ready,          // SPM ready to read input data
    output wire min_out_valid,          // Output min is valid
    output wire max_out_valid,          // Output max is valid
    output reg [31:0] timer,            // SPM processing time in clock cycles
    output reg busy,                    // SPM busy processing
    output reg done                     // SPM done processing
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
);

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Local Parameter Declarations
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// States
localparam IDLE = 0;                    // Not processing audio stream
localparam COMPARE = 1;                 // Read input data and finding min and max values
localparam STORE = 2;                   // Store the min and max values
localparam SQUARE_ROOT = 3;             // Find the square root of the numerator in the standard deviation calculation
localparam DIVIDE = 4;                  // Find the mean and standard deviation
localparam FILTER = 5;                  // Filter min and max values to be within one standard deviation of the mean

// Values 
localparam MIN = 16'h8001;              // Minimum possible value
localparam MAX = 16'h7FFF;              // Maximum possible value
localparam END_OF_STREAM = 16'h8000;    // Value used to indicate the end of the audio stream
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Internal Variable Declarations
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Store current and next state
reg [2:0] current_state, next_state;

// Flags for entering states
reg compare;
reg store;
reg divide;
reg sqrt;
reg filter;

// Flag for reaching the end of the stream
reg end_of_stream;

// Count values in current interval
reg [31:0] interval_counter;

// Store min and max values found
reg signed [15:0] min, max;

// Values for calculating the mean and standard deviations
reg [31:0] min_counter, max_counter;
reg signed [31:0] min_sum, max_sum;
reg [63:0] min_sq_sum, max_sq_sum;

// Store mean and standard deviation values
reg signed [15:0] min_mean, max_mean;
reg signed [15:0] min_std, max_std;

// Connect to the FIFO IP modules for storing the min and max values
wire signed [15:0] min_fifo_in, max_fifo_in;
wire min_fifo_write, max_fifo_write;

wire signed [15:0] min_fifo_out, max_fifo_out;
wire min_fifo_read, max_fifo_read;

wire min_fifo_full, max_fifo_full;
wire min_fifo_empty, max_fifo_empty;

// Connect to the square root IP modules for calculating the standard deviations
wire [47:0] min_sqrt_in, max_sqrt_in;
wire min_sqrt_in_valid, max_sqrt_in_valid;

wire [15:0] min_sqrt_out, max_sqrt_out;
wire min_sqrt_out_valid, max_sqrt_out_valid;
reg min_sqrt_out_valid_reg, max_sqrt_out_valid_reg;

// Connect to the divider IP modules for calculating the means
wire signed [31:0] min_dividend_1, max_dividend_1;
wire min_dividend_1_valid, max_dividend_1_valid;

wire signed [31:0] min_divisor_1, max_divisor_1;
wire min_divisor_1_valid, max_divisor_1_valid;

wire signed [63:0] min_div_1_out, max_div_1_out;
wire min_div_1_out_valid, max_div_1_out_valid;
reg min_div_1_out_valid_reg, max_div_1_out_valid_reg;

// Connect to the divider IP modules for calculating the standard deviations
wire signed [31:0] min_dividend_2, max_dividend_2;
wire min_dividend_2_valid, max_dividend_2_valid;

wire signed [31:0] min_divisor_2, max_divisor_2;
wire min_divisor_2_valid, max_divisor_2_valid;

wire signed [63:0] min_div_2_out, max_div_2_out;
wire min_div_2_out_valid, max_div_2_out_valid;
reg min_div_2_out_valid_reg, max_div_2_out_valid_reg;

// Connect to the FIFO IP modules for storing standard deviation filtered min and max values
wire signed [15:0] filt_min_fifo_in, filt_max_fifo_in;
wire filt_min_fifo_write, filt_max_fifo_write;

wire [15:0] filt_min_fifo_out, filt_max_fifo_out;
wire filt_min_fifo_read, filt_max_fifo_read;

wire filt_min_fifo_full, filt_max_fifo_full;
wire filt_min_fifo_empty, filt_max_fifo_empty;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// IP modules
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// FIFO IP module for storing min values
fifo_generator_0 min_fifo (
    .clk(clk),
    .rst(reset),
    .din(min_fifo_in),
    .wr_en(min_fifo_write),
    .rd_en(min_fifo_read),
    .dout(min_fifo_out),
    .full(min_fifo_full),
    .empty(min_fifo_empty)
);

// FIFO IP module for storing max values
fifo_generator_0 max_fifo (
    .clk(clk),
    .rst(reset),
    .din(max_fifo_in),
    .wr_en(max_fifo_write),
    .rd_en(max_fifo_read),
    .dout(max_fifo_out),
    .full(max_fifo_full),
    .empty(max_fifo_empty)
);

// Square root IP module for calculating the standard deviation of the min values
cordic_0 min_sqrt (
    .aclk(clk),
    .s_axis_cartesian_tdata(min_sqrt_in),
    .s_axis_cartesian_tvalid(min_sqrt_in_valid),
    .m_axis_dout_tdata(min_sqrt_out),
    .m_axis_dout_tvalid(min_sqrt_out_valid)
);

// Square root IP module for calculating the standard deviation of the max values
cordic_0 max_sqrt (
    .aclk(clk),
    .s_axis_cartesian_tdata(max_sqrt_in),
    .s_axis_cartesian_tvalid(max_sqrt_in_valid),
    .m_axis_dout_tdata(max_sqrt_out),
    .m_axis_dout_tvalid(max_sqrt_out_valid)
);

// Divider IP module for calculating the mean of the min values
div_gen_0 min_divider_1 (
    .aclk(clk),
    .s_axis_divisor_tdata(min_divisor_1),
    .s_axis_divisor_tvalid(min_divisor_1_valid),
    .s_axis_dividend_tdata(min_dividend_1),
    .s_axis_dividend_tvalid(min_dividend_1_valid),
    .m_axis_dout_tdata(min_div_1_out),
    .m_axis_dout_tvalid(min_div_1_out_valid)
);

// Divider IP module for calculating the mean of the max values
div_gen_0 max_divider_1 (
    .aclk(clk),
    .s_axis_divisor_tdata(max_divisor_1),
    .s_axis_divisor_tvalid(max_divisor_1_valid),
    .s_axis_dividend_tdata(max_dividend_1),
    .s_axis_dividend_tvalid(max_dividend_1_valid),
    .m_axis_dout_tdata(max_div_1_out),
    .m_axis_dout_tvalid(max_div_1_out_valid)
);

// Divider IP module for calculating the standard deviation of the min values
div_gen_0 min_divider_2 (
    .aclk(clk),
    .s_axis_divisor_tdata(min_divisor_2),
    .s_axis_divisor_tvalid(min_divisor_2_valid),
    .s_axis_dividend_tdata(min_dividend_2),
    .s_axis_dividend_tvalid(min_dividend_2_valid),
    .m_axis_dout_tdata(min_div_2_out),
    .m_axis_dout_tvalid(min_div_2_out_valid)
);

// Divider IP module for calculating the standard deviation of the max values
div_gen_0 max_divider_2 (
    .aclk(clk),
    .s_axis_divisor_tdata(max_divisor_2),
    .s_axis_divisor_tvalid(max_divisor_2_valid),
    .s_axis_dividend_tdata(max_dividend_2),
    .s_axis_dividend_tvalid(max_dividend_2_valid),
    .m_axis_dout_tdata(max_div_2_out),
    .m_axis_dout_tvalid(max_div_2_out_valid)
);

// FIFO IP module for storing standard deviation filtered min values
fifo_generator_0 filt_min_fifo (
    .clk(clk),
    .rst(reset),
    .din(filt_min_fifo_in),
    .wr_en(filt_min_fifo_write),
    .rd_en(filt_min_fifo_read),
    .dout(filt_min_fifo_out),
    .full(filt_min_fifo_full),
    .empty(filt_min_fifo_empty)
);

// FIFO IP module for storing standard deviation filtered max values
fifo_generator_0 filt_max_fifo (
    .clk(clk),
    .rst(reset),
    .din(filt_max_fifo_in),
    .wr_en(filt_max_fifo_write),
    .rd_en(filt_max_fifo_read),
    .dout(filt_max_fifo_out),
    .full(filt_max_fifo_full),
    .empty(filt_max_fifo_empty)
);
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Sequential Logic
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
always@ (posedge clk or posedge reset) begin
    // Reset to initial state
    if (reset) begin
        // Set initial state to idle
        current_state <= IDLE;
        
        // Output registers
        timer <= 0;
        busy <= 0;
        done <= 0;
        
        // Flag registers
        compare <= 0;
        store <= 0;
        divide <= 0;
        sqrt <= 0;
        filter <= 0;
        end_of_stream <= 0;
        interval_counter <= 0;       
        
        // Min and max registers
        min <= MAX;
        max <= MIN;
        
        // Registers for calculating mean and standard deviation
        min_counter <= 0;
        max_counter <= 0;
        min_sum <= 0;
        max_sum <= 0;
        min_sq_sum <= 0;
        max_sq_sum <= 0;
        
        // Mean and standard deviation registers
        min_mean <= 0;
        max_mean <= 0;
        min_std <= 0;
        max_std <= 0;
        
        // Registers for storing square root and divider IP module flags
        min_sqrt_out_valid_reg <= 0;
        max_sqrt_out_valid_reg <= 0;
        min_div_1_out_valid_reg <= 0;
        max_div_1_out_valid_reg <= 0;
        min_div_2_out_valid_reg <= 0;
        max_div_2_out_valid_reg <= 0;
    end
    // Begin processing if enabled
    else if (enable) begin
        // Synchronously update current state
        current_state <= next_state;
        
        // Finite state machine
        case (current_state)
            // Idle
            IDLE: begin
                // Reset to initial state before processing begins on the next clock cycle
                if (next_state == COMPARE) begin
                    // Output registers
                    timer <= 0;
                    busy <= 0;
                    done <= 0;
                    
                    // Flag registers
                    compare <= 0;
                    store <= 0;
                    divide <= 0;
                    sqrt <= 0;
                    filter <= 0;
                    end_of_stream <= 0;
                    interval_counter <= 0;       
                    
                    // Min and max registers
                    min <= MAX;
                    max <= MIN;
                    
                    // Registers for calculating mean and standard deviation
                    min_counter <= 0;
                    max_counter <= 0;
                    min_sum <= 0;
                    max_sum <= 0;
                    min_sq_sum <= 0;
                    max_sq_sum <= 0;
                    
                    // Mean and standard deviation registers
                    min_mean <= 0;
                    max_mean <= 0;
                    min_std <= 0;
                    max_std <= 0;
                    
                    // Registers for storing square root and divider IP module flags
                    min_sqrt_out_valid_reg <= 0;
                    max_sqrt_out_valid_reg <= 0;
                    min_div_1_out_valid_reg <= 0;
                    max_div_1_out_valid_reg <= 0;
                    min_div_2_out_valid_reg <= 0;
                    max_div_2_out_valid_reg <= 0;
                end
            end
            
            // Find min and max values for current interval
            COMPARE: begin
                // Increment timer
                timer <= timer + 1;
                
                // Reset state flag
                compare <= 0;
                
                // Check for valid input data
                if (data_in_valid) begin
                    // Check if the end of the audio stream has been reached
                    if (data_in == END_OF_STREAM) begin
                        end_of_stream <= 1;
                    end
                    // Update the min and max values
                    else begin
                        if (data_in < min) min <= data_in;
                        if (data_in > max) max <= data_in;
                        interval_counter <= interval_counter + 1;
                    end
                end
                
                // Set state flag for next state
                if (next_state == COMPARE) begin
                    compare <= 1;
                end
                else if (next_state == STORE) begin
                    store <= 1;
                end
                else if (next_state == SQUARE_ROOT) begin
                    sqrt <= 1;
                end
            end
            
            // Store the min and max values for each interval
            STORE: begin
                // Increment timer
                timer <= timer + 1;
                
                // Reset state flag
                store <= 0;
                
                // Reset min and max values and interval counter
                interval_counter <= 0;
                min <= MAX;
                max <= MIN;
                
                // Update values used to calculate the means and standard deviations
                min_sum <= min_sum + min;
                min_sq_sum <= min_sq_sum + min*min;
                min_counter <= min_counter + 1;
                
                max_sum <= max_sum + max;
                max_sq_sum <= max_sq_sum + max*max;
                max_counter <= max_counter + 1;
                
                // Set state flag for next state         
                if (next_state == COMPARE) begin
                    compare <= 1;
                end
                else if (next_state == SQUARE_ROOT) begin
                    sqrt <= 1;
                end
            end
            
            // Apply the square roots required for finding the standard deviations
            SQUARE_ROOT: begin
                // Increment timer
                timer <= timer + 1;
                
                // Reset state flag
                sqrt <= 0;
                
                // Set state flag for next state
                if (next_state == DIVIDE) begin 
                    divide <= 1;
                end
            end
            
            // Apply the divisions require for finding the means and standard deviations
            DIVIDE: begin
                // Increment timer
                timer <= timer + 1;
                
                // Reset state flag
                divide <= 0;
                
                // Set state flag for next state
                if (next_state == FILTER) begin 
                    filter <= 1;
                    
                    // Upate meanx and standard deviations
                    min_mean <= min_div_1_out[47:32];
                    max_mean <= max_div_1_out[47:32];
                    min_std <= min_div_2_out[47:32];
                    max_std <= max_div_2_out[47:32];
                end
            end
            
            // Filter the min and max values to remove values outside one standard deviation of the mean
            FILTER: begin
                // Increment timer
                timer <= timer + 1;
                
                // Set state flags for next state
                if (next_state == IDLE) begin
                    filter <= 0;
                    busy <= 0;
                    done <= 1;
                end
            end
        endcase
    end
end
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Combinational Logic
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
always@ (*) begin
    // Set next state to current state by default
    next_state = current_state;
    
    // Detect positive edge on square root and divider IP module flags
    if (min_sqrt_out_valid) min_sqrt_out_valid_reg <= 1;
    if (max_sqrt_out_valid) max_sqrt_out_valid_reg <= 1;
    if (min_div_1_out_valid) min_div_1_out_valid_reg <= 1;
    if (max_div_1_out_valid) max_div_1_out_valid_reg <= 1;
    if (min_div_2_out_valid) min_div_2_out_valid_reg <= 1;
    if (max_div_2_out_valid) max_div_2_out_valid_reg <= 1;
    
    // State transitions
    case (current_state)
        // Idle
        IDLE: begin
            if (start) next_state = COMPARE;
        end
        
        // Find min and max values for current interval
        COMPARE: begin
            if (interval_counter == 0 && end_of_stream) next_state = SQUARE_ROOT;
            else if (interval_counter == interval-1 || end_of_stream) next_state = STORE;
        end
        
        // Store the min and max values for each interval
        STORE: begin
            if (end_of_stream) next_state = SQUARE_ROOT;
            else next_state = COMPARE;
        end
        
        // Apply the divisions require for finding the means and standard deviations
        SQUARE_ROOT: begin
            if (min_sqrt_out_valid_reg && max_sqrt_out_valid_reg) next_state = DIVIDE;
        end
        
        // Apply the divisions require for finding the means and standard deviations
        DIVIDE: begin
            if (min_div_1_out_valid_reg && max_div_1_out_valid_reg && min_div_2_out_valid_reg && max_div_2_out_valid_reg) next_state = FILTER;
        end

        // Filter the min and max values to remove values outside one standard deviation of the mean
        FILTER: begin
            if ((min_fifo_empty && max_fifo_empty) || filt_min_fifo_full || filt_max_fifo_full) next_state = IDLE;
        end
    endcase
end
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Wire Assignments
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Connect wires to the FIFO IP modules for storing the min and max values
assign min_fifo_in = min;
assign min_fifo_write = store;

assign max_fifo_in = max;
assign max_fifo_write = store;

// Connect wires to the square root IP modules for calculating the standard deviations
assign min_sqrt_in = min_counter*min_sq_sum - min_sum*min_sum;
assign min_sqrt_in_valid = sqrt;

assign max_sqrt_in = max_counter*max_sq_sum - max_sum*max_sum;
assign max_sqrt_in_valid = sqrt;

// Connect wires to the divider IP modules for calculating the means
assign min_divisor_1 = min_counter;
assign min_dividend_1 = min_sum;
assign min_divisor_1_valid = divide;
assign min_dividend_1_valid = divide;

assign max_divisor_1 = max_counter;
assign max_dividend_1 = max_sum;
assign max_divisor_1_valid = divide;
assign max_dividend_1_valid = divide;

// Connect wires to the divider IP modules for calculating the standard deviations
assign min_divisor_2 = min_counter;
assign min_dividend_2 = min_sqrt_out;
assign min_divisor_2_valid = divide;
assign min_dividend_2_valid = divide;

assign max_divisor_2 = max_counter;
assign max_dividend_2 = max_sqrt_out;
assign max_divisor_2_valid = divide;
assign max_dividend_2_valid = divide;

// Connect wires to the FIFO IP modules for storing standard deviation filtered min and max values
assign filt_min_fifo_in = min_fifo_out;
assign min_fifo_read = filter & ~min_fifo_empty;
assign filt_min_fifo_write = filter & ~filt_min_fifo_full & (filt_min_fifo_in <= min_mean+min_std) & (filt_min_fifo_in >= min_mean-min_std);

assign filt_max_fifo_in = max_fifo_out;
assign max_fifo_read = filter & ~max_fifo_empty;
assign filt_max_fifo_write = filter & ~filt_max_fifo_full & (filt_max_fifo_in <= max_mean+max_std) & (filt_max_fifo_in >= max_mean-max_std);

// Connect wires to the outputs
assign data_in_ready = compare & ~min_fifo_full & ~max_fifo_full;

assign min_out = filt_min_fifo_out;
assign min_out_valid = ~filt_min_fifo_empty;
assign filt_min_fifo_read = min_out_ready;

assign max_out = filt_max_fifo_out;
assign max_out_valid = ~filt_max_fifo_empty;
assign filt_max_fifo_read = max_out_ready;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

endmodule
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
