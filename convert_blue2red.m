function redbird = convert_blue2red(N)



redbird = N; 
dims = size(N); 
for ii = 1:dims(1)
   for jj = 1:dims(2)
      if N(ii,jj,3) > ... 
1.2*mean(N(ii,jj,:))
redbird(ii,jj,1) = N(ii,jj,3); 
redbird(ii,jj,2:3) = 0;
      end
   end 
end

%% have to understand precisely what do you want to do PER PAGE OF MATRIX.