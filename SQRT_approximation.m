%%This script is trying to illustrate an approximation equation to SQRT.

y = x
while abs(y^2 - x) > 1e-12*x
   y = (x/y + y)/2 
end
