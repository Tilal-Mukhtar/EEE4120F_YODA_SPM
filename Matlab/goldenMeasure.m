function goldenMeasure(method, file)
    [audio,fs] = audioread(file);
    if method == 1
       
        % m = memmapfile('input.mem'); 
        % audio = m.Data;
        min = audio(1); % choose min
        max = audio(1); % choose max
        tic; [min, max] = MinMax(audio,min, max); time1 = toc;
        disp(['Minimum value: ', num2str(min)]);
        disp(['Maximum value: ', num2str(max)]);
        disp(['Runtime: ', num2str(time1*1000), 'ms']);

    elseif method == 2
        % m = memmapfile('input.mem');
        % audio = m.Data; 
        interval = input('Enter an Interval Length: '); % input interval length
        tic; [min_arr, max_arr] = MinMaxInt(audio, interval);

        minMean = mean(min_arr); % find mean of array
        minStd = std(min_arr); % find standard deviation of array
        limit_val_1 = minMean + minStd; % upper limit
        limit_val_2 = minMean - minStd; % lower limit
        min_arr(min_arr>limit_val_1) = []; % remove elements not within one standard deviation of the mean
        min_arr(min_arr<limit_val_2) = []; % remove elements not within one standard deviation of the mean

        maxMean = mean(max_arr); % find mean of array
        maxStd = std(max_arr); % find standard deviation of array
        limit_val_1 = maxMean + maxStd;  % upper limit
        limit_val_2 = maxMean - maxStd; % lower limit
        max_arr(max_arr>limit_val_1) = []; % remove elements not within one standard deviation of the mean
        max_arr(max_arr<limit_val_2) = []; % remove elements not within one standard deviation of the mean
        time2 = toc;
        disp(min_arr); % display final array
        disp(max_arr); % display final array
        disp(['Runtime: ', num2str(time2*1000), 'ms']);
        



    end
end



%% 
function [min, max] = MinMax(audio, min, max)
    for i=1:length(audio)
        if audio(i) < min
            min = audio(i);
       
        elseif audio(i) > max
            max = audio(i);
        end 
    end
    

end



%% 
function [min_arr, max_arr] = MinMaxInt(audio, interval)
    
    numIntervals = floor(length(audio) / interval); % calculate the number of intervals
    startIndex = 1;
    endIndex = interval;

    min_arr = zeros(1, numIntervals); % create the minimum array
    max_arr = zeros(1, numIntervals); % create the maximum array

    for i=1:numIntervals
        audioInt = audio(startIndex:endIndex); % section off the audio recording
        min = audioInt(1);
        max = audioInt(1); 
        [min, max] = MinMax(audioInt, min, max); % implement MinMax function
        min_arr(i) = min;
        max_arr(i) = max;
         
        startIndex = startIndex + interval; % update startIndex
        if endIndex + interval > length(audio)
            endIndex = length(audio);
        else
            endIndex = endIndex + interval;
        end
        % update endIndex
    end

end
