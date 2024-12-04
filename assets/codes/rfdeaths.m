% RFDEATHS.  Compare RABBITSFOXES and RFNOISY.
% Solves a stochastic version of the
% predator-prey model.  This is a system in 2 dimensions:
%   dr = (r - 0.01 r f) dt - rho |dB_t|
%   df = (0.002 r f - f) dt - sigma |dB_t|
% where  r(t) = (rabbit population at time t), and f(t) = (fox
% population at time t).  When rho>0 or sigma>0, the stochastic terms
% with subtracted "|dB_t|" model random additional deaths. 
% Uses a stochastic modification of Euler's method, the Euler-Maruyama
% method, in which dt is approximated by a time step h > 0, and dB_t
% is approximated
%   dB_t ~ N(0, h)
% That is, the variance of the independent random noise over a time
% step h is h.  Thus the standard deviation is sqrt(h).

Frhs = @(t, y) [y(1) - 0.01 * y(1) * y(2);...
                0.002 * y(1) * y(2) - y(2)];

% Euler method needs lots of small steps to get to T = 40
h = 0.001;
N = 40000;

for k = 1:2  % two subplots
    if k == 1
        rho = 0.0;  sigma = 0.0;   % no random death
    else
        rho = 0.1;      % amount of random death for rabbits
        sigma = 0.01;   % ... for foxes
    end

    % run Euler (or Euler-Maruyama)
    r = zeros(1,N+1);
    f = r;
    r(1) = 200;
    f(1) = 5;
    for j = 1:N
        t = j * h;
        ft = Frhs(t, [r(j); f(j)]);
        r(j+1) = r(j) + ft(1) * h - rho * sqrt(h) * abs(randn(1));
        f(j+1) = f(j) + ft(2) * h - sigma * sqrt(h) * abs(randn(1));
    end

    % phase plot
    subplot(1,2,k)
    if k == 1
        loglog(r, f, '.-')
        title('no noise')
    else
        valid = (r >= 1) & (f >= 1);
        last = max(find(valid));
        loglog(r(valid), f(valid), '.-', r(last), f(last), 'ro')
        text(r(last), f(last), sprintf('(%.2f,%.2f)', r(last), f(last)))
        title('with random deaths')
    end
    axis([1e0, 1e4, 1e0, 1e3])
    xlabel('rabbit population'),  ylabel('fox population')
    grid on
end


