function DC = dutycycle(generator, ncyc)
% FREQ = GENVOLT(GENERATOR, FREQUENCY)  This function sets the voltage for 
% the Hewlett Packard 33120A.  Simply declare your generator as a variable 
% and then use this function to set the burst rate. Input for voltage should 
% be a number.

if strcmp(generator.Status, 'closed') == 1 % Open up your generator only if it is closed.
    fopen(generator)
end

val = num2str(ncyc);
command = 'BM:NCYC ';
fprintf(generator, [command val]);
DC = str2double(query(generator, 'BM:NCYC?'));

% fclose(generator);