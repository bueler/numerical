% RANDPIPLOT  Generate a plot showing what RANDPI is doing.

N = 1.0e3;
aS = 4.0;  % area of square S
inC = false(1, N);
x = zeros(2, N);
for j = 1:N
    x(:, j) = 2 * rand(2,1) - 1;  % x(1), x(2) is a point in S
    if x(1, j)^2 + x(2, j)^2 < 1
        inC(j) = true;
    end
end
plot(x(1, inC), x(2, inC), 'r.', 'markersize', 14)
hold on
plot(x(1, not(inC)), x(2, not(inC)), 'k.', 'markersize', 14)
theta = 0:pi/40:2*pi;
plot(cos(theta), sin(theta), 'k')
hold off
axis([-1 1 -1 1]),  axis equal,  axis tight
xlabel('x_1'),  ylabel('x_2')
aC = aS * sum(inC) / N
