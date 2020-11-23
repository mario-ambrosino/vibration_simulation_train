% Spring parameters

tRange = [0 100]; % 0 to 10 seconds time range
speed = 
Y0 = [2 0 3 0];  % initial condition

[t_sol, Y_sol] = ode45(@model_double_ho, tRange, Y0);

plot(t_sol, Y_sol(:,1))
hold on 
plot(t_sol, Y_sol(:,1)+Y_sol(:,3))
% 