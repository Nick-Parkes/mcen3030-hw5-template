clear; close all; clc;

m = 1/2000;
b = 0.5;
w = 1/150;
s = 0.2;
g = 1/14;
a = 0.005;

x_0 = [390, 10, 0, 0];
N = sum(x_0);

dt = 0.01;
t_final = 60;

f = @(t,x) [ ...
    m*N - b*x(3)*x(1)/N + w*x(4) - m*x(1), ...
    b*x(3)*x(1)/N - s*x(2) - m*x(2), ...
    s*x(2) - g*x(3) - (m+a)*x(3), ...
    g*x(3) - w*x(4) - m*x(4) ];

[t,x] = RK4(f,x_0,dt,t_final);

S = x(:,1);
E = x(:,2);
I = x(:,3);
R = x(:,4);

[I_max, idx] = max(I);
t_peak = t(idx);

fprintf('Peak infected = %.2f at time t = %.2f\n', I_max, t_peak);

figure;
plot(t,S,'LineWidth',2)
hold on
plot(t,E,'LineWidth',2)
plot(t,I,'LineWidth',2)
plot(t,R,'LineWidth',2)
hold off

xlabel('Time')
ylabel('Population')
title('SEIR Model')
legend('S','E','I','R','Location','best')
grid on