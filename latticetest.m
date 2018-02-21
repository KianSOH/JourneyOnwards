
function path = compare(x,y)
    if (x<N && y<N)
    x=x+1;
    elseif (x==N && y<N)
        y=y+1;
    elseif (y==N && x<N)
        x=x+1;
    elseif (x==N && y==N)
        count = count + 1;
        path = count;
    end 
    

