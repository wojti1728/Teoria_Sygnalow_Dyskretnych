%%
close all; clear; clc;
%zadanie 1 - fugura na plasczyznie

Fs=100;
t=-3:(1/Fs):3; %%-||-
x=2*t.*(t>=0 & t<2) + 4*(t>=2 & t<=3);
XT=(4/3)*ones(size(t)); 
for n=1:100  % modyfikujemy n by zobaczyc co sie dzieje
    an=6*(cos(2*n*pi/3)-1)/(n*n*pi*pi);
    bn=6*sin(2*n*pi/3)/(n*n*pi*pi)-4*cos(n*pi)/(n*pi);
    XT=XT+an*cos(n*pi*t/3) + bn*sin(n*pi*t/3);
end 
plot(t,x,'.g',t,XT,'k')

%%
close all; clear; clc;
%zadanie 2 - fugura na plasczyznie
Fs=100;
t=-4:(1/Fs):4; %%-||-
x=(-2-t).*(t<-2) +(1+sign(t)).*(abs(t)<=2) + (4-t).*(t>2);% nasz furier 
XT=ones(size(t)); 
for n=1:100  % modyfikujemy n by zobaczyc co sie dzieje
    bn=(2/(pi*n)*(1+cos(pi*n)+(4/(n*pi)*sin(pi*n/2))));
    XT=XT + bn*sin(n*pi*t/4);
end 
plot(t,x,'.g',t,XT,'k')
%%
close all; clear; clc;
%zadanie 3 - fugura na plasczyznie

Fs=100;
t=-1:(1/Fs):2; %%-||-
x=(1+3*t).*(t<0) + (-1).*(t>1) + (1-3*t).*(t>=0 & t<1);% nasz furier 
XT=(-2/3)*ones(size(t)); 
for n=1:60  % modyfikujemy n by zobaczyc co sie dzieje
    an=(9/(pi*pi*n*n))*(1-cos(2*pi*n/3))-(2/(n*pi))*sin(2*pi*n/3);
    XT=XT + an*cos(2*n*pi*t/3);
end 
plot(t,x,'.g',t,XT,'k')
%%
close all; clear; clc;
%zadanie 3 - fugura na plasczyznie (wersja z przesunieciem o wektor)
Fs=100;
t=-1:(1/Fs):2; %%-||-
x=(2+3*t).*(t<0) + (2-3*t).*(t>=0 & t<1);% nasz furier 
XT=(1/33)*ones(size(t)); 
for n=1:60  % modyfikujemy n by zobaczyc co sie dzieje
    an=(9/(pi*pi*n*n))*(1-cos(2*pi*n/3))-(2/(n*pi))*sin(2*pi*n/3);
    XT=XT + an*cos(2*n*pi*t/3);
end 
plot(t,x,'.g',t,XT,'k')