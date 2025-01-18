clear all; close all; clc; 
%Problem 1
A=[1 -2.3; 4.5 exp(2)];
B=[6 2 4 -3; pi 9 3.6 -2.1];
C=[3.7 -2.4 0; 4 1.8 -11.6; 2.3 -3.3 5.9];
x=[5; sin(4); -3];
y=[8 -6];
z=[3; 0; tan(2); -4.7];
A1=3*x
zT=z'
BT=B'
A2=zT*BT+y
A3=C*x
A4=A*B
A5=B.'*A.'

%%
%Problem 2

x=linspace(-4,1,73);
A6=x
y=cos(0:1:72);
A7=y
A8=A6.*A7
A9=A6./A7
A10=x.^3.-y

%%
%Problem 3
%part a P(0)=3 K=20 r=2.5 calculate P(3)

P=3;
K=20;
r=2.5;

for k=1:3
    P=r*P*(1-P/K);
end

A11=P


%%
%Part b P(0)=8 K=14 r=3.2 calculate P(4) 

P=8;
K=14;
r=3.2;

 for j=1:4
     P=r*P*(1-P/K);
 end 

A12=P

%%
%part c 

K=12;
r=2.6;
P=5;

for z=1:3
    P=P*exp(r*(1-P/K));
end

A13=P

%% 
%part d
P=2;
K=25;
r=3;

for g=1:4
     P=P*exp(r*(1-P/K));
end

A14=P
%%
%part e

P=0;
K=20;
r=3.1;

for h=1:500
    P=P*exp(r*(1-P/K));
end

A15=P
    
    


    
    







