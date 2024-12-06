function [xx, yy] = compbezier3(x, y, xc, yc, t)
% COMPBEZIER3  Generate a composite cubic Bezier curve which goes through
% n+1 points with coordinates x,y and which uses control points xc,yc.
% The array t is used on each subinterval.

n = length(x) - 1;
if n + 1 != length(y), error('x,y same length'), end
if 2*n != length(xc), error('xc length 2n'), end
m = length(t);

xx = zeros(1, n * m);
yy = zeros(1, n * m);
c = 1;  % counter
for j = 1:n
    for k = 1:m
        P = bezier3([x(j), y(j)], [xc(2*j - 1), yc(2*j - 1)], [xc(2*j), yc(2*j)], [x(j+1), y(j+1)], t(k));
        xx(c) = P(1);
        yy(c) = P(2);
        c = c + 1;
    end
end
