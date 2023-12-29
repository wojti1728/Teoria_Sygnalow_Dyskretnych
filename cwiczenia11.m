%%
close all; clear; clc;

% Filtracja odszumiajaca

Fs=100;
t=0:(1/Fs):10;
%trojkat tw=3s, szer=2s, amp=2 + prost (sr=8s, szer=2, amp=1)
%x=2*(1-abs(t-3)).*(abs(t-3)<1)+1.0*(abs(t-8)<1);
x=sin(2*pi*t); % 
%xs=x+0.1*randn(size(x)); % N(0,0.1)  % to jest nasz szum którego (rozklad
% normalny
%musielismu wybrac najlepszy sposób na odszumienie
%xs=x+(-0.1+0.2*rand(size(x))); % R(-0.1,0.1) / szum z rozkladu
%rownomiernego

xs=rand(size(x));
xs=x+0.5*(xs<0.05)-0.5*(xs>0.95); % szum impulsowy, d=10%, amp=0.5 (silny
%szum impulsowy o duzej amplitydzie i 10% gęstości) / tutaj powinna wyjsc
%filtracja medianowa (w bardzo malym oknie)
 
ocena=@(x,xn)sqrt(sum((x-xn).^2)); % funkcja inline 
wyn=zeros(75,5); % liczba elementów (okolo 151/2 = 75)

k=1;
for N=3:2:151
    %N=7; % rozmiar naszego elementu (maski)
    LP=ones(1,N)/N; % jednorodna uśredniajaca // takze lepsza przy sinusach/cosinowsach
    N2=floor(N/2); % maska gausaa
    stdG=N2/4; % tym sterujemy
    LPG=exp(-(-N2:N2).^2/(2*stdG*stdG));
    LPG=LPG/sum(LPG(:)); % uśrednajaca Gaussa % filtracja Gaussa (lepsza przy sinusach/cosinusach)/z powodu ich gladkosci
    
    x1=conv(xs,LP,'same'); % splot
    x2=conv(xs,LPG,'same'); %  splot
    x3=medfilt1(xs,N); % filtracja mediana // lepsza przy funkcjach ksztaltu
    x4=wiener2(xs,[1, N]); % sygnal poziomy wienera % filtracja winiera /lepsza przy funkcjach krztałtach (prostokąty czy trójkąty)
    wyn(k,1)=N;
    wyn(k,2)=ocena(x,x1);
    wyn(k,3)=ocena(x,x2);
    wyn(k,4)=ocena(x,x3);
    wyn(k,5)=ocena(x,x4);
    k=k+1;
    % x4 = wiener2(x, [N,1]); % sygnal poziomy wienera
end
subplot(211), plot(t,x,'r',t,x1,'g',t,x2,'b');
subplot(212), plot(t,x,'r',t,x3,'g',t,x4,'b');

figure;
plot(wyn(:,1),wyn(:,2:5));
legend('avg','gauss','median','wiener')
%%
close all; clear; clc;

Fs=100;
t=0:(1/Fs):10;
%trojkat tw=3s, szer=2s, amp=2 + prost (sr=8s, szer=2, amp=1)
x=2*(1-abs(t-3)).*(abs(t-3)<1)+1.0*(abs(t-8)<1);
%x=sin(2*pi*t); % 
N=9;
x1=ordfilt2(x,1,ones(1,N));  %  filtr porzadku, dwuwymiarowy % ones(1,N) -maska
%x2=ordfilt2(x,ceil(N/2),ones(1,N)); 
x3=ordfilt2(x,N,ones(1,N));
x2=x3-x1;

x1=entropyfilt(x,ones(1,17)); % bardzo wazny dla obrazow (liczymy w duzych oknach)
%plot(t,x,'r',t,x1,'g')

%plot(t,x,'r',t,x1,'g',t,x2,'b',t,x3,'p')
x1=entropyfilt(x,ones(1,51));
plot(t,x,'r',t,x1,'g');
%%
close all; clear; clc;

%Zadanie w KOLOKWIUM !!

a=load('szum_201.txt');
a
t=a(:,1)'; %czasv(od razu wymieniamy na sygnal poziomy)
x=a(:,2)'; % sygna. niezaszumiony (tez zmienamy na poziomy " ' ")
xs=a(:,3)'; % sygnal zaszumiony (tez zmienamy na poziomy " ' ")
plot(t,x,'r',t,xs,'g');

ocena=@(x,xn)sqrt(sum((x-xn).^2)/length(x)); % funkcja inline, zwracamy uwagę na podany wzór aby 
% móc np tutaj podzielic sumę kwadratów przez dlugosc naszego "x" 
wyn=zeros(75,5); % liczba elementów (okolo 151/2 = 75)
k=1;
for N=3:2:151
    %N=7; % rozmiar naszego elementu (maski)
    LP=ones(1,N)/N; % jednorodna uśredniajaca
    N2=floor(N/2); % maska gausaa
    stdG=N2/4; % tym sterujemy
    LPG=exp(-(-N2:N2).^2/(2*stdG*stdG));
    LPG=LPG/sum(LPG(:)); % uśrednajaca Gaussa
    
    x1=conv(xs,LP,'same');
    x2=conv(xs,LPG,'same');
    x3=medfilt1(xs,N); 
    x4=wiener2(xs,[1, N]); % sygnal poziomy wienera
    x5=wiener2(medfilt1(wiener2(xs,[1 N]), N), [1 N]);
    wyn(k,1)=N;
    wyn(k,2)=ocena(x,x1);
    wyn(k,3)=ocena(x,x2);
    wyn(k,4)=ocena(x,x3);
    wyn(k,5)=ocena(x,x4);
    wyn(k,6)=ocena(x,x5);
    k=k+1;
end

figure;
plot(wyn(:,1),wyn(:,2:6)); % bierze skale N i rysuje kazdy z wykresow od 2-5 np wyn(k,3)
legend('avg','gauss','median','wiener','Nowa')

%odpowiedz
y=wiener2(xs,[1 9]); % dlaczego od 1-9 ???
y=medfilt1(y,9);
y=wiener2(y,[1 3]);

wynik=ocena(x,y) %% musi tak być !!

%%
close all; clear; clc;

Fs=100;
t=0:(1/Fs):12;

x=0.5*sin((pi/6)*t+pi/12) - 0.0023*t+1;

plot(t,x,'b');