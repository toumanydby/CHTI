close all;
T = 1/7;  % duree totale de l'experience
M = 32; % nombre total de points
Te = T/M; % periode d'echantillonnage
Tsim = T-Te; % duree de simulation

FSin = 14;
Res = sim("simulDFT");

plot(Res.Sin_Continu);
hold on; %permet de superposer la courbe à suivre
plot(Res.Sin_Echanti,'o');


ff = abs(fft(Res.Sin_Echanti.Data)) / M;
y=linspace(0,31,32);

figure
plot(y,ff,'o');

F = 1/T;
y = y * F;

figure 
plot(y,ff,'o');
