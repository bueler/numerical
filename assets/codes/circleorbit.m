% CIRCLEORBIT  Euler and RK4 solutions to a circular orbital problem.

% the ODE IVP; note u = (x,y,z,w)^T
u0 = [4; 0; 0; 0.5];
T = 50.0;
f = @(u) [u(3);...
          u(4);...
          -u(1) / (u(1)^2 + u(2)^2)^1.5;...
          -u(2) / (u(1)^2 + u(2)^2)^1.5];
heu = 0.0025;  hrk = 0.25;

% Euler solution
neu = round((T - 0) / heu);  tteu = 0:heu:T;
uueu = zeros(4, neu+1);  uueu(:, 1) = u0;
for k = 1:neu
    uueu(:, k+1) = uueu(:, k) + heu * f(uueu(:, k));
end
subplot(1,2,1),  plot(uueu(1, :), uueu(2, :))
axis equal,  grid on,  xlabel x,  ylabel y
title(sprintf('Euler solution (n=%d steps)', neu))

% RK4 solution
nrk = round((T - 0) / hrk);  ttrk = 0:hrk:T;
uurk = zeros(4, nrk+1);  uurk(:, 1) = u0;
for k = 1:nrk
    t = ttrk(k);  half = hrk / 2;
    q1 = f(uurk(:, k));
    q2 = f(uurk(:, k) + half * q1);
    q3 = f(uurk(:, k) + half * q2);
    q4 = f(uurk(:, k) + hrk * q3);
    uurk(:, k+1) = uurk(:, k) + hrk * (q1 + 2*q2 + 2*q3 + q4) / 6;
end
subplot(1,2,2),  plot(uurk(1, :), uurk(2, :))
axis equal,  grid on,  xlabel x,  ylabel y
title(sprintf('RK4 solution (n=%d steps)', nrk))
