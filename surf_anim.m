function surf_anim
%Movie 2.3 Surface plot animation
t = 0:0.1:pi;
[X, Y] = meshgrid(t); 
s = 0.2;
for kk = [0:-s:-10  -10+s:s:0-s  0-s:-s:-10]
    surf(X,Y,kk *(sin(X) + sin(Y)));
    axis([0,pi,0,pi,-20,1]);
    drawnow; 
end
for kk = -37.5:30
    view(kk,30);
    drawnow; 
end
for kk = 30:-1:5
    view(30,kk);
    drawnow; 
end
