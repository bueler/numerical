% SENSITIVELORENZ  Use color to show two solutions which
% depend sensitively on the initial conditions.

sig = 10;  rho = 28;  bet = 8/3;
f = @(t, u) [sig * (u(2) - u(1));
             u(1) * (rho - u(3)) - u(2);
             u(1) * u(2) - bet * u(3)];
T = 100;
x0 = [1.0, 1.00000001];

s = odeset('RelTol', 1.0e-8, 'AbsTol', 1.0e-12);
color = ['b', 'r'];
for j = 1:2
    u0 = [x0(j), 0, 0];
    [tt, uu] = ode45(f, [0, T], u0, s);
    hold on,  plot3(uu(:,1), uu(:,2), uu(:,3), color(j))
    plot3(uu(end,1), uu(end,2), uu(end,3),...
          [color(j), '.'], 'markersize', 30)
end
xlabel x,  ylabel y,  zlabel z
axis equal,  hold off
