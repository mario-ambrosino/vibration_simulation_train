% Spring parameters

tRange = [0 10]; % 0 to 10 seconds time range
Y0 = [2 0];  % initial condition

[t_sol, Y_sol] = ode45(@model_damped_ho, tRange, Y0);

plot(t_sol, Y_sol(:,1))
% 