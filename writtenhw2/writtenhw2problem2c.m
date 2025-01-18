clear all; close all;clc

a=P(0,50,2.9,30);
b=P(15,50,2.9,30);
c=P(5,50,2.9,30);
d=P(10,50,2.9,30);
e=P(20,50,2.9,30);
f=P(25,50,2.9,30);
g=P(29,50,2.9,30);


t=0:50;
hold on
plot(t,a,'k','LineWidth',2)
plot(t,b,'b','LineWidth',2)
plot(t,c,'y','LineWidth',2)
plot(t,d,'m','LineWidth',2)
plot(t,e,'c','LineWidth',2)
plot(t,f,'r','LineWidth',2)
plot(t,g,'g','LineWidth',2)
hold off

xlabel('t')
ylabel('population')
legend('P(0)=0','P(0)=15','P(0)=5','P(0)=10','P(0)=20','P(0)=25','P(0)=29')



function pop=P(P0,T,r,K)
    pop=zeros(1,T+1);
    pop(1)=P0;
    for t=2:T+1
        pop(t)=r*pop(t-1)*(1-pop(t-1)/K);
    end
end