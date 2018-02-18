function GPDT = GProduct2020(MAT)

% The above function accepts ONLY a 20 X 20 Matrix MAT
% It performs a 4 X 4 Matrix Calculation of the following;
% 1. Up down, column by column, outputs a temp_buffer_ud for comparison of
% largest product of the up down 4 adjacent numbers, output the largest up
% down product for later comparison as temp_buffer_ud.
% 2. Left Right, row by row, outputs a temp_buffer_lr for comparison of the
% largest product for later comparison.
% 3. Next it performs a diagonal product from left to right and right to
% left and compares the 2 values, and output a temp_buffer_d
% 4. And finally temp_buffer_ud, temp_buffer_lr & temp_buffer_d is compared and outputs the
% largest product of the group of 4 X 4 Matrix as G_temp_buffer.
% 5. After group is checked, software moves from row ii = 1:20-4+1,
% likewise column jj = 1:20-4+1
% Since position of the Matrix MAT elements is not required, GPDT, or
% Greatest product of the 4 adjacent numbers, up down, left right,
% diagonals are the only output.
[row, col] = size(MAT);% checking input Matrix MAT's size
temp_buffer_ud = 1; %initialize values
temp_buffer_lr = 1; %initialize values
temp_buffer_d  = 1; %initialize values
temp_buffer_dl = 1; %initialize values
G_temp_buffer  = 1; %initialize values
DiaTempLR = 1;%initialize temp values
DiaTempRL = 1;%initialize temp values

if row ~= 20 || col ~= 20
    error('This function only accepts a 20 X 20 Matrix input')
else
%perform 1.Up down, column by column, outputs a temp_buffer_ud for comparison of
% largest product of the up down 4 adjacent numbers, output the largest up
% down product for later comparison as temp_buffer_ud.


%OUTER MOST FOR LOOP for shifting the 4 X 4 Matrix using rows ii, 
%columns jj to shift the algorithm to different groups.
% 5. After group is checked, software moves from row ii = 1:20-4+1,
% likewise column jj = 1:20-4+1

for ii = 0:20-4 %shifting row by row outer most for loop
    for jj = 0:20-4 %shifting column by column 2nd outer most for loop
    
    for kk = 1:4 %column by column
        for zz = 1:4 %row by row
         
            temp_buffer_ud = temp_buffer_ud*MAT(zz+ii,kk+jj);
            
        end% end inner zz for loop
        
        if temp_buffer_ud > G_temp_buffer %compares with G_temp_buffer
            G_temp_buffer = temp_buffer_ud;%updates G_temp_buffer
            temp_buffer_ud = 1; %reinitializes back to 1 for next calculation.
        else
            temp_buffer_ud = 1; %reinitializes back to 1 for next calculation.
            
        end%end if statement
        
    end% end outer kk for loop - here concludes the up down product check
    
% 2. Left Right, row by row, outputs a temp_buffer_lr for comparison of the
% largest product for later comparison.
    
    for kk = 1:4 %row by row
        for zz = 1:4 %column by column
         
            temp_buffer_lr = temp_buffer_lr*MAT(kk+ii,zz+jj);
            
        end% end inner zz for loop
        
        if temp_buffer_lr > G_temp_buffer %compares with G_temp_buffer
            G_temp_buffer = temp_buffer_lr;%updates G_temp_buffer
            temp_buffer_lr = 1; %reinitializes back to 1 for next calculation.
        else
            temp_buffer_lr = 1; %reinitializes back to 1 for next calculation.
            
        end%end if statement
        
    end% end outer kk for loop - here concludes the left right product check
    
% 3. Next it performs a diagonal product from left to right and right to
% left and compares the 2 values, and output a temp_buffer_d
    
    TempMat = MAT(1+ii:4+ii,1+jj:4+jj);
    
    DiaTempLR = (diag(TempMat))'; % diagonal top left to bottom right
    
    DiaTempRL = (diag(fliplr(TempMat)))'; % diagonal top right to bottom left
    
    for dd = 1:4
        temp_buffer_d = temp_buffer_d*DiaTempLR(dd);%multiplication for lr diagonal
    end %end for loop
        
    for dd = 1:4
        temp_buffer_dl = temp_buffer_dl*DiaTempRL(dd);%multiplication for rl diagonal
    end %end for loop

    if temp_buffer_d > G_temp_buffer
        G_temp_buffer   =   temp_buffer_d;
        temp_buffer_d   =   1;% reinitialize for next calculation.
        temp_buffer_dl  =   1;% reinitialize for next calculation.
    elseif temp_buffer_dl > G_temp_buffer
        G_temp_buffer   =   temp_buffer_dl;
        temp_buffer_dl  =   1;% reinitialize for next calculation.
        temp_buffer_d   =   1;% reinitialize for next calculation.
    else
        temp_buffer_d   =   1;% reinitialize for next calculation.
        temp_buffer_dl  =   1;% reinitialize for next calculation.
    end %end above if elseif else statement
    
    end %end 2nd outer most for loop jj
    
end% end outer most for loop ii

    GPDT = G_temp_buffer;

end% end if else statement of the outermost shell.











