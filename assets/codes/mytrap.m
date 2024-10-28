function z = mytrap(f,a,b,n);
% MYTRAP  Basic implementation of trapezoid rule.
% Called by MYROMBERG.  Example:
%   >> f = @(x) sin(x.^3 + abs(x))
%   >> mytrap(f,-1,3,20)
%   >> integral(f,-1,3)  % compare Matlab's built-in numerical integrator

h = (b-a)/n;  x = a:h:b;
c = [1 2*ones(1,n-1) 1];
z = (h/2) * sum(c .* f(x));
