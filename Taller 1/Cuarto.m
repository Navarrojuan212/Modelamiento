load('datos.mat')
plot(Time,Output)
hold on
%%
% Según el taller
uf=20; ui=5;

% Según la gráfica
yf= 46; yi= 6.5; 

%Variable Simbólica
s= tf('s');

% En base a las formulas
c=yf-yi;
k=c/(uf-ui);
 
z=0.32;       % Zeta
ts=60.1525;   % tiempo de estabilización
wn=4/(z*ts);  

% Función de transferencia
G4=(c*wn^2)/(s^2+2*z*wn*s+wn^2)

% Escalon
step(G4+yi, 'r')