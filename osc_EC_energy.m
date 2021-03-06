% Program which implements Euler-Cromer scheme

clc, clear, close all

omega = 3;
P = 2*pi/omega;
dt = P/100;
T = 4*P;
N_t = floor(round(T/dt));
t = linspace(0, N_t*dt, N_t+1);

u = zeros(N_t+1, 1);
v = zeros(N_t+1, 1);

% Initial condition
X_0 = 1;
u(1) = X_0;
v(1) = 0;

% Step equations forward in time
for n = 1:N_t
    v(n+1) = v(n) - dt*omega^2*u(n);
    u(n+1) = u(n) + dt*v(n+1);
end

true_sol = X_0*cos(omega*t);
subplot(2,1,1);
plot(t, u, 'b-',t, true_sol, 'r--');
legend('numerical', 'exact', 'Location','northwest');
xlabel('t');
ylabel('u');

%u = X_0*cos(omega*t); v = -omega*X_0*sin(omega*t); % Exact solution for the energy
[pot, kin] = osc_energy(u, v, omega);
total = pot + kin;
title('Euler-Cromer');
subplot(2,1,2);
plot(t, pot, 'm-')
hold on
plot(t, kin, 'b-')
hold on
plot(t, total, 'k-')
xlabel('t');
ylabel('Energy')
legend('Potencial E', 'Kinetic E' ,'Total E','Location','northwest')

