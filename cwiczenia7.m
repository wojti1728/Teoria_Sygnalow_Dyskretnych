%%
close all; clear; clc;
%prostokat, 
%t=<-6,6>s, FS=100;

Fs=100;
t = -6:(1/Fs):6;
x1=2*(abs(t)<=3);
plot(t,x1,'r')
subplot(211), plot(t,x1,'r')
%subplot(212), plot(tc,xc,'c')
xlabel('czas [s]');
%XT=fft(x1);
XT=fftshift(fft(x1)); % przesuniecie transformaty
WA=abs(XT)/Fs; % widmo amplitudowe %%% dzielimy przez Fs poniewaz wykres za maly
WF=angle(XT); % widmo fazowe
%f=linspace(0,Fs,length(t)); % wektor czestotliwosci (polecenie zwraca wektor od zera do Fs o dlugosci (t))
% WIDMO FAZOWE I AMPLITUDOWE JEST FUNKCJĄ CZESTOTLIWOŚCI A NIE CZASU!!!
% (polowa punktow zabrana za bedne myslenie)
f=linspace(-Fs/2,Fs/2,length(t));
subplot(212), plot(f,WA);
xlabel('Czestotliwosc [Hz]');
xt=abs(12*sinc(3*f*2)); % abs() poniewaz chcemy porownac widmo z widmem, 
% transformate z transformata,( mnozymy f*2 poniewaz sinc() w matlabie jest
% iinny więc tak trzeba)
% , mnozymy 
subplot(211), plot(f,WA,'b',f,xt,'g')
%%
close all; clear; clc;
%prostokat, 
%t=<-6,6>s, FS=100;

Fs=100;
t = -6:(1/Fs):6;
x1=2*(abs(t)<=5)*3/5;
plot(t,x1,'r')
subplot(211), plot(t,x1,'r')
%subplot(212), plot(tc,xc,'c')
xlabel('czas [s]');
%XT=fft(x1);
XT=fftshift(fft(x1)); % przesuniecie transformaty
WA=abs(XT)/Fs; % widmo amplitudowe %%% dzielimy przez Fs poniewaz wykres za maly
WF=angle(XT); % widmo fazowe
%f=linspace(0,Fs,length(t)); % wektor czestotliwosci (polecenie zwraca wektor od zera do Fs o dlugosci (t))
% WIDMO FAZOWE I AMPLITUDOWE JEST FUNKCJĄ CZESTOTLIWOŚCI A NIE CZASU!!!
% (polowa punktow zabrana za bedne myslenie)
f=linspace(-Fs/2,Fs/2,length(t));
subplot(212), plot(f,WA);
xlabel('Czestotliwosc [Hz]');
xt=abs(12*sinc(3*f*2)); % abs() poniewaz chcemy porownac widmo z widmem, 
% transformate z transformata,( mnozymy f*2 poniewaz sinc() w matlabie jest
% iinny więc tak trzeba)
% , mnozymy 
subplot(211), plot(f,WA,'b',f,xt,'g')
%%
close all; clear; clc;
%prostokat, 
%t=<-6,6>s, FS=100;

Fs=100;
t = -6:(1/Fs):6;
x1=2*(abs(t-1)<=3);
plot(t,x1,'r')
subplot(211), plot(t,x1,'r')
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
xt=abs(12*sinc(3*f*2)); % abs() poniewaz chcemy porownac widmo z widmem, 
% transformate z transformata,( mnozymy f*2 poniewaz sinc() w matlabie jest
% iinny więc tak trzeba)
% , mnozymy 
subplot(212), plot(f,unwrap(WF),'b') % unwrap łaczy koniec jednego okresu 
% (w dol albu w gore) z okresem nizej lub wyzej by sie polaczyly
%%
close all; clear; clc;
%prostokat,  
%t=<0,10>s, Fs=100;
% x = x1+x2+x3; 
% x1: harm(sinus), amp=1.2, okres=0.04 s
% x2: harm(sinus), amp=0.9, f = 41 Hz
% x3: f. trojkoatna, tw=4s, szer=2s, amp=4
% (x1=2*(1-abs(t-4)/1.5).*(abs(t-4)<=1.5);)
Fs=200;
t = 0:(1/Fs):10;
x1=1.2*sin(2*pi*(1/(0.04))*t);
x2=0.9*sin(2*pi*41*t);
x3=4*(1-abs(t-4)).*(abs(t-4)<=1);
x=x1+x2+x3;
XT=fftshift(fft(x ));
WA=abs(XT);
f=20*(t-5); %checmy aby f=100 wiec t=10 t-5*20=100
%f=linspace(-Fs/2,Fs/2,length(t));
subplot(211), plot(t,x);
subplot(212), plot(f,WA);
%%
close all; clear; clc;

fft([1,2,3,4]) % wynik dla dyskretnej transformaty furiera [3,2,1+1i,-1]
