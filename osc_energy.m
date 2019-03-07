function [potential, kinetic] = osc_energy(u, v, omega)
% Function  for returning the potential and kinetic energy of an oscillating system

potential = 0.5*omega^2*u.^2;
kinetic = 0.5*v.^2;