%Q4.1.1
clear all ; close all

[xx,fs]= wavread('aiueok_fem1.wav');

len = length(xx)

t = xx(fs)

data = xx(1:50)

wavplay(xx,fs,'sync')

return
