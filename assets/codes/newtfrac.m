% NEWTFRAC  Generate a Newton's method fractal for
%   z^5 + 1 = 0
% using complex numbers.

rts = exp(i*(pi + 2*pi*(1:5))/5);
cls = ['b', 'r', 'g', 'm', 'c'];

Nx = 51;
x = linspace(-2, 2, Nx);
hold on
for s = 1:5
    plot(real(rts(s)), imag(rts(s)), [cls(s) '.'], 'markersize', 20)
end
for j = 1:Nx
    for k = 1:Nx
        z = x(j) + i * x(k);
        done = false;
        for l = 1:100
            for s = 1:5
                if abs(z - rts(s)) < 1.0e-2
                    plot(x(j), x(k), [cls(s) '.'], 'markersize', 12)
                    done = true;
                    break
                end
            end
            if done
                break
            end
            z = 0.8 * z - 0.2 * z^(-4);  % Newton's iteration
        end
    end
end
hold off
axis([-2 2 -2 2])
axis equal
grid on
