% Q5_1_2
%

clear all; close all

fs = 8000;
t = [1:fs] / fs;

y500 = sin(2*pi*500*t);

plot(t, y500)
axis([0 0.02 -2 2])
hold on

wavplay(y500, fs, 'sync');

y500b = sin(2*pi*500*t) / 2;
plot(t, y500b, 'r')
axis([0 0.02 -2 2])

z = zeros(1, fs*0.5);
wavplay(z, fs)

wavplay(y500b, fs, 'sync')

return