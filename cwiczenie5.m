%%
close all; clear; clc;
a=load('sejs_2.txt');
Fs=400; %herce
dx=25; % metry
t=(0:511)/Fs; % bo 512 probek
for k=1:24 % bo 24 odbiorniki
    plot(t,a(:,k)+k-1,'b'); hold on;
end
hold off

% znalezc srednia predkosc 
% ZADANIE 5 Z KORELACJI
v=zeros(23,1);
tc=(-511:511)/Fs;
for k=1:23
    xc = xcorr(a(:,k+1),a(:,1)); % jak wpiszemy zamiast k to mamy taką ogolna srednia czesciowa a jak  1 to mamy taka ogolną
    nr=find(xc==max(xc(:)),1,'first');
    v(k)=dx*k/tc(nr);
end
mean(v)
%%
close all; clear; clc;
%SZEREG FURIERA
Fs=100;
t=-4:(1/Fs):4;
x=2*(abs(t)<=3); % prostokąt
XT=1.5*ones(size(t)); % musi byc wektor a0/2 a w naszym wypadku to 1.5 * wektor jedynek
for n=1:50  % modyfikujemy n by zobaczyc co sie dzieje
    an=4*sin(3*n*pi/4)/(n*pi);
    XT=XT+an*cos(n*pi*t/4);
end
plot(t,x,'.g',t,XT,'k')

%%
close all; clear; clc;
%zadanie 2 - trojkat

%|t|<4
%x(t)= 1-|t| dla |t|<=3
%        0   dla |t|>3
Fs=100;
t=-4:(1/Fs):4; %%-||-
x=(1-abs(t)).*(abs(t)<=1);
XT=ones(size(t))/8; %/8 bo |t|<4 czyli 4*2=8 %%% bo amp = 1 oraz a0/2 = 0.5/4
for n=1:50  % modyfikujemy n by zobaczyc co sie dzieje
    an=8*(1-cos(n*pi/4))/(n*n*pi*pi);
    XT=XT+an*cos(n*pi*t/4);
end
plot(t,x,'.g',t,XT,'k')
%%
close all; clear; clc;
%zadanie 2 - funkcja Hevasida 
Fs=100;
t=-4:(1/Fs):4; % nasz zakres
hv=(t+2).*(abs(t)<=2)-4*(t>2); % ze wzoru
xt=zeros(size(t)); % musi byc zerowy wektor bo a0=0
for n=1:50
    an1=(4/(n*pi)*(2*sin(n*pi/2))); % an
    an2=8/(n*pi*n*pi)*sin(n*pi/2)+cos(pi*n)*4/(n*pi)-8*cos(pi*n/2)/(n*pi); % bn
    xt=xt+an1*cos(n*pi*t/4) +an2*sin(n*pi*t/4);
end
plot(t,hv,'.g',t,xt,'k')

%%
close all; clear; clc;
%zadanie - t^2 - funkcja kwadratowa

%|t|<pi
Fs=100;
t=-pi:(1/Fs):pi; %%-||-
x=t.*t;
XT=ones(size(t))/(pi); %/8 bo |t|<4 czyli 4*2=8 %%% bo amp = 1 oraz a0/2 = 0.5/4
for n=1:50  % modyfikujemy n by zobaczyc co sie dzieje
    an=-12*sin(n*pi)/(n*n*n);
    XT=XT+an*cos(n*t);
end
plot(t,x,'.g',t,XT,'.r')

%%
close all; clear; clc;
%zadanie - Kolokwium 2016 =-teoria

%|t|<=4
Fs=100;
t=-4:(1/Fs):4; %%-||-
x=(1-t).*(t>=-4 & t<0)+(-1-t).*(t>0 & t<=4) + 0*(t==0);
XT=zeros(size(t)); 
for n=1:50  % modyfikujemy n by zobaczyc co sie dzieje
    bn=(10*(cos(n*pi))-2)/(n*pi);
    XT=XT+bn*sin(n*t*pi/4);
end
plot(t,x,'.g',t,XT,'.r')

%%
close all; clear; clc;
%zadanie - Kolokwium t2 - teoria

%|t|<=4
Fs=100;
t=-4:(1/Fs):4; %%-||-
x=(t+2).*(t>=-2 & t<=2)+(-4).*(t>2 & t<=4);
XT=zeros(size(t)); 
for n=1:50  % modyfikujemy n by zobaczyc co sie dzieje
    bn=(10*(cos(n*pi))-2)/(n*pi);
    XT=XT+bn*sin(n*t*pi/4);
end
plot(t,x,'.g',t,XT,'.r')



