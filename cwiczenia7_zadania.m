%%
close all; clear; clc;
% ZADANIE 4 a)
%prostokat, 
%t=<-pi,pi>s, FS=100;

Fs=100;
t = -pi:(1/Fs):pi;
x1=1*(abs(t)<=1); % amp=1, szer=2, sr=0
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
f=linspace(-Fs/2,Fs/2,length(t));
subplot(212), plot(f,WA);
xlabel('Czestotliwosc [Hz]');
xt=abs(2*sinc(f*2)); % abs() poniewaz chcemy porownac widmo z widmem, 
% transformate z transformata,( mnozymy f*2 poniewaz sinc() w matlabie jest
% iinny więc tak trzeba)
% , mnozymy 
subplot(211), plot(f,WA,'.r',f,xt,'g')
%%
close all; clear; clc;
% ZADANIE 4 b)
%trójkąt, 
%t=<-5,5>s, FS=100;

Fs=100;
t = -5:(1/Fs):5;
x1=((1-abs(t)).*(abs(t)<=1)); % amp=1, szer=2, sr=0
plot(t,x1,'r')
subplot(211), plot(t,x1,'r')
xlabel('czas [s]');
XT=fftshift(fft(x1)); % przesuniecie transformaty
WA=abs(XT); % widmo amplitudowe %%% dzielimy przez Fs poniewaz wykres za maly
WF=angle(XT); % widmo fazowe
%f=linspace(0,Fs,length(t)); % wektor czestotliwosci (polecenie zwraca wektor od zera do Fs o dlugosci (t))
% WIDMO FAZOWE I AMPLITUDOWE JEST FUNKCJĄ CZESTOTLIWOŚCI A NIE CZASU!!!
% (polowa punktow zabrana za bedne myslenie)
f=linspace(-Fs/2,Fs/2,length(t));
subplot(212), plot(f,WA);
xlabel('Czestotliwosc [Hz]');
xt=abs(-(1./f).*(sinc(2*f)-(1./f))); % abs() poniewaz chcemy porownac widmo z widmem, 
% transformate z transformata,( mnozymy f*2 poniewaz sinc() w matlabie jest
% iinny więc tak trzeba)
% , mnozymy 
subplot(211), plot(f,WA,'r',f,xt,'g')
%%
close all; clear; clc;
% ZADANIE 4 c)
%sygnal harmoniczny, amp=1, okres=1 
%t=<-4pi,4pi>s, FS=100;

Fs=100;
t = -4*pi:(1/Fs):4*pi;
x1=sin(2*pi*t); % amp=1, okres=1
plot(t,x1,'r')
subplot(211), plot(t,x1,'r')
xlabel('czas [s]');
XT=fftshift(fft(x1)); % przesuniecie transformaty
WA=abs(XT); % widmo amplitudowe %%% dzielimy przez Fs poniewaz wykres za maly
WF=angle(XT); % widmo fazowe
%f=linspace(0,Fs,length(t)); % wektor czestotliwosci (polecenie zwraca wektor od zera do Fs o dlugosci (t))
% WIDMO FAZOWE I AMPLITUDOWE JEST FUNKCJĄ CZESTOTLIWOŚCI A NIE CZASU!!!
% (polowa punktow zabrana za bedne myslenie)
f=linspace(-Fs/2,Fs/2,length(t));
subplot(212), plot(f,WA);
xlabel('Czestotliwosc [Hz]');
xt=0*f; % abs() poniewaz chcemy porownac widmo z widmem, 
% transformate z transformata,( mnozymy f*2 poniewaz sinc() w matlabie jest
% iinny więc tak trzeba)
% , mnozymy 
subplot(211), plot(f,WA,'.r',f,xt,'g')
%%
close all; clear; clc;
% ZADANIE 4 b)
%GAUSSA, sr=0, odchykenie=1
%t=<-5,5>s, FS=100;

Fs=100;
t = -5:(1/Fs):5;
x1=(1/sqrt(2*pi)*exp(-(t.*t)./2)); % amp=1, szer=2, sr=0
plot(t,x1,'r')
subplot(211), plot(t,x1,'r')
xlabel('czas [s]');
XT=fftshift(fft(x1)); % przesuniecie transformaty
WA=abs(XT); % widmo amplitudowe %%% dzielimy przez Fs poniewaz wykres za maly
WF=angle(XT); % widmo fazowe
%f=linspace(0,Fs,length(t)); % wektor czestotliwosci (polecenie zwraca wektor od zera do Fs o dlugosci (t))
% WIDMO FAZOWE I AMPLITUDOWE JEST FUNKCJĄ CZESTOTLIWOŚCI A NIE CZASU!!!
% (polowa punktow zabrana za bedne myslenie)
f=linspace(-Fs/2,Fs/2,length(t));
subplot(212), plot(f,WA);
xlabel('Czestotliwosc [Hz]');
xt=abs(-(1./f).*(sinc(2*f)-(1./f))); % abs() poniewaz chcemy porownac widmo z widmem, 
% transformate z transformata,( mnozymy f*2 poniewaz sinc() w matlabie jest
% iinny więc tak trzeba)
% , mnozymy 
subplot(211), plot(f,WA,'.r',f,xt,'g')