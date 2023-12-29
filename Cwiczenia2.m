close all; clear; clc;
%sygnal prostokątny
Fs = 100;
t = 0:(1/Fs):8;
x = 3*(t>=2 & t<=6);
plot(t,x);
xlabel("Czas[s]");
ylabel("amplituda");
ylim([-0.5,3.5]);
mean(x)
sum(x.^2)/Fs % liczona enaergia/ poczielona przez czestotliwaosc 
x*x'/Fs
%%
close all; clear; clc;
%sygnal trójkątny !!!
Fs = 100;
t = -5:(1/Fs):5;
x = 2*(1-abs(t)/3).*(abs(t)<3);
plot(t,x);
xlabel("Czas[s]");
ylabel("amplituda");
mean(x)
%%
close all; clear; clc;
%sygnal dyskretny !!!
%wykres sinusa
Fs = 100;
t = -5:(1/Fs):10;
amp = -t/15+8/3;
sin1 = sin(2*pi*t/0.5);
x  = (8/3 - t/15).*sin1;
plot(t,x)
x = sinc(t)
plot(t,x)
%%
close all; clear; clc;
%sygnal dyskretny !!!
%funkcja SZAA
Fs = 100;
t = -5:(1/Fs):10;
x = (mod(t,0.73)==0)
plot(t,x)
%%
close all; clear; clc;
%sygnal Krzywa Gaussa !!!
Fs = 100;
amp = pi, sr=2, odch = 1.5
t = -5:(1/Fs):10;
x = pi*exp(-(t-2).*(t-2)/(2*1.5*1.5));
plot(t,x)
%%
close all; clear; clc;
%sygnal prostokątny
Fs = 100;
t = -10:(1/Fs):10;
x = 2*(t>=-2 & t<=4);
plot(t,x);
xlabel("Czas[s]");
ylabel("amplituda");
ylim([-0.5,3.5]);
mean(x)
sum(x.^2)/Fs % liczona enaergia/ poczielona przez czestotliwaosc 
x*x'/Fs