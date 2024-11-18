% RABBITSFOXES  Solve the predator-prey model in Chapter 11 of our textbook
% using ODE45.  This system of ODEs is in 2 dimensions:
%   y'(t) = f(t, y(t))
% where  y(1) = rabbits, y(2) = foxes.  Note f takes in a vector y and produces
% a vector.  Also, f does not actually depend on t.  We find y(t) on [0,40]
% from initial condition  y_0 = [200; 5].  Coefficients are guessed, and not
% based on any observations!

f = @(t, y) [y(1) - 0.01 * y(1) * y(2);...
             0.002 * y(1) * y(2) - y(2)];
y0 = [200; 5];
[tt, yy] = ode45(f, [0, 40], y0);

figure(1)  % plots in time
plot(tt, yy(:,1), 'o-', tt, yy(:,2), 'o-')
legend('R(t) rabbits', 'F(t) foxes')
xlabel t,  ylabel('population'),  grid on

figure(2)  % "phase" plot of R(t) vs F(t)
loglog(yy(:,1), yy(:,2), 'o-')
xlabel('rabbit population'),  ylabel('fox population')
grid on
