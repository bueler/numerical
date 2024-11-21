function [z, count] = myromberg(f,a,b,M)
% MYROMBERG  Implementation of Romberg integration on
%   int_a^b f(x) dx
% We do extrapolation to h=0 using (h^2,T_h) data, namely
% the results of applying the trapezoid rule T_h for
% decreasing stepsizes h.  Calls MYTRAP to do the trapezoid
% rule.  Reports number of times f(x) was evaluated.
% This is NOT an efficient implementation.
% Usage:  [z, count] = myromberg(f,a,b,M)
% Example:
%   >> f = @(x) cos(x.^2);
%   >> myromberg(f,0,5,8)     % 8 levels
%   >> mytrap(f,0,5,256)      % last T_h used n=2^8=256
%   >> integral(f,0,5)        % built-in: essentially exact, I think

n = 2 .^ (1:M);                    % use trapezoid rule for these n
h = (b-a) ./ n;                    % corresponding step sizes
count = 0;
for k = 1:M
    T(k) = mytrap(f, a, b, n(k));  % get each T_h
    count = count + n(k) + 1;
end
p = polyfit(h.^2, T, M-1);         % polynomial fit in (h^2,T_h) plane
z = p(M);                          % z = p(h=0)  is last coeff. of p
