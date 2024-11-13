% EULEREX  simple Euler's method example
%   y'(t) = -2 * y(t),  y(0)=5

f = @(t,y) -2 * y;
y0 = 5;

tf = 0:0.001:3;
plot(tf, 5*exp(-2*tf))
hold on,  xlabel t,  ylabel y,  grid on

% try different step sizes (these are all stable)
for h = [0.1, 0.05, 0.01]
    t = 0:h:3;
    y = zeros(size(t));
    n = round(3/h);   % only certain h values make sense ...
    y(1) = y0;
    for k = 1:n
        y(k+1) = y(k) + h * f(t(k), y(k));
    end
    plot(t,y,'o-')
end
legend('exact','h=0.1','h=0.05','h=0.01')
hold off
