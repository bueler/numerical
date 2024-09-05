% TWOPLOTS  Exercise 6 (a), (c) in Chapter 2 of Greenbaum & Chartier.

subplot(1,2,1)
x = -3:.01:3;
plot(x,abs(x-1))
title('6 (a)')
xlabel x

subplot(1,2,2)
x = -4:.01:4;
plot(x,exp(-x.^2))
title('6 (c)')
xlabel x
