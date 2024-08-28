% EX1INTEGRAL  Evaluate an otherwise-impossible integral, namely
%   int_0^1 sin(x)^(3/2) dx
% using the trapezoid rule.

N = 30;
dx = 1/N;
x = 0.0:dx:3.0;          % N+1 points
y = sin(x).^(3/2);
% optional: plot(x,y)
s = y(1);                % start sum
for j = 2:N
    s = s + 2.0 * y(j);
end
s = s + y(N+1);
TN = (dx / 2.0) * s
