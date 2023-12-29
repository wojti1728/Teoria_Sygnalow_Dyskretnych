close all; clear; clc;
%sygnal prostokątny
Fs = 100;
t = 0:(1/Fs):pi;
x = (sin(2*t)-1i*(cos(2*t))).*(t<=(pi/2));
%plot(t,x);
xlabel("Czas[s]");
ylabel("amplituda");
ylim([-0.5,3.5]);
mean(x)
sum(abs(x).^2)/Fs % liczona enaergia/ poczielona przez czestotliwaosc 
plot(t,real(x),'r',t,imag(x),'g');

% liczenie splotu!!
conv([1 -2 0 2], [-1 0 1])

% liczenie splotu!!v2
conv([3 -4 -1 4], [3 5 2],'same')
%ten parametr 'same' do filtracji, paarametr /valid/ przyjmuje tylko te pozycje gdzie
%nie bylo uzupelnione zerami

%%
close all; clear; clc;
% prostokątny
%t = <0,10>, Fs=100
%amp=2, szer=4,sr=5
Fs=100
t = 0:(1/Fs):10;
x = 2*(abs(t-5)<=2);
x2 = conv(x,x,'same')/Fs; %muszą być te parametry
szer=6;
y=(abs(t-5)<=szer/2)/szer;
%y=[1 -2 1]
x3 = conv(x,y,'same'); %muszą być te parametry
plot(t,x,'r',t,y,'b',t,x3,'g')
%%
close all; clear; clc;
%funkcja sza
%t=<0,10>
%Fs=100, x=Sza, dt=1-krok w fukncji sza, amp=1
%y=funkcja gaussa, sr=5, adch=1, amp=1;
%y=y/sum((y:));
%splot
Fs=100
t = 0:(1/Fs):10;
%x = (mod(t,0.13)==0)
x = (mod(t,1)==0);
%plot(t,x)
odch = 0.1;
y=exp(-(t-5).*(t-5))/(2*odch*odch);
%y=y/sum(y(:));
c=conv(x,y,'same') %splot
plot(t,x,'g',t,y,'b',t,c,'r')
%%
close all; clear; clc;
%t=<0,10> , Fs=100
%x: prost, sr=4, amp=1, szer=3
% x dodac rozklad noramlny N(0,0.2);
%y: prost, o dlugosci N=2*k, i ampl=1/N
%splot, wyswietlic x i xy(splot)
Fs=100;
t = 0:(1/Fs):10;
%x = 2*(abs(t-5)<=2);
x=1*(abs(t-4)<=1.5);
xs = x + 0.2*randn(size(x));
N=53;
y = ones(1,N)./N;
xy=conv(xs,y,'same');
plot(t,xs,'g',t,xy,'r')
%%
close all; clear; clc;
%t=<0,10> , Fs=100
%x: trojk, sr=4, amp=1, szer=3
% x dodac rozklad noramlny N(0,0.2);
%y: trojk, o dlugosci N=2*k, i ampl=1/N
%splot, wyswietlic x i xy(splot)
Fs=100;
t = 0:(1/Fs):10;
%x = 2*(abs(t-5)<=2);
x=(1-abs(t-4)/1.5).*(abs(t-4)<=1.5); % tak się robi trójąt
xs = x + 0.2*randn(size(x));
N=53;
y = ones(1,N)./N
xy=conv(xs,y,'same');
plot(t,xs,'g',t,xy,'r')
%%
close all; clear; clc;
% liczenie splotu!!
conv([3 0 -1 2], [2 4 3])

% liczenie splotu!!
xcorr([3 0 -1 2], [2 4 3])

