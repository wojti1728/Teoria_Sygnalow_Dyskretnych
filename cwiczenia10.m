    %%
close all; clear; clc;
load handel.mat

x=y'; % transponujemy
N=length(x);
Fs=100;
t = (0:N-1)/Fs; % czas
xlabel('czas [s]');
XT=fftshift(fft(x)); % przesuniecie transformaty
WA=abs(XT)/Fs; % widmo amplitudowe %%% dzielimy przez Fs poniewaz wykres za maly
f=linspace(-Fs/2,Fs/2,length(t));
subplot(211), plot(t,x,'b'); 
subplot(212), plot(f,WA,'r')


% filtr pasmozaporowy Butterwortha, szero = 400
% hw = 1./(1+((f*400)/((f.*f) - 1000^2)^(2*n)));
%%
close all; clear; clc;
load handel.mat

x=y';
N=length(x);
% Fs=100;
t = (0:N-1)/Fs;
xlabel('czas [s]');
XT=fftshift(fft(x)); % przesuniecie transformaty
WA=abs(XT); % widmo amplitudowe %%% dzielimy przez Fs poniewaz wykres za maly
f=linspace(-Fs/2,Fs/2,length(t));

BS = 1./(1+((f*400)./((f.*f) - 10^2)).^6);  % filtr Butterwortha , szerokosc=400
xn=real(ifft(ifftshift(BS.*XT)));

subplot(211), plot(t,x,'b',t,xn,'r'); 
subplot(212), plot(f,WA,'b',f,BS*500,'.r')