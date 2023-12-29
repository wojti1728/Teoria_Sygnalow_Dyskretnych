%%
close all; clear; clc;
% ZADANIE 4 a)
%prostokat, % amp=4, szer=4, sr=0
%t=<-10,10>s, FS=200;

Fs=200;
t = -10:(1/Fs):10;
x1=4*((1-abs(t)/2)).*((abs(t))<=2); % amp=4, szer=4, sr=0
plot(t,x1,'r')
subplot(211), plot(t,x1,'r')
%subplot(212), plot(tc,xc,'c')
xlabel('czas [s]');
XT=fftshift(fft(x1)); % przesuniecie transformaty
WA=abs(XT)/Fs; % widmo amplitudowe %%% dzielimy przez Fs poniewaz wykres za maly
WF=angle(XT); % widmo fazowe
%f=linspace(0,Fs,length(t)); % wektor czestotliwosci (polecenie zwraca wektor od zera do Fs o dlugosci (t))
% WIDMO FAZOWE I AMPLITUDOWE JEST FUNKCJĄ CZESTOTLIWOŚCI A NIE CZASU!!!
% (polowa punktow zabrana za bedne myslenie)
f=linspace(-Fs/2,Fs/2,length(t)); % mozna f=10*t
subplot(212), plot(f,WA); 
xlabel('Czestotliwosc [Hz]');
xt=abs(8*(sinc(f*2).*sinc(f*2))); % (mozna 8*(sinc(f*2).^2)% abs() poniewaz chcemy porownac widmo z widmem, 
% transformate z transformata,( mnozymy f*2 poniewaz sinc() w matlabie jest
% iinny więc tak trzeba)
subplot(211), plot(f,WA,'.r',f,xt,'g')
%%
close all; clear; clc;
% ZADANIE 4 a)
%sygnnal gaussa

Fs=200;
t = -10:(1/Fs):10;
x1=(1/3*sqrt(2*pi))*exp(-(t-3).^2/18) % amp=4, szer=4, sr=0
plot(t,x1,'r')
Ex=sum(abs(x1).^2)
XT=fftshift(fft(x1));
WA=abs(XT);
EWA=sum(WA.^2)/length(t)


%%
close all; clear; clc;
% ZADANIE 4 a)
%t=<-10,10>s, FS=200;
Fs=200;
t = 0:(1/Fs):20;
x1=rand(size(t)) + exp(-t);
%Ex=sum()
plot(t,x1,'r')