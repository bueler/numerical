% EXB Draw a composite cubic bezier curve, as an example.

% note n=2 so x,y have length 3 and xc,yc have length 4
x = [0, 1, 2];
y = [0, 0.5, 0];
xc = [0.2, 0.8, 1.2, 1.8];
yc = [1, 1, 0, 0];

t = linspace(0, 1, 101);
for k = 1:2
    subplot(1,2,k)
    if k == 2
        yc(3) = 1;  % on second figure, break smoothness
    end
    [xx, yy] = compbezier3(x, y, xc, yc, t);
    plot(xx, yy)
    hold on
    plot(x, y, 'k*')
    plot(xc, yc, 'ro')
    hold off
    xlabel x, ylabel y
    if k == 1
        title('smooth case')
    else
        title('not smooth')
    end
end
