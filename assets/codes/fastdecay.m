% FASTDECAY  Compare explicit and implicit methods on
%   y' = - 25 y,  y(0)=1
% with h=0.1 and then h=0.05, to compute y(0.6)

r = 25;
f = @(y) - r * y;
y0 = 1;
T = 0.6;

tf = 0:0.01:T;
yexact = exp(-r * tf);

for h = [0.1 0.05]
    t = 0:h:T;
    ye = zeros(size(t));
    ye(1) = y0;
    ym = ye;
    yb = ye;
    yt = ye;
    for k = 1:length(t)-1
        ye(k+1) = ye(k) + h * f(ye(k));
        ym(k+1) = ym(k) + h * f(ym(k) + (h/2) * f(ym(k)));
        yb(k+1) = (1 / (1 + r * h)) * yb(k);
        yt(k+1) = ((1 - (r/2) * h) / (1 + (r/2) * h)) * yt(k);
    end
    figure()
    plot(t,ye,'o-',t,ym,'*-',t,yb,'s-',t,yt,'+-',tf,yexact)
    xlabel t,  grid on
    legend('Euler', 'midpoint', 'backward Euler', 'trapezoid', 'exact')
    axis([0 T -3 3])
    title(sprintf('h=%.2f', h))
end
figure(1), print -dpng bad.png
figure(2), print -dpng good.png
