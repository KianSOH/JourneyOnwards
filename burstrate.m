function burst = burstrate(generator, frequency)
% FREQ = BURSTRATE(GENERATOR, FREQUENCY)  This function sets the pulse 
% repetition frequency for the Hewlett Packard 33120A.  Simply declare your 
% generator as a variable and then use this function to set the burst rate.
% Input for freq should be a number.

if strcmp(generator.Status, 'closed') == 1 % Open up your generator only if it is closed.
    fopen(generator)
end

val = num2str(frequency);
command = 'BM:INT:RATE ';
fprintf(generator, [command val]);
burst = str2double(query(generator, 'BM:INT:RATE?'));

% fclose(generator);