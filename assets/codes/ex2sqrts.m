% EX2SQRTS  Compute sqrt(a) using Newton's method.

a = 5;             % compute square root of this number
                   % change to desired number

x = 2.0;           % whence initial guess? see sqrted.m
for j = 1:5
    x = (x^2 + a) / (2 * x);
end
x