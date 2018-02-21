function [ V ] = kcosf(freq,phase)
%this function is a cosine function;
% V(t) = A*cos(2*pi*freq*t + phase)

t = 0 : 0.001 : 2*pi;
A = 1;

V = A*cos(2*pi*freq*t + phase);
plot(V);

end