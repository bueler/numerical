% CIRCLEEXP find where a circle and y=e^x cross by bisection
% f(x) = x^2 + exp(2*x) - 2
a = 0;
b = 1;
[a b]
for j=1:60
    c = (a+b)/2;
    if (c^2 + exp(2*c) - 2) == 0
        break
    elseif (c^2 + exp(2*c) - 2) * (a^2 + exp(2*a) - 2) > 0
        a = c;
    else
        b = c;
    end
    [a b]
end