clear all; close all; clc
x=-2:0.25:2;
y=2*x+3; 

figure()
hold on
plot (x,y,'k')
plot(x,y,'bo')
hold off

xlabel('x')
ylabel('y')
title('Plot of a line')

clear all; close all; clc

x=-2:0.25:2;
y=x.^2-1;

figure()
hold on
plot (x,y,'k')
plot(x,y,'bo')
hold off

xlabel('x')
ylabel('y')
title('Plot of a parabola')