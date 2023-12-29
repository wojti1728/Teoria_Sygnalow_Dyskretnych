% modelowanie parametryczne - staranie sie przewidziec co bedzie dalej sie
% dzialo z sygnalem. Klasteryzacja - idk
% modelowanie paraetryczne - dzielimy sygnal na dwie czesci. na jednej
% tworzymy model
%% 1
close all; clear; clc;
Fs=100;
t=0:1/Fs:10;
t=t'; %musimy miec dane kolumnowo zeby modele dzialaly

x=sin(2*pi.*t*10);
x=x+(1-0.05.*t).*sin(2*pi.*t*4)+t/10;
xs=x+0.2*randn(size(t));

%plot(t,x,'r',t,xs,'b');

N=800; %dlugosc zbioru uczacego
p=20;
q=3;
D=1; %1 bo dodalismy t/10 czyli liniowo, dla t.^2 D=2 itd
model=arima(p,D,q); %p D(trend), q(model sredniej ruchomej) zeby dzialalo musi byc econometrics zainstalowane

pres=xs(1:model.P); %presampler - pierwsze p probek sygnalu, p to samo co pozniej do predykcji
estym=xs(model.P+1:N); %na podstawie tego uczymy nasz model
przed=xs(N-model.P:N); %model do przewidywania; ostatnie p probek

mod_est=estimate(model,estym,'Y0',pres); %Y0-surowe nieprzetworzone dane

predykcja=forecast(mod_est,100,przed);
plot(t,x,'r',t(N:N+99),predykcja,'b');

%% 2
close all; clear;clc;
load Data_EquityIdx.mat
dane=DataTable.NASDAQ;
clear Data; clear dates; clear Description;
N=2500; %przewidziec 100 pierwszych danych 

p=20;
q=5;
D=1;
model=arima(p,D,q);

pres=dane(1:model.P); 
estym=dane(model.P+1:N); 
przed=dane(N-model.P:N); 

mod_est=estimate(model,estym,'Y0',pres); %Y0-surowe nieprzetworzone dane
predykcja=forecast(mod_est,100,przed);

probki=(1:length(dane))';

plot(probki,dane,'r',probki(N:N+99),predykcja,'b');


%% klasteryzacja - grupowanie danych na wykresie, na podstawie wspolnych zmiennych i szukanie zaleznosci miedzy nimi
% dwie metody - k-srednich i k-medoidow

%% metoda k-srednich
close all; clear; clc;
a=load('klaster1.txt');
subplot(121);
scatter(a(:,1),a(:,2),[],a(:,3),'filled'); %trzecia pozycja - wielkosci, 4- odizolowanie grup(do spr_, filled - zeby byly wypelnione

[grupa,C]=kmeans(a(:,1:2),4);

subplot(122);
scatter(a(:,1),a(:,2),[],grupa,'filled'); hold on;
plot(C(:,1),C(:,2),'xk','MarkerSize',20,'LineWidth',3);
hold off;

%% metoda k-medoidow (troche jak mediana, punkt ze zmiennych)
close all; clear; clc;
a=load('klaster1.txt');
subplot(121);
scatter(a(:,1),a(:,2),[],a(:,3),'filled');

[grupa,C]=kmedoids(a(:,1:2),4); %tylko to sie zmienilo jak cos

subplot(122);
scatter(a(:,1),a(:,2),[],grupa,'filled'); hold on;
plot(C(:,1),C(:,2),'xk','MarkerSize',20,'LineWidth',3);
hold off;

%% 
close all; clear; clc;
a=load('klaster1.txt');
subplot(121);
scatter(a(:,1),a(:,2),[],a(:,3),'filled');

subplot(122);
grupa=clusterdata(a(:,1:2),"MaxClust",4,'Distance','cityblock'); %cityblock-sprawdza odleglosc miedzy punktami A i B jako suma roznicy x i y
scatter(a(:,1),a(:,2),[],grupa,'filled'); hold on;
