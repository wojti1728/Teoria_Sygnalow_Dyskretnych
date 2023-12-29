%%
close all; clear; clc;

%FILTRACJA CZESTOTLIWOSCIOWA CZESC 1

% Zadanie 1
Fs=100;
t=0:(1/Fs):10;

x1=5*sin(2*pi*t*10);
x2=1*sin(2*pi*t*30);
x=x1+x2;

%plot(t,x,'b');

f=linspace(-Fs/2,Fs/2,length(t));
XT=fftshift(fft(x));
WA=abs(XT);

subplot(211), plot(f,WA,'r');

LP=1.0*(f >= -12 & f <= -8 | f>=8 & f<=12);
XTF=XT.*LP;
x_new = ifft(ifftshift(XTF));
subplot(211),plot(t,x,'g',t,x_new,'r');
subplot(212), plot(f,WA,'r',f,2000*LP,'g');

%%
close all; clear; clc;

Fs=100;
t=0:(1/Fs):10;
x1=5*sin(2*pi*t*10);
x2=1*sin(2*pi*t*30);
x=x1+x2;

XT=fftshift(fft(x));
WA=abs(XT);
f=linspace(-Fs/2,Fs/2,length(t));

LP=1.0*(f<=12 & f>=8 | f<=-8 & f>=-12);
XT2=XT.*LP;
xn=real(ifft(ifftshift(XT2)));

subplot(211), plot(t,x,'r',t,xn,'g');
subplot(212), plot(f,WA,'b',f,2000*LP,'g');


%%
close all; clear; clc;

%zadnie 2

Fs=100;
t=0:(1/Fs):10;

x=1.*(abs(t-5)<=0.5);

XT=fftshift(fft(x));
f=linspace(-Fs/2,Fs/2,length(t));
WA=abs(XT);

dolno_prze=1.*(abs(f)<=10);
gorno_prze=1.*(abs(f)>=10);

x_new_d=ifft(ifftshift(dolno_prze.*XT));
x_new_g=ifft(ifftshift(gorno_prze.*XT));

subplot(221), plot(t,x,'r',t,x_new_d,'g');
subplot(222), plot(t,x,'r',t,x_new_g,'g');
subplot(223), plot(f,WA,'r',t,dolno_prze*Fs,'g');
subplot(224), plot(f,WA,'r',t,gorno_prze*Fs/4,'g');


%%
close all; clear; clc;

%zadnie 2

Fs=100;
t=0:(1/Fs):10;

x=1.*(abs(t-5)<=0.5);


XT=fftshift(fft(x));
WA=abs(XT);
f=linspace(-Fs/2,Fs/2,length(t));



LP=1.0*(abs(f)<=5);
LG=1.0*(abs(f)>=5)
WA2=XT.*LP;
WA3=XT.*LG;
xn_dolno=ifft(ifftshift(WA2));
xn_gorno=ifft(ifftshift(WA3));
subplot(211), plot(t,x,'r',t,xn_gorno,'g');
subplot(212), plot(f,WA,'g',f,LG*50,'b');

%%
close all; clear; clc;
% zad 5: Filtracja

a=load('trasa_01.txt');
x=a(:,1)';
dt=4*1000;
t=0:(1/dt):0.5;

f=linspace(-dt/2,dt/2,length(t));
XT=fftshift(fft(x));
WA=abs(XT);

subplot(211), plot(t,x,'r');
subplot(212),plot(f,WA,'b');

%%

% KORELACJA z pdf-a, zad3:

a=load('testowe.dat');
t=a(:,1)';
amp=a(:,2)';

dt=t(2)-t(1);
Fs=1/dt; % czestotliwosc probkowania
tc=-10:dt:10;
tp=-0.75:dt:0.75;
xp=0.65.*(abs(tp)<=0.75);

xc=xcorr(sqrt(amp).^0.5,sqrt(xp).^0.5)+xcorr(1-amp,1-xp);
nrr=find(xc>=0.99999999*max(xc(:)),3,'first');
tc(nrr)

subplot(211), plot(t,amp,'r',tp,xp,'g');
subplot(212), plot(tc,xc)

%% korelacja z zeszelego roku:
% test_1_60

a=load('korelacja_06.txt');

t=a(:,1)';
amp=a(:,2)';
dt=t(2)-t(1);
Fs=1/dt;
tc=-55:dt:55;
tk=-1.5:dt:1.5;
xk=1.0*abs(1-(abs(tk)/(1.5)));

% trojkat
xc1=xcorr(amp.^2,xk.^2)+xcorr(1-amp,1-xk);
nrr1=find(xc1==max(xc1(:)),3,'first');
tc(nrr1)

% kazdy sygna; gaussa 
tg=0:dt:6;
xg=0.9*exp(-((tg-3).^2)./(2*0.75*0.75));
xc2=xcorr(amp,xg)+xcorr(1-amp,1-xg);
nrr2=find(xc2>=0.9999999999*max(xc2(:)),6,'first');
tc(nrr2)

% prostokat 
tp=-2.5:dt:2.5;
xp=0.65*(abs(tp)<=2.5);
xc3=xcorr(amp,xp);
nrr3=find(xc3>=0.999*max(xc3(:)),1,'first');
tc(nrr3)


subplot(211),plot(t,amp,'g',tg,xg,'b');
subplot(212), plot(tc,xc2,'b');

%% 2 Sposob EWY
close all; clear; clc;
A=load('korelacja_06.txt');
t=A(:,1)';
x=A(:,2)';

dt=t(2)-t(1);
tt=0:dt:3;
tg=0:dt:6;
tp=0:dt:5;
tc=-55:dt:55;

troj=(1-abs(tt-1.5)/1.5).*(abs(tt-1.5)<=1.5);
gauss=0.9*exp(-((tg-3).^2)/(2*0.75*0.75));
pros=0.65*ones(size(tp));

xt=xcorr(x.^2,troj.^2)*2 + xcorr(1-x,1-troj);
xg=xcorr(x,gauss)+xcorr(1-x,1-gauss);
xp=xcorr(x,pros);

nrt=find(xt>=0.99999*max(xt(:)),3,'first');
nrg=find(xg>=0.999999999*max(xg(:)),6,'first');
nrp=find(xp==max(xp(:)),1,'first');

wynik_trojkat=tc(nrt)
wynik_gauss=tc(nrg)+3
wynik_prostokat=tc(nrp)

subplot(211);plot(t,x,'b',tt,troj,'r',tg,gauss,'g',tp,pros,'k');
subplot(212);plot(tc,xt,'r',tc,xg,'g',tc,xp,'k');















