

function [t,x] = RK4(f,x_0,dt,t_final)

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