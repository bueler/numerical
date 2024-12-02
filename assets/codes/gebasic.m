function [newA, newb] = gebasic(A, b, n)
% GEBASIC  Gaussian elimination without pivoting.
% WARNING:  Do not use for production purposes.

for j = 1:n-1                             % loop over columns
    for i = j+1:n                         % loop over rows below j
        mult = A(i,j) / A(j,j);           % subtract this multiple ...
        A(i,:) = A(i,:) - mult * A(j,:);  % row operations
        b(i) = b(i) - mult * b(j);
    end
end
newA = A;
newb = b;
