function GPDT = GProduct( Vector1000, N)
% This function accepts a 1000 element vector (1 X 1000 DIMS)
% It also accepts N, on the product of N number of adjacent digits to
% output a GPDT (Greatest Product within the Vector1000 digits)
% Since there are zeros inside the Vector1000, any product would give it 0,
% making it the minimum product. 
Temp = 1; %initialize values for later calculations
MaxBuffer = 0;%initialize values for later calcuations
Flag = 'NOT FOUND';

%check for Vector1000 to see if it's legal entry.
if numel(Vector1000)<1000 || N < 1 || ~isscalar(N) || floor(N) ~= N
    error('Vector1000 input must be 1X1000 dimension, and N must be a positive scalar integer')
   
else
    
    for ii = 1:(1000-N+1) %reason for 1000 - N+1 is the last sequence of comparison.
        
        
        Temp = Vector1000(ii)*Vector1000(ii+1)*Vector1000(ii+2)*Vector1000(ii+3)*Vector1000(ii+4)*...
               Vector1000(ii+5)*Vector1000(ii+6)*Vector1000(ii+7)*Vector1000(ii+8)*Vector1000(ii+9)*...
               Vector1000(ii+10)*Vector1000(ii+11)*Vector1000(ii+12); %multiplication of 13 digits
                       
        if  Temp > MaxBuffer
            MaxBuffer = Temp;
        end
    end
    GPDT = MaxBuffer;
    
end