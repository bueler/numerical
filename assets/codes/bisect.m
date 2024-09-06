function c = bisect(f,a,b,N)
% BISECT Apply bisection to solve f(x)=0 on the interval
% [a,b].  Returns the midpoint of the interval after N iterations.
%
% Usage:  c = bisect(f,a,b,N)
%
% Example: Find where the circle x^2+y^2=2 and the exponential
% graph y=e^x cross.  First do algebra to convert to form f(x)=0.
% Note that [0,1] is a bracket, where f(x) changes sign.  So:
%   >> f = @(x) x^2 + exp(2*x) - 2;
%   >> a=0; b=1;
%   >> bisect(f,a,b,10)   % returns the root
%   >> bisect(f,a,b,50)   % better accuracy

% check that it is a bracket
if f(a) * f(b) > 0
    error('input is not a bracket for f(x)')
end
% check if a,b are the root
if f(a) == 0
    c = a;
    return
elseif f(b) == 0
    c = b;
    return
end
% check if bracket has length zero
if a == b
    error('a=b and neither is solution ... bracket needed')
end
% run N steps of bisection; [a,b] is a bracket at each iteration
for j=1:N
    c = (a+b)/2;
    if f(c) == 0
        break
    elseif f(c) * f(a) > 0  % if so, [a,c] is NOT the bracket
        a = c;
    else
        b = c;
    end
end
end % function