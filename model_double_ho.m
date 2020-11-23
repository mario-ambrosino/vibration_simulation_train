function dYdt = model_double_ho(t,Y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    % Input Array unfolding
    % particle 1
    x1 = Y(1);
    y1 = Y(2);
    % particle 2
    x2 = Y(3);
    y2 = Y(4);
    
    % spring parameters
    k1 = 1;    % N / m
    k2 = 2;    % N / m
    
    b1 = 0.2;  % ( dimensional analysis )
    b2 = 0.3;  % ( dimensional analysis )

    l1 = 0.5;  %m
    l2 = 0.5;  %m

    m1 = 1;     %kg
    m2 = 1;     %kg

    
    dx1dt = y1;
    dy1dt = -(b1/m1)*y1 +(k2/m1)*(x2 - x1 - l2) - (k1/m1)*(x2 - l1);
    dx2dt = y2;
    dy2dt = -(b2/m2)*y2 -(k2/m2)*(x2 - x1 - l2);

    
dYdt = [dx1dt ; dy1dt; dx2dt ; dy2dt];

end

