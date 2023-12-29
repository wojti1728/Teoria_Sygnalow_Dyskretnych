%%
close all; clear; clc;
%SPOLT powtorka
conv([4+1i -4-2i -3i -1-2i],[-3-2i -1+1i 3])
%KORELACJA( podobnie jak splot)32

% wektor drugi jest nie dluższy niz wektor pierwszy
xcorr([4+1i -4-2i -3i -1-2i],[-3-2i -1+1i 3])

%%
close all; clear; clc;
%t=<0,10>s, FS=100;
%x1: trójkąt, tw=4s, szer=3, amp=2
%x2: trójkąt, tw=7s, szer=4, amp=1.5
%wyswietlic x1,x2, splot x1*x2 w funkcji t
%dolny wykres: wynik korelacji
Fs=100;
t = 0:(1/Fs):10;
x1=2*(1-abs(t-4)/1.5).*(abs(t-4)<=1.5);
x2=1.5*(1-abs(t-7)/2).*(abs(t-7)<=2); 
xy=conv(x1,x2,'same')/Fs;
xc=xcorr(x2,x1);
tc=-10:(1/Fs):10;
subplot(211), plot(t,x1,'r',t,x2,'g',t,xy,'b')
subplot(212), plot(tc,xc,'c')
%%
close all; clear; clc;
a=load('corr_02.txt');
t=a(:,1)';
x=a(:,2)';
plot(t,x);
dt=t(2)-t(1);
%znalezc prostokat, szer=14, amp=0.7, ma wyjsc poczatek(0.37)
tc=-200:(dt):200;
tp=0:dt:14;
pros=0.7*ones(size(tp)); % amp = 0.7
subplot(211), plot(t,x,'r',tp,pros,'b')
xc=xcorr(x,pros);
nr=find(xc==max(xc(:)),3,'first'); % przyjmuje trzy argumenty, 
% pierwszy to wektor logiczny, 
% nastepny to liczba próbek 
% (dokladnie to liczba wierzcholkow zawsze lepeiej 3-5), 
% kolejnosc próbek
tc(nr) % tu narzcuamy rozmiar tc
subplot(212), plot(tc,xc)
%%
close all; clear; clc;
% znalezc początek każdego z dwóch trójkątów, szer=10s, amp=1;
a=load('corr_02.txt');
t=a(:,1)';
x=a(:,2)';
dt=t(2)-t(1);
tc=-200:(dt):200;
tk=-5:dt:5;
troj1=1-abs(tk)/5;
subplot(211), plot(t,x,'r',tk,troj1,'b')
xc=xcorr(x.^2,troj1.^2)*2+xcorr(1-x,1-troj1); % najpiew zmowyfikowac rozmiar by byl ok, a nastepnie
% modyfikowac wartosciami aby uwypuklic szukane poczatki trojkatow
% warto zaczac od podnoszenia do potegi argumentow z xcorra (albo wieksze
% od 1 albo mniejsze od 1), nastepnie warto dodac xcorra odwrotnego,
% pozniej mozna mnozyc jedno i drugie w zaleznosci co chcemu osiagnac
nrr=find(xc==max(xc(:)),2,'first'); % >= gdy chcemy znalezc wiecej niz jeden a "==" gdy szukamy tylko jednego
tc(nrr)
subplot(212), plot(tc,xc)

%%
close all; clear; clc;
%znalzc srodek sygnalu Gaussa, std=5, amp=2
a=load('corr_02.txt');
t=a(:,1)';
x=a(:,2)';
dt=t(2)-t(1);
tc=-200:(dt):200;
odch = 5;

amp=0.8;
tg=-20:dt:20;
%y=0.8*exp(-(tg-5).*(tg-5))/(2*odch*odch);
gg=0.8*exp(-tg.*tg/50);
xc=xcorr(x,gg)+xcorr(1-x,1-gg);
subplot(211), plot(t,x,'r',tg,gg,'b');
nrr=find(xc>=0.9999999*max(xc(:)),3,'first');
tc(nrr)+20 % dodajemy 20 poniewaz chcemy znalezc srodek a mamy zakres -20:20, w przeciwnym razie gdy szukamy poczatlu zostawiamy tc(nrr)

subplot(212), plot(tc,xc)
%%
close all; clear; clc;
%znalzc srodek sygnalu Gaussa, std=5, amp=0.8, srednai=0
%zad 4 ze strony dwornika
a=load('corr_02.txt');
t=a(:,1)';
amp=a(:,2)';
dt=t(2)-t(1);
Fs=1/dt;
tc=-200:dt:200;
tg=-20:dt:20;
xg=0.8*(exp(-(tg.^2)/(2*5*5)));

xc=xcorr(amp,xg)+xcorr(1-amp,1-xg);
nrr=find(xc==max(xc(:)),3,'first');
tc(nrr)
subplot(211), plot(t,amp,'b',tg,xg,'r');

subplot(212), plot(tc,xc);
%%
close all; clear; clc;
%znalzc kazdy z ząbków pily pilokrztaltnej o amplitudzie 1.0 i czasie trwania 9s,
a=load('corr_02.txt');
t=a(:,1)';
x=a(:,2)';
dt=t(2)-t(1);
tc=-200:(dt):200;
tk=0:dt:9;
pilo=1*mod(tk,9)/9; % to wzor piloksztaltna, amp = 1, a zakres 0-9 zatem dzielimy przez 9 i wstaiamy 9 do drugiego argumnetu 
xc=xcorr(x.^3,pilo.^3);
subplot(211), plot(t,x,'r',tk,pilo,'b')
nrr=find(xc>=0.9999*max(xc(:)),3,'first');
tc(nrr)
subplot(212), plot(tc,xc)

%% 
close all; clear; clc;

% zadania ze srtrony Dwornika:
% zad 3:

a=load('corr_01.txt');
t=a(:,1)';
amp=a(:,2)';

dt=t(2)-t(1);
Fs=1/dt;

tc=-100:dt:100;
% prostokat amp=0.7, t=7s
tp=-3.5:dt:3.5;
xp=0.7*(abs(tp)<=3.5);

xc1=xcorr(amp,xp);
nrr=find(xc1>=0.99999*max(xc1(:)),3,'first');
tc(nrr);

subplot(211), plot(t,amp,'r',tp,xp,'b');
subplot(212),plot(tc,xc1,'g');

% sygnal trojkatny
tk=-5:dt:5;
pk=0.8*(1-(abs(tk))/5);

xc2=xcorr(amp,pk)+xcorr(1-amp,1-pk);
nrr2=find(xc2==max(xc2(:)),3,'first');
tc(nrr2);

% sygnal piloksztaltny

tpil=0:dt:5;
pila=1.0*mod(tpil,5)/5;
xc3=xcorr(amp.^5,pila.^5);
nrr3=find(xc3>=0.999*max(xc3(:)),3,'first');
tc(nrr3)

%sygnal gaussowski
tg=-10:dt:10;
xg=0.8*exp(-(tg.^2)/(2*8));

xc4=xcorr(sqrt(amp),sqrt(xg));
nrr4=find(xc4==max(xc4(:)),3,'first');
tc(nrr4)

subplot(211), plot(t,amp,'r',tg,xg,'b');
subplot(212),plot(tc,xc4,'g');
