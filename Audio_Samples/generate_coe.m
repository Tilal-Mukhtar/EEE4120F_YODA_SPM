% Matlab script used to generate .COE files to initialise a BRAM module in Vivado
% Author: Tilal Zaheer Mukhtar

% Specify the audio parameters
bit_depth = 16;
sample_rate = 44100;
duration = 5;
memory_depth = sample_rate*duration;
max_int = 2^bit_depth/2 - 1;

% Create the audio samples
%f = 1;
%t = linspace(0, duration, duration*sample_rate);
%samples = int16(max_int * sawtooth(2*pi*f*t,1/2));
%plot(t, samples)

% Read in audio file
samples = audioread("1Hz_5.0s.wav");
samples = int16(31250 * samples);

% Write the samples out to a .COE file
radix = 16;
file = "5s_1Hz_audio.coe";
file_id = fopen(file, "w");

% Write the header information
fprintf(file_id, ...
    "; Memory initialization file for Single Port Block Memory.\n;\n" + ...
    "; This .COE file specifies initialization values for a block\n" + ...
    "; memory of depth=%d, and width=%d.\n;\n", memory_depth, bit_depth);

% Write the radix value
fprintf(file_id, "memory_initialization_radix = %d;\n", radix);

% Write the sample values
switch radix
    case 2,   samples = dec2bin(samples);
    case 10,  samples = dec2str(samples); 
    case 16,  samples = dec2hex(samples);
end
fprintf(file_id, "memory_initialization_vector =\n");
[r,~] = size(samples);
for i = 1:r-1
    fprintf(file_id,"%s,\n", samples(i,:));   
end

% Add the semicolon to the last coefficient
fprintf(file_id, "%s;", samples(r,:)); 

% Close the file
fclose(file_id);