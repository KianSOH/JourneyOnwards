function A = amazing(M,N)

%feel free to adjust the cos function to sin & vice versa. As 1:N is a for
%loop, you have to be careful to put the cos function outside, and noticed
%the ' transpose for the left side, so that A will become a Z Matrix, and
%the surface plot can only accept Matrix values before it can plot
%anything. Where A is a N by N matrix

A = cos(2*M*pi/N*(1:N))'*cos(2*M*pi/N*(1:N));

surf(A);