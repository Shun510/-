%Q4.2.2
close all ; clear all

[x,fs] = wavread('aiueok_fem1.wav');

otosta = x(fs:2*fs);
otoend = x(2*fs:4*fs);

wavplay(otosta,fs)
zz = zeros(fs*2,2)
wavplay(otoend,fs)

return