L = 20;
x = 0:0.002:6;
xc = linspace(0,sqrt(L),1000);
plot(xc, sqrt(L-xc.^2),'k','linewidth',2.0)
hold on
plot(x, x .* tan(x),'b.','markersize',8.0)
plot(x, - x .* cot(x),'r.','markersize',8.0)
hold off
axis([0 6 -0.5 5])
axis equal
xlabel('\beta','fontsize',16)
grid on
