%�@�z�񂘂ɁA-10�A-9�A�c�|�P,0,�P�c10�̒l��������
%�A�������O�Q�̊֌W�𖞂����z�񂙂��v�Z����B
%�B���������Ƃ��āAy�̃O���t��`���B
%�C�������O�Q�{�P�O�̃O���t��Ԃ����ŏd�˂���������B
%�D���ꂼ��̐��̐��������������Ď��s����B
%Q3.2.1

clear all ; close all

x = -10:10;
y = x .* x;

plot(x,y,'b');
hold on;
y = x .* x + 10;

plot(x,y,'r');

legend('x��2��','x�̂Q��{�P�O')

return