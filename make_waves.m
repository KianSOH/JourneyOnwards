function A = make_waves(M,N)
% % Problem 23. Write a function called make_waves that takes two positive
% integer
%   
% A = make_waves(M,N), then  A  is an N-by-N array of products of sine
% A = make_square_waves(M,N), then  A  is an N-by-N array (not M-by-N) of
% waves whose amplitude is 1 and whose period is N/M . The result can be
% products of square waves whose amplitude is 1 and whose period is N/M .
% The result can be achieved by modifying the function make_waves
% achieved by means of the following expression:
% , which is
% described in the previous problem. The modifcation involves the use of the
% A = sin(2*M*pi/N*(1:N))'*sin(2*M*pi/N*(1:N))
% built-in function sign. Here is an example:
% However, the function must instead use nested loops. The result can be visu-
% >> surf(make_square_waves(2,50));axis square
% alized by means of the function surf, which renders a surface whose dis-
% which produces
% Figure2.45.
% tance above the x-y plane is equal at each x = ii and y = jj to
% A(ii,jj). Here is an example:
% >> surf(make_waves(2,50));axis square
% which produces Figure 2.44.


A = sin(2*M*pi/N*(1:N))'*sin(2*M*pi/N*(1:N));

surf(A);