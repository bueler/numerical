function c = bisector(f, a, b, tol)
% BISECTOR  A bisection routine for Exercise 2(a) in Chapter 4.
% checks: are a,b roots? it is a bracket? does bracket have length 0?
if f(a) == 0
    c = a;  return
elseif f(b) == 0
    c = b;  return
end
if f(a) * f(b) > 0, error('input is not a bracket for f(x)'), end
if a == b, error('a==b will not work ... bracket needed'), end
% run bisection until tolerance; [a,b] is a bracket at each iteration
for j=1:55        % in 64 bit precision, never need more than this
    fprintf('  %2d:  [a,b] = [%.8f,%.8f]\n', j-1, a, b)
    c = (a + b) / 2;
    if abs(b-a) < tol || f(c) == 0
        break
    elseif f(c) * f(a) > 0  % if so, [a,c] is NOT the bracket
        a = c;
    else
        b = c;
    end
end
