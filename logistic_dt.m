% This program computes the numerical solution of the logistic equation 
% for a set of repeatedly halved time steps. Plots the solutions corresponding
% to the last two time steps. Then it asks the user if the loop is to be continued.

clc, clear, close all

M = 500; % carrying capacity
r = 0.1;
f = @(u, t) r*(1 - u/M)*u; %logistic equation
U_0 = 150;   % initial condition
dt = input('Enter initial Time step: ');
T = 100; 

a = 1;
k = -1;
while a == 1
    close all
    if a == 1
    k = k + 1;
    
    dt_k = 2^(-k)*dt; 
    kk = k;
    TT = T; 
    [u, t] = ode_FE(f, U_0, dt_k, T); 
    plot(t, u, 'b--'); 
    xlabel('t'); 
    ylabel('N(t)'); 
    
    hold on
    dt_k = 2^(-(k+1))*dt; 
    kk = k+1;
    TT = T; 
    [u, t] = ode_FE(f, U_0, dt_k, T); 
    plot(t, u, 'r-'); 
    xlabel('t'); 
    ylabel('N(t)'); 
    legend('Solution for 1st time step', 'Solution for 2nd time step');
    title('Solutions corresponding to the last two time steps');
    disp(['Time step is: ' num2str(dt_k)]);
    a = menu('Continue? ','Yes','No');
    
        else
            break
    end
end
