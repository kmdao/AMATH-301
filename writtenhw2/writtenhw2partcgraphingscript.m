r1=1.1;
A=P(15,1000,1.1,30);
Eq1=A(1,end);

r2=1.5;
B=P(15,1000,1.5,30);
Eq2=B(1,end);

r3=2;
C=P(15,1000,2,30);
Eq3=C(1,end);

r4=2.5;
D=P(15,1000,2.5,30);
Eq4=D(1,end);

r5=2.9;
E=P(15,1000,2.9,30);
Eq5=E(1,end);

r=[1.1,1.5,2,2.5,2.9];
Equilibria=[Eq1,Eq2,Eq3,Eq4,Eq5];

plot(r,Equilibria,'k')
xlabel('r')
ylabel('equilibrium_value')

function pop=P(P0,T,r,K)
    pop=zeros(1,T+1);
    pop(1)=P0;
    for t=2:T+1
        pop(t)=r*pop(t-1)*(1-pop(t-1)/K);
    end
end