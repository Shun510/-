% Q5_1_1
%

clear all; close all

x = [0:pi/20:2*pi]

y = sin(x)

figure(1);
plot(y)
hold on;

y1 = sin(2*x) / 2; 

plot(y1, 'r')

return