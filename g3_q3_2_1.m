clear all : close all

x= -10:10;

y = x .* x

plot(x,y,'r.');
hold on;
y= x.*x +10;
plot(x,y,'b.');
legend('x‚Ì‚Qæ{10','x‚Ì2æ')

return