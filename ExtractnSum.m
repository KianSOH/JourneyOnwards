function [OUTCOME,VectorD] = ExtractnSum(Data)
%This function accepts a 5000 digit string, and split them up to 100 set of
%50 digit numbers, and convert it from string to numbers and then perform a
%sum of the 50 digit numbers X 100 sets, and output a really large number.
%The question only want to see the first 10 digit of the OUTCOME sum.
%numbers. Useful functions, strcat(), size(), str2num(), sum().
OUTCOME = 0;%initialize.
VectorD = zeros(1,100);%preallocate working space to store sets of numbers into VectorD
posV = 0;
Temp = 0;

for ii = 0:50:4950 %for extraction of 100 sets of 50 numbers
          
        Temp = Data(ii+1:ii+50); %assignment of values
        Temp = str2num(Temp);
        posV = posV + 1; %to step from 1 to 50 counts
        VectorD(posV) = Temp; %assigns VectorD it's values.
end

OUTCOME = sum(VectorD);
         

end

