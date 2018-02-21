function [ V ] = ksinf(freq,phase)
%this function is a sine function;
% V(t) = A*sin(2*pi*freq*t + phase)

t = 0 : 0.001 : 2*pi;
A = 1;

V = A*sin(2*pi*freq*t + phase);
plot(V);

end

