% LORENZ  Use ODE45 to plot a solution of the Lorenz
% equations.  This also illustrates how to set tighter
% tolerances to get a smoother and more precise result.

% parameters and ODE system
sig = 10;
rho = 28;
bet = 8/3;
f = @(t, u) [sig * (u(2) - u(1));
             u(1) * (rho - u(3)) - u(2);
             u(1) * u(2) - bet * u(3)];
u0 = [1, 1, 1];
T = 100;

% black box numerical solution and 3D plot
s = odeset('RelTol', 1.0e-6, 'AbsTol', 1.0e-10);
[tt, uu] = ode45(f, [0, T], u0, s);
plot3(uu(:,1), uu(:,2), uu(:,3))
xlabel x,  ylabel y,  zlabel z
axis equal
