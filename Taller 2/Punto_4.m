K=1
s= tf('s');
G1= K/((s+1)*(s+4));
H=c2d(G1,0.2,'zoh');
Hf=feedback(H,1);
rlocus(Hf)