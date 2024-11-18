% BASICBLACK  Illustrate the basic use of the ODE45 black box
% for solving ODEs.

f = @(t, y) (t + 1) * exp(-y);
[tt, yy] = ode45(f, [0, 40], 0);   % solves at default accuracy

figure(1)
subplot(2,1,1)
plot(tt, yy, 'o-'),  ylabel('y(t)'),  grid on
subplot(2,1,2)
yex = log(tt.^2/2 + tt + 1);
plot(tt, abs(yy - yex), 'ro-')
xlabel t,  ylabel('numerical error'),  grid on

% recompute at higher accuracy
s = odeset('RelTol', 1.0e-9, 'AbsTol', 1.0e-12);
[tt, yy] = ode45(f, [0, 40], 0, s);
figure(2)
subplot(2,1,1)
plot(tt, yy, 'o-'),  ylabel('y(t)'),  grid on
subplot(2,1,2)
yex = log(tt.^2/2 + tt + 1);
plot(tt, abs(yy - yex), 'ro-')
xlabel t,  ylabel('numerical error'),  grid on
title('requesting higher accuracy')
