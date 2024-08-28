function z = sqrted(a)
% SQRTED  A reasonable sketch of how the built-in command SQRT
% works, at least for positive numbers, under the hood.  The
% key ideas are:
%   1. do Newton's method on x^2 - a = 0
%   2. scale by factors of 4 (which has known square root!)
%      until a single initial guess works quickly

if a < 0.0
    error('square root only defined for non-negative numbers')
elseif a == 0.0 || a == 1.0
    z = a;
    return
elseif a < 1.0
    z = 1.0 / sqrted(1.0 / a);
    return
end
% from now on we may assume a > 1.0

% divide by 4 to put a into range (1,4]
f = 1.0;                % factor to multiply at end
for j = 1:512           % why 512? because log_4(1e308) = 511.6
    if a <= 4.0
        break
    else
        f = f * 2.0;
        a = a / 4.0;
    end
end

% now a is in (1,4], so initial guess 2 will work
x = 2.0;
for j = 1:5             % why 5? because 4 is not enough for full accuracy
    x = (x^2 + a) / (2 * x);
end
z = f * x;
