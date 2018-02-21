function [ outcome ] = roll3dices(N) %due to rng('shuffle') software is very inefficient. Good Sacrifice to ensure randomness.
% statistical output. The outcome consist of a N rows X 4 columns.
% Each row signify a case result.
% If sum of 3 dices is 9 or smaller, it's small, else big.
% If 3 dices are the same, it's a BIG WIN, and not declared as big or small
dice1=0; dice2=0; dice3=0; %initialize dice1,2,3 to 0
outcome = zeros(N,4);%preallocating space for calculations

 
for i = 1:N
 
rng('shuffle');%ensure randi is truly random.
dice1 = randi(6,1);
rng('shuffle');%ensure randi is truly random
dice2 = randi(6,1);
rng('shuffle');%ensure randi is truly random
dice3 = randi(6,1);
%after rolling to update outcome
outcome(i,1) = dice1; outcome(i,2) = dice2; outcome(i,3) = dice3;
% to test for the above conditions

if dice1==dice2 && dice2==dice3 %dices all the same
    
    outcome(i,4) = 888;%to indicate jackpot for 888
    fprintf('JACKPOT!!! 1:100 payout!!! You have 3 %ds\n',dice1);
    
    
elseif dice1+dice2+dice3 <= 9
    
    outcome(i,4) = 100;%to indicate small for 100
    fprintf('SMALL!!! 1:1 payout!!! total is :%d\n',dice1+dice2+dice3);
    
else 
    outcome(i,4) = 111;%to indicate big for 111
    fprintf('BIG!!! 1:1 payout!!!\n total is :%d\n',dice1+dice2+dice3);
    
end%end if elseif else statement
end%end for loop
end%end total function