%%
close all; clear; clc;
% ZADANIE 1 (FILTRACJA SYGALLU !!!) 
%harmoniczny f=16hz, amp=1.2 , 
%harmoniczny; okres=0.1s (czylli f=1/0.1), amp=0.9, 
% trojkatna, % tw=1s, szer=3s, amp=3
%t=<-5,5>s, FS=100;

Fs=100;
t = -5:(1/Fs):5;
x3=3*((1-abs(t-1)/1.5)).*((abs(t-1))<=1.5); % amp=3, szer=3, sr=1
x1=1.2*sin(2*pi*16*t);
x2=0.9*sin(2*pi*(1/0.1)*t);
x=x1+x2+x3;
plot(t,x,'r')

subplot(211), plot(t,x,'b')
%subplot(212), plot(tc,xc,'c')
xlabel('czas [s]');
XT=fftshift(fft(x)); % przesuniecie transformaty
WA=abs(XT)/Fs; % widmo amplitudowe %%% dzielimy przez Fs poniewaz wykres za maly
%WF=angle(XT); % widmo fazowe
%f=linspace(0,Fs,length(t)); % wektor czestotliwosci (polecenie zwraca wektor od zera do Fs o dlugosci (t))
% WIDMO FAZOWE I AMPLITUDOWE JEST FUNKCJĄ CZESTOTLIWOŚCI A NIE CZASU!!!
% (polowa punktow zabrana za bledne myslenie)
f=linspace(-Fs/2,Fs/2,length(t)); % mozna f=10*t

filtr=1.0*(abs(f)<=13); % bo mamy f0 = 13 (wybralismy sami ppomiedzy szczytami) %filtr idealny
xn=real(ifft(ifftshift(filtr.*XT))); % obcinamy czesc urojona a 
% zostawiamy rzeczywista, to jest nas powrot do domeny czasu !

subplot(211), plot(t,x,'r',t,xn,'b')
subplot(212), plot(f,WA,'k',f,5*filtr,'g'); % ta 500 to na potrzeby 
% graficzne aby bylo widac filtr 
xlabel('Czestotliwosc [Hz]');

%%
close all; clear; clc;
% ZADANIE 1 (FILTRACJA SYGALLU !!!)  USUWAMY SKLADOWA 10 i -10 Hz
%harmoniczny f=16hz, amp=1.2 , harmo; okres=0.1s, amp=0.9, 
% trojkatna, % tw=1s, szer=3s, amp=3
%t=<-5,5>s, FS=100;

Fs=100;
t = -5:(1/Fs):5;
x3=3*((1-abs(t-1)/1.5)).*((abs(t-1))<=1.5); % amp=4, szer=4, sr=0
x1=1.2*sin(2*pi*16*t);
x2=0.9*sin(2*pi*(1/0.1)*t);
x=x1+x2+x3;
plot(t,x,'r')

subplot(211), plot(t,x,'*b')
%subplot(212), plot(tc,xc,'c')
xlabel('czas [s]');
XT=fftshift(fft(x)); % przesuniecie transformaty
WA=abs(XT)/Fs; % widmo amplitudowe %%% dzielimy przez Fs poniewaz wykres za maly
%WF=angle(XT); % widmo fazowe
%f=linspace(0,Fs,length(t)); % wektor czestotliwosci (polecenie zwraca wektor od zera do Fs o dlugosci (t))
% WIDMO FAZOWE I AMPLITUDOWE JEST FUNKCJĄ CZESTOTLIWOŚCI A NIE CZASU!!!
% (polowa punktow zabrana za bedne myslenie)
f=linspace(-Fs/2,Fs/2,length(t)); % mozna f=10*t
filtr=1.0*(abs(f)<=5 | abs(f)>=13) ; % bo mamy f0 = 13 (wybralismy sami pomiedzy szczytami)
xn=real(ifft(ifftshift(filtr.*XT))); % obcinamy czesc urojona a 
% zostawiamy rzeczywista, to jest nas powrot do domeny czasu !
subplot(211), plot(t,x,'r',t,xn,'b')
subplot(212), plot(f,WA,'k',f,5*filtr,'g'); % ta 500 to na potrzeby 
% graficzne aby bylo widac filtr 
xlabel('Czestotliwosc [Hz]');
%%
close all; clear; clc;
% ZADANIE 1 (FILTRACJA SYGALLU !!!)  USUWAMY SKLADOWA 10 i -10
% prostokatny, % sr=0, szer=2s, amp=1
%t=<-5,5>s, FS=100;

Fs=100;
t = -5:(1/Fs):5;
x=1*(abs(t)<=2);
plot(t,x,'r')

subplot(211), plot(t,x,'*b')
%subplot(212), plot(tc,xc,'c')
xlabel('czas [s]');
XT=fftshift(fft(x)); % przesuniecie transformaty
WA=abs(XT)/Fs; % widmo amplitudowe %%% dzielimy przez Fs poniewaz wykres za maly
%WF=angle(XT); % widmo fazowe
%f=linspace(0,Fs,length(t)); % wektor czestotliwosci (polecenie zwraca wektor od zera do Fs o dlugosci (t))
% WIDMO FAZOWE I AMPLITUDOWE JEST FUNKCJĄ CZESTOTLIWOŚCI A NIE CZASU!!!
% (polowa punktow zabrana za bedne myslenie)
f=linspace(-Fs/2,Fs/2,length(t)); % mozna f=10*t
%filtr=1.0*(abs(f)<=5 | abs(f)>=13) ; % bo mamy f0 = 13 (wybralismy sami pomiedzy szczytami)
filtr=1.0*(abs(f)<10);
tt=-50:50;
tt=exp(-tt.*tt/(2*256));
%filtr=conv(filtr,tt,'same');
filtrButtle=1./(1+(f./10).^10); % f0=10,N=3 FILTR BATTLwata
%filtrGauss=1*exp(-(f.*f)/(2*10*10));
xn=real(ifft(ifftshift(filtr.*XT))); % obcinamy czesc urojona a 
% zostawiamy rzeczywista, to jest nas powrot do domeny czasu !
subplot(211), plot(t,x,'r',t,xn,'b')
subplot(212), plot(f,WA,'k',f,5*filtrButtle,'g'); % ta 500 to na potrzeby 
% graficzne aby bylo widac filtr 
xlabel('Czestotliwosc [Hz]');
%%
close all; clc;
% ZADANIE 1 (FILTRACJA SYGALLU !!!)  USUWAMY SKLADOWA 10 i -10
% prostokatny, % sr=0, szer=2s, amp=1
%t=<-5,5>s, FS=100;

Fs=100;
t = -5:(1/Fs):5;
%x3=3*((1-abs(t-1)/1.5)).*((abs(t-1))<=1.5); % amp=4, szer=4, sr=0
%x1=1.2*sin(2*pi*16*t);
%x2=0.9*sin(2*pi*(1/0.1)*t);
%x=x1+x2+x3;
%x=1*(abs(t)<=2);
%plot(t,x,'r')

subplot(211), plot(t,x,'b')
%subplot(212), plot(tc,xc,'c')
xlabel('czas [s]');
XT=fftshift(fft(x)); % przesuniecie transformaty
WA=abs(XT)/Fs; % widmo amplitudowe %%% dzielimy przez Fs poniewaz wykres za maly
%WF=angle(XT); % widmo fazowe
%f=linspace(0,Fs,length(t)); % wektor czestotliwosci (polecenie zwraca wektor od zera do Fs o dlugosci (t))
% WIDMO FAZOWE I AMPLITUDOWE JEST FUNKCJĄ CZESTOTLIWOŚCI A NIE CZASU!!!
% (polowa punktow zabrana za bedne myslenie)
f=linspace(-Fs/2,Fs/2,length(t)); % mozna f=10*t
%filtr=1.0*(abs(f)<=5 | abs(f)>=13) ; % bo mamy f0 = 13 (wybralismy sami pomiedzy szczytami)
filtr=1.0*(abs(f)<10);
tt=-50:50;
tt=exp(-tt.*tt/(2*256));
filtr=conv(filtr,tt,'same');
%filtrBattle=1./(1+(f./10).^10); % f0=10,N=3 FILTR BATTLwata
%filtrGauss=1*exp(-(f.*f)/(2*10*10));
xn=real(ifft(ifftshift(filtr.*XT))); % obcinamy czesc urojona a 
% zostawiamy rzeczywista, to jest nas powrot do domeny czasu !
xF=filter(Fir,x);
xI=filter(iir,x);
dF=length(Fir.Numerator)/(2*Fs);
dI=length(iir.ScaleValues)/Fs;
xF=filtfilt(Fir.Numerator,1,x);
xI=filtfilt(iir.SosMatrix,1,x)
subplot(211), plot(t,x,'r',t,xn,'b')
subplot(212), plot(f,WA,'k',f,0.2*filtr,'g'); % ta 500 to na potrzeby 
% graficzne aby bylo widac filtr 
xlabel('Czestotliwosc [Hz]');



