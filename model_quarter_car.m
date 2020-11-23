function dYdt = model_quarter_car(t,Y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    global profile
    % Input Array unfolding
    % particle 1
    xa = Y(1);
    ya = Y(2);
    % particle 2
    xb = Y(3);
    yb = Y(4);
    % beam position
    index = int32(Y(5));
    s = profile.b(index);
    
    % spring parameters
    ka = 10000000;    % N / m
    kb = 10000000;    % N / m
    
    ba = 0;  % ( dimensional analysis )
    bb = 50;  % ( dimensional analysis )

    la = 0.5;  %m
    lb = 1;  %m

    ma = 500;     %kg
    mb = 8000;     %kg

    dxadt = ya;
    dxbdt = yb;
    dyadt = - (bb/ma)*(ya - yb) - (kb/ma)*(xa - xb - lb) - (ka/ma)*(xa - s - la);
    dybdt = - (bb/mb)*(yb - ya) - (kb/mb)*(xb - xa - lb);

    ds = 1;
    
dYdt = [dxadt ; dyadt; dxbdt ; dybdt; ds];

end

