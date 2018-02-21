function OUTPUT = computeDivisors(VectorIn)

%This function accepts a 1 X N vector, and would only accept the vector's
%element value as positive scalar integers.
%It performs a individual check of each vector elements and returns the
%divisors of the elements, and associate the values with the given number
%in a square matrix N
[row, N] = size(VectorIn); %check for size
OUTPUT = 0; % initialize a preallocation.
Temp = 0; %initialize temp data
Long = 0; %initialize how long is vector Temp.
flag = false;

if row ~=1 || floor(sum(VectorIn)) ~= sum(VectorIn)
    error('Ensure Vector Input is 1 X N row Vector, and all elements are Integers')
else
    %compute functions of checking and output Divisors to a Matrix(N X N) 76576500
    
    for ii = 1:N
        Temp = divisors(VectorIn(ii));
        Long = length(Temp);
       
        if Long > 500
        OUTPUT = VectorIn(ii);
        flag = true;
        break
        end
    end
    flag = true;
    
end