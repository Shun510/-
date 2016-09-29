% Q_5_2_3
%îgå`ÇÃçáê¨(ÇÃÇ±Ç¨ÇËîg)

clear all; close all

nokogiri1 = [1:40];
nokogiri2 = [0.01:0.01:0.4];

for ii = 1:256
    nokogiri2 = [nokogiri2, [0.01:0.01:0.4]];
    nokogiri3 = nokogiri2; 
end

plot(nokogiri3)
axis([0 200 0 0.4])

fs = 8000
wavplay(nokogiri3, fs, 'sync')

return
   