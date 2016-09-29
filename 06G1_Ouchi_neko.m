% 曲の作成(音の合成)    猫ふんじゃった(フルートの音)
% 2005.6.29 Ouchi Yasutaka

clear all;                  % 変数の初期化

Fs = 16000;                 % サンプリング周波数
t = 0:1/Fs:0.3;             % 時間の定義(0.3秒)
x = 1/12:1/12:1;            % 1/12から１まで1/12刻みでxに代入(音と音の間隔)

f1 = 261.2; f2 = 261.2*2^(12/12);       % 261.2Hzをf1に、522.3Hzをf2にそれぞれ代入
w1 = 2*pi*t; w2 = 2*2*pi*t; w3 = 3*2*pi*t; w4 = 4*2*pi*t;   % ωt、2ωt、3ωt、4ωtをそれぞれw1、w2、w3、w4に代入(ただしt=0.3)
w5 = 2*pi*t(1,[1:2400]); w6 = 2*2*pi*t(1,[1:2400]); w7 = 3*2*pi*t(1,[1:2400]); w8 = 4*2*pi*t(1,[1:2400]);    % ωt、2ωt、3ωt、4ωtをそれぞれw5、w6、w7、w8に代入(ただしt=0.15)

y = 0:1/400:1;              % 先頭部分の傾きのパラメータ
a = -0.003; k1 = 1:800;
e1 = exp(a.*k1);            % 波形減衰のパラメータ(0.05秒間)
b = -0.006; k2 = 1:400;
e2 = exp(b.*k2);            % 波形減衰のパラメータ(0.025秒間)

fdos = f1*2^x(1,1);         % ド#のωt
fres = f1*2^x(1,3);         % レ#のωt
ffas = f1*2^x(1,6);         % ファ#のωt
fras = f1*2^x(1,10);        % ラ#のωt
fsi = f1*2^x(1,11);         % シのωt
fdo2 = f2;                  % 1オクターブ高いドのωt
fdo2s = f2*2^x(1,1);        % 1オクターブ高いド#のωt
fre2s = f2*2^x(1,3);        % 1オクターブ高いレ#のωt
ffa2 = f2*2^x(1,5);         % 1オクターブ高いファのωt
ffa2s = f2*2^x(1,6);        % 1オクターブ高いファ#のωt

dos = sin(w1*fdos) + (1/3)*sin(w2*fdos) + (1/9)*sin(w3*fdos) + (1/30)*sin(w4*fdos);         % ド#の合成
res = sin(w1*fres) + (1/3)*sin(w2*fres) + (1/9)*sin(w3*fres) + (1/30)*sin(w4*fres);         % レ#の合成
fas = sin(w1*ffas) + (1/3)*sin(w2*ffas) + (1/9)*sin(w3*ffas) + (1/30)*sin(w4*ffas);         % ファ#の合成
ras = sin(w1*fras) + (1/3)*sin(w2*fras) + (1/9)*sin(w3*fras) + (1/30)*sin(w4*fras);         % ラ#の合成
si = sin(w1*fsi) + (1/3)*sin(w2*fsi) + (1/9)*sin(w3*fsi) + (1/30)*sin(w4*fsi);              % シの合成
do2 = sin(w1*fdo2) + (1/3)*sin(w2*fdo2) + (1/9)*sin(w3*fdo2) + (1/30)*sin(w4*fdo2);         % 1オクターブ高いドの合成
do2s = sin(w5*fdo2s) + (1/3)*sin(w6*fdo2s) + (1/9)*sin(w7*fdo2s) + (1/30)*sin(w8*fdo2s);    % 1オクターブ高いド#の合成
re2s = sin(w5*fre2s) + (1/3)*sin(w6*fre2s) + (1/9)*sin(w7*fre2s) + (1/30)*sin(w8*fre2s);    % 1オクターブ高いレ#の合成
fa2 = sin(w1*ffa2) + (1/3)*sin(w2*ffa2) + (1/9)*sin(w3*ffa2) + (1/30)*sin(w4*ffa2);         % 1オクターブ高いファの合成
fa2s = sin(w1*ffa2s) + (1/3)*sin(w2*ffa2s) + (1/9)*sin(w3*ffa2s) + (1/30)*sin(w4*ffa2s);    % 1オクターブ高いファ#の合成

wa1 = fa2s + ras;       % 和音、ファ#+ラ#の合成
wa2 = si + fa2;         % 和音、シ+ファの合成
dos = dos/max(abs(dos));    dos(1:401) = y.* dos(1:401);    dos(4002:4801) = e1.* dos(4002:4801);   % 最大値の調整と、傾きと減衰をつける加工
res = res/max(abs(res));    res(1:401) = y.* res(1:401);   res(4002:4801) = e1.* res(4002:4801);    %                   〃 
fas = fas/max(abs(fas));    fas(1:401) = y.* fas(1:401);   fas(4002:4801) = e1.* fas(4002:4801);    %                   〃   
do2 = do2/max(abs(do2));    do2(1:401) = y.* do2(1:401);   do2(4002:4801) = e1.* do2(4002:4801);    %                   〃
do2s = do2s/max(abs(do2s)); do2s(1:401) = y.* do2s(1:401); do2s(2001:2400) = e2.* do2s(2001:2400);  %                   〃
re2s = re2s/max(abs(re2s)); re2s(1:401) = y.* re2s(1:401); re2s(2001:2400) = e2.* re2s(2001:2400);  %                   〃
wa1 = wa1/max(abs(wa1));    wa1(1:401) = y.* wa1(1:401);   wa1(4002:4801) = e1.* wa1(4002:4801);    %                   〃
wa2 = wa2/max(abs(wa2));    wa2(1:401) = y.* wa2(1:401);   wa2(4002:4801) = e1.* wa2(4002:4801);    %                   〃

z1 = [re2s do2s fas wa1 wa1 re2s do2s fas wa1 wa1];     %曲の最初の部分をまとめる
z2 = [re2s do2s fas wa1 res wa1 dos wa2 wa2];           %曲の次の部分
z3 = [re2s do2s dos wa2 wa2 re2s do2s dos wa2 wa2];     %曲のその次の部分
z4 = [re2s do2s dos wa2 res wa2 fas wa1 wa1];           %曲の最後の部分
z = [z1 z2 z3 z4];                                      %曲のデータを一つの変数にまとめる

z = z/max(abs(z));
plot(z);
wavplay(z,Fs)                                           %曲の再生

return    % プログラムの終了