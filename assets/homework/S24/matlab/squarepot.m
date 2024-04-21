L = 1;
plot([-3.5 -1],[0 0],'k')
hold on, plot([-1 1],[-L -L],'k')
plot([1 3.5],[0 0],'k')
axis([-3.5 3.5 -1.5 0.7])
xlabel('x','fontsize',16)
%text(-2.9,-1.2,'I_1','fontsize',16)
%text(0.1,-1.2,'I_2','fontsize',16)
%text(2.1,-1.2,'I_3','fontsize',16)
set(gca,'ytick',[0,-1])
set(gca,'yticklabel',{'0', '-L'},'fontsize',16)
%title('V(x)','fontsize',20)
hold off
