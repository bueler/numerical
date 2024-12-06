% EXA Draw a single cubic bezier curve, as an example.

P0 = [0, 0];
P1c = [0.2, 1];  % control point
P2c = [0.8, 1];  % control point
P3 = [1, 0.5];

m = 101;
t = linspace(0, 1, m);
x = zeros(size(t));
y = x;
for j = 1:m
    P = bezier3(P0, P1c, P2c, P3, t(j));
    x(j) = P(1);
    y(j) = P(2);
end

plot(x, y)
hold on
plot(P0(1), P0(2), 'k*')
plot(P1c(1), P1c(2), 'ro')
plot(P2c(1), P2c(2), 'ro')
plot(P3(1), P3(2), 'k*')
plot([P0(1), P1c(1)], [P0(2), P1c(2)], 'r:')
plot([P3(1), P2c(1)], [P3(2), P2c(2)], 'r:')
hold off
xlabel x, ylabel y
