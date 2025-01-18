clear all; close all; clc
x = linspace(0, 10, 100);
y1 = 3 * sin(2 / 3 .* x);
y2 = (x - 3) .* (x - 2) .* (x - 8) / 10;
y3 = min(abs(x - 3), abs(x - 8));
hold on
plot(x, y1, 'r:', 'LineWidth', 4)
plot(x, y2, 'b', 'LineWidth', 2)
plot(x, y3, '--g', 'Linewidth', 3)
hold off