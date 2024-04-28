%%Trabajo#1_SistemasDeControl
%% Ejercicio #1
clear all
clc
syms Vi I1 I2 I3 V0 s
EC1= s*(I1-I3)+(s/(s*s+1))*(I1-I2)-Vi==0;
EC2= (I2-I3)+V0+(s/(s*s+1))*(I2-I1)==0;
EC3= s*I3+(I3-I2)+s*(I3-I1);
EC4= I2/s==V0;
S=solve([EC1,EC2,EC3,EC4],unique([I1,I2,I3,V0]));
G1=S.V0
%% Step
clear all
s= tf('s');
G1=(s^2 + 2*s + 2)/(s^4 + 2*s^3 + 3*s^2 + 3*s + 2)
step(G1)
%% Ejercicio #2
clear all
clc
syms X1 X2 X3 M1 M2 M3 B1 B2 B3 K1 K2 F s
EC1= X1*(-K1-M1*s*s-B1*s)+B1*X2*s==0;
EC2= F+X2*(-B1*s-B2*s-K2-M2*s*s)+B1*s*X1+K2*X3==0;
EC3= X3*(-B3*s-K2-M3*s*s)+K2*X2==0;
S=solve([EC1,EC2,EC3],unique([X1,X2,X3]));
sol_X2=simplify(S.X2)
%% Step
M1=4;
M2=4;
M3=4;
B1=2;
B2=2;
B3=2;
K1=6;
K2=6;
s= tf('s');
G2=((M1*s^2 + B1*s + K1)*(M3*s^2 + B3*s + K2))/(B1*B2*K2*s^2 + B1*B3*K1*s^2 + B1*B3*K2*s^2 + B2*B3*K1*s^2 + B1*B3*M1*s^4 + B1*B2*M3*s^4 + B1*B3*M2*s^4 + B2*B3*M1*s^4 + B1*K2*M1*s^3 + B1*K1*M3*s^3 + B1*K2*M2*s^3 + B2*K2*M1*s^3 + B1*K2*M3*s^3 + B2*K1*M3*s^3 + B3*K1*M2*s^3 + B3*K2*M1*s^3 + B1*M1*M3*s^5 + B1*M2*M3*s^5 + B2*M1*M3*s^5 + B3*M1*M2*s^5 + K1*K2*M2*s^2 + K1*K2*M3*s^2 + K2*M1*M2*s^4 + K1*M2*M3*s^4 + K2*M1*M3*s^4 + M1*M2*M3*s^6 + B1*K1*K2*s + B2*K1*K2*s + B3*K1*K2*s + B1*B2*B3*s^3)
step(G2)