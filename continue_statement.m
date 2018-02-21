%% to demonstrate continue statements
for ii = 1:length(numbers)
   x = numbers(ii);
   fprintf('x = %d\n', x);
   fprintf('    x^2 = %d\n', x^2);
   fprintf('    x^4 = %d\n', x^4);
   if x >= 0
      fprintf('x^(1/2) = %f\n', x^(1/2));
      fprintf('    x^(1/4) = %f\n', x^(1/4));
   end 
end
%% this statements have continue.
for ii = 1:length(numbers)
   x = numbers(ii);
   fprintf('x = %d\n', x);
   fprintf('    x^2 = %d\n', x^2);
   fprintf('    x^4 = %d\n', x^4);
   if x < 0
     continue;
   end
   fprintf('    x^(1/2) = %f\n', x^(1/2));
   fprintf('    x^(1/4) = %f\n', x^(1/4)); 
end

