% TIGHTORBIT  ODE45 solution to a near-sun orbit

% note u = (x,y,z,w)
f = @(t,u) [u(3);...
            u(4);...
            -u(1) / (u(1)^2 + u(2)^2)^1.5;...
            -u(2) / (u(1)^2 + u(2)^2)^1.5];
u0 = [4; 0; 0; 0.2];
T = 30;

s = odeset('RelTol', 1.0e-8, 'AbsTol', 1.0e-12);
[tt, uu] = ode45(f, [0, T], u0, s);
subplot(3,1,1)
plot(uu(:, 1), uu(:, 2), 'b.', 'markersize', 14)
hold on,  plot(0, 0, 'r.', 'markersize', 24),  hold off
axis equal,  grid on,  xlabel x,  ylabel y
subplot(3,1,2:3)
plot(uu(:, 1), uu(:, 2), 'b.', 'markersize', 14)
hold on,  plot(0, 0, 'r.', 'markersize', 24),  hold off
axis([-0.6, 0.6, -0.5, 0.5])
grid on,  xlabel x,  ylabel y
