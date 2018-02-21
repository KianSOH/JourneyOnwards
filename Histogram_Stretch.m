%% Step 1 
% The truecolor composite has very little contrast and the colors are 
% unbalanced.
figure
imshow(truecolor);
title('Truecolor Composite (Un-enhanced)')
text(size(truecolor,2), size(truecolor,1) + 15,...
    'Image courtesy of Space Imaging, LLC',...
    'FontSize',7,'HorizontalAlignment','right')
%% Step 2: Use Histograms to Explore Un-Enhanced Truecolor Composite
%
% By viewing a histogram of the red bad, for example, you can see that the
% data is concentrated within a small part of the available dynamic range.
% This is one reason why the truecolor composite appears dull.
figure
imhist(truecolor(:,:,1))
title('Histogram of the Red Band (Band 3)')
%% Step 3 Use Correlation to Explore Un-Enhanced Truecolor Composite
% Another reason for the dull appearance of the composite is that the
% visible bands are highly corelated with each other. Two and three-band
% scatterplots are an excellent way to gauge the degree of correlation
% among spectral bands. You can make them easily just by using |plot|.
r = truecolor(:,:,1);
g = truecolor(:,:,2);
b = truecolor(:,:,3);
figure
plot3(r(:),g(:),b(:),'.')
grid('on')
xlabel('Red (Band 3)')
ylabel('Green (Band 2)')
zlabel('Blue (Band 1)')
title('Scatterplot of the Visible Bands')
%% Step 4: Enhance Truecolor Composite with a Contrast Stretch
% When you use |imadjust| to apply a linear contrast stretch to the
% truecolor composite image, the surface features are easier to recognize.
stretch_truecolor = imadjust(truecolor,stretchlim(truecolor));
figure
imshow(stretch_truecolor)
title('Truecolor Composite after Contrast Stretch')
%% Step 5: Check Histogram Following the Contrast Stretch
% A histogram of the red band after applying a contrast stretch shows that
% the data has been spread over much more of the available dynamic range.
figure
imhist(stretch_truecolor(:,:,1))
title('Histogram of Red Ban (Band3) after Contrast Stretch')
%% Step 6: Enhance Truecolor Composite with a Decorrelation Stretch
% Another way to enhance the truecolor composite is to use a decorrelation
% stretch, which enhances color seperation across highly correlated
% channels. Use |decorrstretch| to perform the decorrelation stretch
% (followed by a linear constrast stretch, as specified by the optional
% parameter-value pair |'Tol'| and |0.1|).
decorrstretched_truecolor = decorrstretch(truecolor, 'Tol', 0.01);
figure
imshow(decorrstretched_truecolor)
title('Truecolor Composite after Decorrelation Stretch')