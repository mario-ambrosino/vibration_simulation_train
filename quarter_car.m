global profile 
profile = load("beam_profile.mat");

tRange = [0 1000]; % 0 to 10 seconds time range
Y0 = [0.5 0 1 0 1];  % initial condition

[t_sol, Y_sol] = ode45(@model_quarter_car, tRange, Y0);

dt = diff(t_sol);
dy1 = diff(Y_sol(:,1));
dv1dt = dy1./ dt;
da1 = diff(dv1dt);
N = size(da1);
a1 = da1(1:N)./dt(1:N);