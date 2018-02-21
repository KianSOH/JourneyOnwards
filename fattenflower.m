function wide_flower = fattenflower(flower)

dims = size(flower); 
for ii = 1:dims(1)
   for jj = 1:dims(2)
      wide_flower(ii,jj,:) = ... 
flower(ii,round(jj/1.2),:);
   end 
end
