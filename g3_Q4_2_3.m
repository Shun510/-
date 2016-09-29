%Q4.2.3
clear all ; close all

[x,fs] = wavread('aiueok_fem1.wav');
len = length(x);
t = x(fs:len/3);

subplot(3,2,1)
plot(t);
axis([2000 2200 -0.5 0.5])
grid on
subplot(3,2,2)
plot(t);
axis([5500 5700 -0.5 0.5])
grid on
subplot(3,2,3)
plot(t);
axis([10000 10200 -0.5 0.5])
grid on
subplot(3,2,4)
plot(t);
axis([13000 13200 -0.5 0.5])
grid on
subplot(3,2,5)
plot(t);
axis([17000 17200 -0.5 0.5])
grid on

return