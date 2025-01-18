clear all; close all; clc
%Part B-i Contour Plot
x = linspace(-2 * pi, 2 * pi);
y = linspace(-2 * pi, 2 * pi);
[X,Y] = meshgrid(x, y);

Z = f(X, Y);  

f_vector=@(v)(sin(v(1)) .* exp((1 - cos(v(2))).^2) + cos(v(2)) .* exp((1 - sin(v(1))).^ 2) + (v(1) - v(2)).^2); 
minxandy= fminsearch(f_vector, [-1, -2]);
z=f_vector(minxandy);


levels = linspace(1,160,20) 
hold on 
contour(X, Y, Z, levels, 'Showtext', 'on') 
plot3(minxandy(1),minxandy(2), z, 'o')
hold off
colormap('summer') 
str='minimum'
text(minxandy(1), minxandy(2), z, str)
xlabel('x')
ylabel('y')
title('contour plot')

%Part j-o Surface Plot 
hold on
surf(X, Y, Z, 'Edgecolor', 'interp')
plot3(minxandy(1),minxandy(2), z, 'o')
hold off
xlabel('x');
ylabel('y');
zlabel('z');
title('surface plot');
str = 'minimum'
text(minxandy(1), minxandy(2), z, str);
colormap('winter')
view(25, 35)


%Part A
function fxy = f(x, y)
    fxy = sin(x) .* exp((1 - cos(y)).^2) + cos(y) .* exp((1 - sin(x)).^ 2) + (x - y).^2; 
end