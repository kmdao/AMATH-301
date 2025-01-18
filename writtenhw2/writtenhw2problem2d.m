clear all; close all; clc
r1=3.1;
A=P(15,1000,3.1,30)
P1000r1=A(1,end)
P999r1=A(1,end-1)

r2=3.2;
B=P(15,1000,3.2,30);
P1000r2=B(1,end);
P999r2=B(1,end-1);

r3=3.3;
C=P(15,1000,3.3,30);
P1000r3=C(1,end);
P999r3=C(1,end-1);

r4=3.4;
D=P(15,1000,3.4,30);
P1000r4=D(1,end);
P999r4=D(1,end-1);

r5=3.44;
E=P(15,1000,3.44,30);
P1000r5=E(1,end);
P999r5=E(1,end-1);

r=[3.1,3.2,3.3,3.4,3.44];
P1000=[P1000r1,P1000r2,P1000r3,P1000r4,P1000r5];
P999=[P999r1,P999r2,P999r3,P999r4,P999r5];

hold on
plot(r,P1000,'r')
plot(r,P999,'k')
xlabel('r')
ylabel('equilibrium_value')


legend('P(1000)','P(999)')
function pop=P(P0,T,r,K)
    pop=zeros(1,T+1);
    pop(1)=P0;
    for t=2:T+1
        pop(t)=r*pop(t-1)*(1-pop(t-1)/K);
    end
end