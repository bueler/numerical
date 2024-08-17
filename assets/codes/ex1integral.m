% EX1INTEGRAL  Evaluate an otherwise-impossible integral using
%              the trapezoid rule.

dx = 0.1;
x = 0.0:dx:3.0;          % 31 points
y = sin(x).^(3/2);
%plot(x,y)
s = y(1);                % start sum
for j = 2:30
    s = s + 2.0 * y(j);
end
s = s + y(31);
(dx / 2.0) * s
