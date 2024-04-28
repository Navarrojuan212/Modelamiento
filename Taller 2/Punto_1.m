%% a) TRUXAL RAGAZZINI
clc
clear all
close all
syms s
Gp=1.706/(s^2+0.133*s+0.04318);
Gd=(948*exp(3)*s^2+4.74*exp(6)*s+474*exp(3))/(50*exp(3)*s^3+0.95*exp(6)*s^2+4.742*s+474*exp(3));
Gc=Gd/(Gp*(1-Gd));
Gc=simplify(Gc);
s= tf('s');
%% b) Ubicación de polos usando ecuaciones 
Ts=110;
zeta=0.15;
Wn=4/(zeta*Ts);
Gp=1.706/(s^2+0.133*s+0.04318);

pol=[1 2*zeta*Wn Wn^2];
roots(pol);
delta=0.133-(2*zeta*Wn);
Kp=((Wn^2+2*zeta*Wn*delta)-0.04318)/1.706;
Ki=(Wn^2*delta)/1.706;

C=pid(Kp,Ki,0);
G=feedback(C*Gp,1)
step(G)
