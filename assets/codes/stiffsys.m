% STIFFSYS  Compare ODE45 and ODE23S on a
% stiff system of two equations:
%   y1' = -sin(t) y1 + y2
%   y2' = -100 y2
% with initial condition y(0) = (1,1)

f = @(t,y) [-sin(t) * y(1) + y(2); -100 * y(2)];
y0 = [1; 1];
T = 20;

% estimate y1(20) accurately
g = @(s) exp(-100*s) .* exp(-cos(s));
y1ex = exp(cos(20)) * (exp(-1) + integral(g,0,20));

% compare ODE45, ODE23S with default tolerances
[t45, y45] = ode45(f, [0, T], y0);
fprintf('ode45  took %d steps\n', length(t45)-1)
[t23, y23] = ode23s(f, [0, T], y0);
fprintf('ode23s took %d steps\n', length(t23)-1)
figure(1)
subplot(2,1,1)
plot(t45, y45, 'o-', T, [y1ex, 0], 'ks')
legend('y_1(t)', 'y_2(t)')
title(sprintf('ode45 took %d steps', length(t45)-1))
subplot(2,1,2)
plot(t23, y23, 'o-', T, [y1ex, 0], 'ks')
legend('y_1(t)', 'y_2(t)'),  title('ode23')
title(sprintf('ode23s took %d steps', length(t23)-1))
xlabel t
print -dpng stifftime.png

figure(2)
semilogy(t45(2:end), diff(t45), 'g.', t23(2:end), diff(t23), 'm.')
xlabel t,  ylabel h
legend('ode45 time steps', 'ode23s time steps')
grid on
print -dpng stiffsteps.png
