% EX3PI  Estimate pi using Monte Carlo simulation, based on
%        a unit circle inside a square.

N = 100000;                 % number of samples
c = 0;                      % count hits
for k = 1:N
    x = 2.0 * rand - 1.0;   % x,y are coordinates of random point in
    y = 2.0 * rand - 1.0;   %   square [-1,1] x [-1,1]
    if x * x + y * y < 1.0
        c = c + 1;
    end
end
4 * c / N                   % because square's area is 4
