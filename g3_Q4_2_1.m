%Q4.2.1
clear all ; close all

[xx,fs] = wavread('aiueok_fem1.wav');

len = length(xx);

otosta = xx(fs:len/2);

otoend = xx(len/2:len);

wavplay(otosta,fs)
zz=zeros(fs,1);
wavplay(otoend,fs)
return 