clear all; close all; clc

x=3.1416
y=3.141592653589793238462643383279502884197
z=pi

m=3.1415926535897
n=3.14159265358979
o=3.141592653589793



b1=x-z
b2=y-z


b3=m-z
b4=n-z
b5=o-z
%%
clear all; close all; clc

x=(0:0.1:5);

y=sin(x)
T1=x;
T2=T1-x.^3/factorial(3);
T3=T2+x.^5/factorial(5);
T4=T3-x.^7/factorial(7);

hold on
plot(x,y,'r')
plot(x,T1,'b')
plot(x,T2,'g')
plot(x,T3,'y')
plot(x,T4,'k')
hold off

xlabel("x-axis")
ylabel("y-axis")
title("Sin(x) and Taylor approximations of Sin(x)")
legend('y','T1','T2','T3','T4','location','northwest')






