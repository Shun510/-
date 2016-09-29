%Q4.1.2
close all ; clear all

[x,fs]= wavread('aiueok_fem1.wav');

figure(1)
plot(x)

len= length(x);

t= fs * len;

figure(2)
plot(t,x)

return