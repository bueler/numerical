% RKORBITS  RK4 solutions to the several orbital problems in P14.

% the ODE IVP; note u = (x,y,z,w)
f = @(u) [u(3);...
          u(4);...
          -u(1) / (u(1)^2 + u(2)^2)^1.5;...
          -u(2) / (u(1)^2 + u(2)^2)^1.5];

% cases
ww = [0.5, 0.66, 0.8, 0.4, 0.2, 0.2];
hh = [0.25, 0.5, 0.5, 0.25, 0.25, 0.05];
TT = [50, 500, 200, 35, 30, 30];

for c = 1:6
    u0 = [4; 0; 0; ww(c)];
    h = hh(c);  n = round((TT(c) - 0) / h);
    t = 0:h:TT(c);
    uu = zeros(4, n+1);  uu(:, 1) = u0;
    for k = 1:n
        half = h / 2;
        q1 = f(uu(:, k));
        q2 = f(uu(:, k) + half * q1);
        q3 = f(uu(:, k) + half * q2);
        q4 = f(uu(:, k) + h * q3);
        uu(:, k+1) = uu(:, k) + h * (q1 + 2*q2 + 2*q3 + q4) / 6;
    end
    subplot(3,2,c),  plot(uu(1, :), uu(2, :))
    axis equal,  grid on,  xlabel x,  ylabel y
    title(sprintf('case %d', c))
end
