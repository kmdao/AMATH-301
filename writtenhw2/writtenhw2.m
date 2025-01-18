%%
%Problem 1 
clear all; close all; clc

x1=0;
for i=1:25000000
    x1=x1+0.1;
    
end
x1


x2=0;
for i=1:12500000
    x2=x2+0.2;   
end
x2


x3=0;
for i=1:10000000
    x3=x3+0.25;   
end
x3


x4=0;
for i=1:5000000
    x4=x4+0.5;   
end
x4
%%
y1=abs(2500000-x1)
y2=abs(2500000-x2)
y3=abs(2500000-x3)
y4=abs(2500000-x4)

%%
%Problem 2a
a=P(0,1000,2,30);
b=P(15,1000,2,30);
t=0:1000;
plot(t,a,'k',t,b,'b')
xlabel('t')
ylabel('population')
legend('P(0)=0','P(0)=15')

function pop=P(P0,T,r,K)
    pop=zeros(1,T+1);
    pop(1)=P0;
    for t=2:T+1
        pop(t)=r*pop(t-1)*(1-pop(t-1)/K);
    end
end

%%
%Problem2b
a=P(0,1000,2,30);
b=P(15,1000,2,30);
c=P(5,1000,2,30);
d=P(10,1000,2,30);
e=P(20,1000,2,30);
f=P(25,1000,2,30);
g=P(29,1000,2,30);


t=0:1000;
hold on
plot(t,a,'k')
plot(t,b,'b')
plot(t,c,'c')
plot(t,d,'d')
plot(t,e,'y')
plot(t,f,'r')
plot(t,g,'p')
hold off

xlabel('t')
ylabel('population')
legend('P(0)=0','P(0)=15')

function pop=P(P0,T,r,K)
    pop=zeros(1,T+1);
    pop(1)=P0;
    for t=2:T+1
        pop(t)=r*pop(t-1)*(1-pop(t-1)/K);
    end
end