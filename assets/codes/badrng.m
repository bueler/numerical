function x = badrng(N)
% BADRNG  Use a linear congruential generator to generate
% an array of length N of pseudorandom numbers from a fixed seed.
% Outputs in x are intended to be uniform on [0,1].
%
% This is merely a demonstration of how pseudorandom numbers might
% be generated.  WARNING: DO NOT USE FOR PRODUCTION SIMULATIONS.
%
% Comparison to built-in RAND:
%   >> xb = badrng(1e4);  xr = rand(1,1e4);
%   >> subplot(1,2,1),  hist(xb),  title('badrng')
%   >> subplot(1,2,2),  hist(xr),  title('rand')

% magic numbers from Press et al 1986 Numerical Recipes etc.
% see https://en.wikipedia.org/wiki/Linear_congruential_generator
a = 1664525;
c = 1013904223;
m = 2^32;
y = 123456789;  % fixed seed
x = zeros(1,N);
for j = 1:N
    y = mod(a*y + c, m);
    x(j) = y / m;
end
