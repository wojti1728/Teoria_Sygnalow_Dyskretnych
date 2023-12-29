close all; clear; clc;

a = [5; 6; 9; 0]
b = (1: 4)
% a*b
c = [1:5 3,7]
c(1)
size(c)
c(8) = 10
c(10)=10

close all; clear; clc;

A=zeros(4,5)

ones(3) % ones(3,3)

eye(3,4)

B=-0.5+3.5*rand(5)
B(2,:)
B(:,3)
B(1:2:5,2:2:5)
B(1:2:5,5:-2:1)
B([1,1:2],:)
B(:) % zamenia tablice na pionowy wektor
sum(B)
sum(sum(B))
sum(B(:))
median(median(B));
median(B(:)); % bardzije uniwersalny, bezpieczniejszy
sum(B')'
c = B(1,:);
d = B(2,:);

c.*d;
%%
close all; clear; clc;
t = 0:0.01:5;
x=sin(2*pi*t);
y=cos(pi*t);
%plot(t,x,'g-o','MarkerSize',5,'LineWidth',2); hold on % dwa wykresy na jednym !!!
%plot(t,y)
%hold off
plot(t,x,'r',t,y,'ok');
% dwa lub wiecej wykreswo na jednej figurze/oknie
subplot(2,3,1),
plot(t,x,'r',t,y,'ok');
subplot(2,3,[4,5]), plot(t,x);
subplot(2,3,[3 6]), plot(t,y)
%%
close all; clear; clc;
t = -2:0.1:5;
x = log10(t+5);
y = (1+sqrt(t.^2+3))./(2*t+5);
z = 1+0.5*randn(1,15000);
subplot(222), plot(t,x,'.k','MarkerSize',4);
subplot(224),  plot(t,y,'b','LineWidth',2);
subplot(2,2,[1 3]), hist(z)

%%
close all; clear; clc;
a=5;
b=4;
if isequal(a,b)
    a
else
    b
end
for k=1:10
    k
end
c = [1:5,7]
for k=c
    k
end

while k<inf
    k=k+1
end
%%
close all; clear; clc;
A = -1+2*rand(25)
suma = 0
for k=2:25
    suma  = suma +sum(A(k,(27-k):25));
end
suma