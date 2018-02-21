function [Trinity, Vn] = Triangle(N)
%This function outputs a 1 X N Vector of TRIANGLE NUMBERS. 76576500
%https://en.wikipedia.org/wiki/Triangle_Numbers
%The equation for TRIANGLE NUMBERS are as follow;
% T(n) = Summation(1:n){k} = 1 + 2 + 3 + 4 + 5 + ... + n = n(n+1)/2
% T(n) = (n+1)Choose2 (it's a binomial coefficient)
% In order to modify this code to print out from 1st Triangle to Nth
% Triangle, this code could be used to output Vector Information based on
% Nth Terms of Triangle Number.
Trinity = 'NOT FOUND';  %initialize data.
Temp    = 0;            %initialize data.
Vn      = zeros(1,N);   %initialize data.

if N<0 || floor(N)~= N || ~isscalar(N)  
    error('Input N must be a Positive Scalar Integer 1 2 3 ... +INF')
else
    for i = 1:N
        
        Temp = Temp + i;% Equation for Triangle Number.
        
        Vn(i) = Temp; %updating 1st to Nth Value of Triangle into Vector
    end

    
end


Trinity = Temp;%Final Nth Value of Triangle Number.

end

