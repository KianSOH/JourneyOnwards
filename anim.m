function anim(fmax) 
%This function anim(fmax) outputs a continuous animation of the equation.
t = 0:0.001: 2 * pi;
step = (fmax-1)/1000;

for ii = [(1:step:fmax) (fmax:-step:1)]
    ampl = ii - 1; 
    v = (ampl * sin(t * ii));
    plot(t,v);
    axis([0 2*pi -fmax+1 fmax-1]);
    drawnow;
    pause(0.0005) 
end


