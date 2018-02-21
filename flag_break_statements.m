%% This is an example of a flag found = false & Break statement, as MATLAB doesn't break out of the entire program, but ONLY inner loop.
%% Thus, a flag have to be implemented to check if found or not, if found, then break out of loop.

found = false;
for ii = 1:size(A,1)
   for jj = 1:size(A,2)
      if A(ii,jj) <= 90
         A(ii,jj) = 0;
      else
         found = true;
         break;
      end
   end
   if found
      break;
   end 
end