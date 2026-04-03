clear; close all; clc;


dt = 0.01;
t_final = 6;
tol = 0.01;
max_iter = 100;

z1 = 0.2;
z2 = 0.8;

f = @(t,x) [ ...
    x(2), ...
    x(3), ...
   -0.5*x(1)*x(3) ];

x_0 = [0, 0, z1];
[t1, x1] = RK4(f, x_0, dt, t_final);
e1 = x1(end,2) - 1;

x_0 = [0, 0, z2];
[t2, x2] = RK4(f, x_0, dt, t_final);
e2 = x2(end,2) - 1;

iter = 0;

while abs(e2) > tol && iter < max_iter
    z3 = z2 - e2*(z2 - z1)/(e2 - e1);

    z1 = z2;
    e1 = e2;

    z2 = z3;
    x_0 = [0, 0, z2];
    [t, x] = RK4(f, x_0, dt, t_final);
    e2 = x(end,2) - 1;

    iter = iter + 1;
end

xpp0 = z2;
xp = x(:,2);

fprintf('Estimated x''''(0) = %.6f\n', xpp0);
fprintf('Calculated x''(6) = %.6f\n', xp(end));
fprintf('Final error = %.6f\n', xp(end) - 1);

figure;
plot(t, xp, 'LineWidth', 2)
xlabel('t')
ylabel('x''(t)')
title('Boundary Layer Velocity Profile')
grid on
err = xp(end) - 1;

function [t,x] = RK4_local(f, x_0, dt, t_final)

t = (0:dt:t_final)';
n = length(t);

x_0 = x_0(:)';
m = length(x_0);

x = zeros(n,m);
x(1,:) = x_0;

for i = 1:n-1
    k1 = f(t(i), x(i,:));
    k2 = f(t(i)+dt/2, x(i,:) + (dt/2)*k1);
    k3 = f(t(i)+dt/2, x(i,:) + (dt/2)*k2);
    k4 = f(t(i)+dt,   x(i,:) + dt*k3);
    
    x(i+1,:) = x(i,:) + (dt/6)*(k1 + 2*k2 + 2*k3 + k4);
end

end