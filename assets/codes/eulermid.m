% EULERMID  Generate a table of results for the ODEIVP
%   y' = (t+1) exp(-y), y(0)=0.
% Compares Euler's method and the midpoint rule.  Also
% compares RK4.

f = @(t,y) (t + 1) * exp(-y);
y0 = 0.0;

h = 1.0;
t = 0:h:10;
yex = log(t.^2 / 2 + t + 1);

% numerical solution with 3 methods
yeul = zeros(1,length(yex));  ymid = yeul;  yrk4 = yeul;
yeul(1) = y0;  ymid(1) = y0;  yrk4(1) = y0;
fprintf('            y_exact   y_euler    y_mid     y_rk4\n');
for j = 1:length(yex)-1
    fprintf('t = %4.1f:  %8.5f  %8.5f  %8.5f  %8.5f\n', ...
            t(j), yex(j), yeul(j), ymid(j), yrk4(j));
    % Euler
    yeul(j+1) = yeul(j) + h * f(t(j), yeul(j));
    % midpoint
    tstar = (t(j) + t(j+1)) / 2;
    ystar = ymid(j) + (h / 2) * f(t(j), ymid(j));
    ymid(j+1) = ymid(j) + h * f(tstar, ystar);
    % classical Runge-Kutta order 4
    q1 = f(t(j), yrk4(j));
    q2 = f(tstar, yrk4(j) + (h/2) * q1);
    q3 = f(tstar, yrk4(j) + (h/2) * q2);
    q4 = f(t(j+1), yrk4(j) + h * q3);
    yrk4(j+1) = yrk4(j) + (h/6) * (q1 + 2 * q2 + 2 * q3 + q4);
end
j = length(yex);
fprintf('t = %4.1f:  %8.5f  %8.5f  %8.5f  %8.5f\n', ...
        t(j), yex(j), yeul(j), ymid(j), yrk4(j));

% show results
figure(1)
tf = 0:0.01:10;
yexf = log(tf.^2 / 2 + tf + 1);
plot(t, yeul, 'o', t, ymid, '*', t, yrk4, 's', tf, yexf)
legend('Euler', 'midpoint', 'RK4', 'y(t) exact',...
       'location', 'southeast')
xlabel t,  ylabel y
print -dpng eulermidgraphs.png

% compute and show errors
figure(2)
semilogy(t(t>0), abs(yeul(t>0) - yex(t>0)), 'o',...
         t(t>0), abs(ymid(t>0) - yex(t>0)), '*',...
         t(t>0), abs(yrk4(t>0) - yex(t>0)), 's')
legend('Euler', 'midpoint', 'RK4')
xlabel t,  ylabel('numerical error'),  grid on
print -dpng eulermiderrors.png
