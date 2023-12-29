%%
close all; clear, clc;

Fs=100;
t=0:(1/Fs):12;
%x1=1.1*sin(2*pi*t*15).*(t>=0 & t<4);
%x2=0.8*sin(2*pi*t*21).*(t>=4 & t<=8); % funkcja prostokatna
%x3=1.5*sin(2*pi*t*11).*(t>8); 
%x=x1+x2+x3;

%x=sin(2*pi*(7-t/4).*t); % musimy podzielic przez 4 a nie przez 2 poniewaz pochodna z t^2 wycjdzi 2t
x=sin(2*pi*(1+t/4).*t);

subplot(211), plot(t,x,'b')

XT=fftshift(fft(x)); % przesuniecie transformaty
WA = abs(XT); % widmo amplitudowe %%% dzielimy przez Fs poniewaz wykres za maly
f = linspace(-Fs/2,Fs/2,length(t)); % pomocnicza czestotliwosc

subplot(212), plot(f,WA,'b'); % wykresp podobny do sinca

% na widamie fazowym jestesmy w stanie okresli ktora czestotliwosc jest
% ktora

% liczymy cos dzikiego teraz

% zienna okno=128
% tablica dlugosc sygnaly minus szerokosc okna
% pobieramy probki od k=0:1
okno = 512; % modyfikujemy te okno by móc zrobic jak najlepsza czestotliwosciowa
% im wiecej to gorsza czestotliwosciowa czasowa
N=length(t); % w tym przypadku bierzemy dlugosc czasu 't'
A=zeros(okno, N-okno);

% do wyswietalnia imagesc() 

for k=1:N-okno
    xx = x(k:k+okno-1).*blackman(okno)'; % albo tukeywin(okno) % seosujemy okienkowanie aby wygladzic sygnal
    WAa = abs(fftshift(fft(xx)))';
    A(:,k)=WAa;
end

figure;
%imagsc(A); colorbar('vertical')

ff=linspace(-Fs/2,Fs/2,okno);
tt=(0:N-okno-1)/Fs;
imagesc(tt,ff,A); colorbar('vertical');
xlabel("Przesuniecie okna [s]");
ylabel("Czesttliwosc [Hz]");

%szerokosc w hercach 100/127 ~~0.8Hz
%SZEROKOSC w czasie ok 1s
% rozdzielczosc czasowa (szerokosc skoku w czasie)

% Rozwiazaniem dla tego miala byc transformata FALKOWA
% polega na wykorzystaniu falek 
% falka (pole=1, śr=0)

%%
[C,L]=wavedec(x,3,'bior3.3'); % dekompozycja
A3=C(1:L(1));
D3=C(L(1)+1:L(1)+L(2));
D2=C(L(2)+L(1)+1:L(1)+1:L(1)+L(2)+L(3));
D1=C(L(3) + L(2) + L(1) +1:L(1)+L(2)+L(3)+L(4));

subplot(411)

