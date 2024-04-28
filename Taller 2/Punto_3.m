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

%% punto a
H=feedback(G2,1)
BW=bandwidth(H)
Ts=0.02
G2_d = c2d(G2, Ts,'zoh')
step(G2_d)
%% punto b
B=feedback(G2,1)
sisotool(G2_d)