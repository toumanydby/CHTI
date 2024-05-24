close all;

f1=85E3;
%f1=85005.9;
f2=9E4;
f3=95E3;
%f3=64986.8;
f4=10^5;
f5=115E3;
%f5= 115015.9;
f6=12E4;


omega1 = 2*pi*f1;
omega2 = 2*pi*f2;
omega3 = 2*pi*f3;
omega4 = 2*pi*f4;
omega5 = 2*pi*f5;
omega6 = 2*pi*f6;

Fe =32E4;
% frequence d'echantillonage
% On en deduit Te par la formule Te = 1 / Fe ou Te = T / M

dF = 5E3;

T = 1 / dF; 
M = Fe / dF;
Te = T/M; % periode d'echantillonnage

Tsim = T-Te;
resSimul = sim("laserGameSimul");
resSimulCarre = sim("laserGameSimulCarre");

figure(1);
plot(resSimul.Sum_SinEchanti.Data);
grid;
title('Signaux temporels');



figure(2);
ff = abs(fft(resSimul.Sum_SinEchanti.Data)) / M;
y=linspace(0,M-1,M);
grid; % c'est pour faire afficher un grid
stem(y,ff);
title('MODULE de la FFT');


figure(3);
freqTabValue = y * dF ;
stem(freqTabValue,ff);
grid;
title('Figure (Lecture des frequences)');



for i = 1:M/2
    resSimul.Sum_SinEchanti.Data(i)=0;
end

figure(4);
ff = abs(fft(resSimul.Sum_SinEchanti.Data)) / M;
grid; % c'est pour faire afficher un grid
stem(freqTabValue,ff);
title('MODULE de la FFT TRUQUE');



figure(5);
ffCarre = abs(fft(resSimulCarre.Sum_SinEchanti.Data)) / M;
grid; % c'est pour faire afficher un grid

sinCarre= linspace(0,67,68);
freqTabValueSInCarre = sinCarre * dF;

stem(freqTabValueSInCarre,ffCarre);
title('MODULE de la FFT Carre');

num = [1];
deno = [1.7483*10^(-23),7.6663*10^(-18),1.162*10^(-11),3.0332*10^(-6),1];
transfer_function = tf(num,deno);

figure(6);
grid on;
bode(transfer_function);
title('Diagramme de bode');
