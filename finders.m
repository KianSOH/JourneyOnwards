function OUTPUT = finders()

Trinity = 'NOT FOUND';  %initialize data.
Temp    = 0;  
 i      = 1;            %initialize data.
Vn      = zeros(1,1e9);   %initialize data.

    while numel(divisors(Vn(i)))<500
                
        Temp = Temp + i;% Equation for Triangle Number.
        
        Vn(i) = Temp; %updating 1st to Nth Value of Triangle into Vector
        
        i = i + 1; %increment by every update.
    end
    OUTPUT = Vn(i);
end     
%% this is the final answer you should be looking for. 76576500