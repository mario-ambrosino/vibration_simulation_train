function dYdt = model_damped_ho(t,Y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    % Input Array unfolding
    % particle 1
    x = Y(1);
    y = Y(2);
    % particle 2
    
    % spring parameters
    k = 1;    % N / m
    b = 0.2;  % ( dimensional analysis )
    l = 0.5;  %m
    m = 1;     %kg
    
    dxdt = y;
    dydt = -(b/m)*y-(k/m)*(x-l);

dYdt = [dxdt ; dydt];

end

