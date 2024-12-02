% RANDPI  Estimate pi = 3.14159 using uniformly-distributed
% random numbers.  Evaluates whether random points in the square
% S = [-1,1] x [-1,1] are in the unit circle C = {x_1^2 + x_2^2 < 1}.

N = 1.0e5;
aS = 4.0;  % area of square S
inC = 0;  % counter
for j = 1:N
    x = 2 * rand(2,1) - 1;  % x(1), x(2) is a point in S
    if x(1)^2 + x(2)^2 < 1
        inC = inC + 1;
    end
end
aC = aS * (inC / N)   % area of circle C is estimate of pi
