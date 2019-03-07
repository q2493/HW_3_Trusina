% Program for impementing Backward Euler scheme
clc, clear, close all

omega = 3;
P = 2*pi/omega;
dt = P/20;
T = 4*P;
N_t = floor(T/dt);
t = linspace(0, N_t*dt, N_t+1);

u = zeros(N_t+1, 1);
v = zeros(N_t+1, 1);

% Initial condition
X_0 = 1;
u(1) = X_0;
v(1) = 0;
true_sol = X_0*cos(omega*t);

% Backward Euler
for n = 2:N_t+1
    u(n) = (u(n-1) + dt*v(n-1))/(1+dt^2*omega^2);
    v(n) = (v(n-1)-dt*omega^2*u(n-1))/(1+dt^2*omega^2);
end

figure 
plot(t, u, 'k-', t, true_sol, 'r--');
legend('Numerical', 'Exact', 'Location','northwest');
xlabel('t');
ylabel('u');
title('Backward Euler')

% Comparison of other schemes
figure
subplot(3,1,1);
plot(t, u, 'k-', t, true_sol, 'r--');
legend('Numerical', 'Exact', 'Location','northwest');
xlabel('t');
ylabel('u');
title('Backward Euler')

% Step equations forward in time
for n = 1:N_t
    u(n+1) = u(n) + dt*v(n);
    v(n+1) = v(n) - dt*omega^2*u(n);
end
subplot(3,1,2);
plot(t, u, 'b-',t, true_sol, 'r--');
legend('Numerical', 'Exact', 'Location','northwest');
xlabel('t');
ylabel('u');
title('Forward Euler')

% Step equations forward in time
for n = 1:N_t
    v(n+1) = v(n) - dt*omega^2*u(n);
    u(n+1) = u(n) + dt*v(n+1);
end
true_sol = X_0*cos(omega*t);
subplot(3,1,3);
plot(t, u, 'b-',t, true_sol, 'r--');
legend('numerical', 'exact', 'Location','northwest');
xlabel('t');
ylabel('u');
title('Euler-Cromer')