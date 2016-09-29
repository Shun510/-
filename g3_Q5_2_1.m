% Q_5_2_1
%

clear all; close all

wnoise = randn([16000, 1]);
wnoise = wnoise / max(abs(wnoise));
x = wnoise(1:200);

figure(1)
plot(x)

fs =8000;
wavplay(wnoise, fs, 'sync')

return