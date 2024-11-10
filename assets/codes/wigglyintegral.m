% WIGGLYINTEGRAL  Compares composite Simpson's rule (MYSIMPSONS)
% and the Clenshaw-Curtis rule (CLENSHAWCURTIS) on the integral
%   /1
%   |  x^2 sin(-5 x^3 + 1) dx = (cos(4) - cos(6)) / 15
%   /-1

f = @(x) x.^2 .* sin(-5 * x.^3 + 1);
exact = (cos(4) - cos(6)) / 15;

nlist = [10 20 40 80 160 320];
fprintf("\n n     Simpson's error   Clenshaw-Curtis error\n")
for j = 1:length(nlist)
    n = nlist(j);
    esimp(j) = abs(mysimpsons(f, -1, 1, n) - exact);
    ecc(j)   = abs(clenshawcurtis(f, n) - exact);
    fprintf(" %3d   %.3e         %.3e\n", n, esimp(j), ecc(j))
end

semilogy(nlist, esimp, 'o', nlist, ecc, '*')
xlabel n,  ylabel('numerical error')
legend("Simpson's rule", "Clenshaw-Curtis rule")
set(gca, 'ytick', 10.^(-18:2:0))
axis([0 340 1.0e-18 1.0]),  grid on
