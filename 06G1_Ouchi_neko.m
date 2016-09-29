% �Ȃ̍쐬(���̍���)    �L�ӂ񂶂����(�t���[�g�̉�)
% 2005.6.29 Ouchi Yasutaka

clear all;                  % �ϐ��̏�����

Fs = 16000;                 % �T���v�����O���g��
t = 0:1/Fs:0.3;             % ���Ԃ̒�`(0.3�b)
x = 1/12:1/12:1;            % 1/12����P�܂�1/12���݂�x�ɑ��(���Ɖ��̊Ԋu)

f1 = 261.2; f2 = 261.2*2^(12/12);       % 261.2Hz��f1�ɁA522.3Hz��f2�ɂ��ꂼ����
w1 = 2*pi*t; w2 = 2*2*pi*t; w3 = 3*2*pi*t; w4 = 4*2*pi*t;   % ��t�A2��t�A3��t�A4��t�����ꂼ��w1�Aw2�Aw3�Aw4�ɑ��(������t=0.3)
w5 = 2*pi*t(1,[1:2400]); w6 = 2*2*pi*t(1,[1:2400]); w7 = 3*2*pi*t(1,[1:2400]); w8 = 4*2*pi*t(1,[1:2400]);    % ��t�A2��t�A3��t�A4��t�����ꂼ��w5�Aw6�Aw7�Aw8�ɑ��(������t=0.15)

y = 0:1/400:1;              % �擪�����̌X���̃p�����[�^
a = -0.003; k1 = 1:800;
e1 = exp(a.*k1);            % �g�`�����̃p�����[�^(0.05�b��)
b = -0.006; k2 = 1:400;
e2 = exp(b.*k2);            % �g�`�����̃p�����[�^(0.025�b��)

fdos = f1*2^x(1,1);         % �h#�̃�t
fres = f1*2^x(1,3);         % ��#�̃�t
ffas = f1*2^x(1,6);         % �t�@#�̃�t
fras = f1*2^x(1,10);        % ��#�̃�t
fsi = f1*2^x(1,11);         % �V�̃�t
fdo2 = f2;                  % 1�I�N�^�[�u�����h�̃�t
fdo2s = f2*2^x(1,1);        % 1�I�N�^�[�u�����h#�̃�t
fre2s = f2*2^x(1,3);        % 1�I�N�^�[�u������#�̃�t
ffa2 = f2*2^x(1,5);         % 1�I�N�^�[�u�����t�@�̃�t
ffa2s = f2*2^x(1,6);        % 1�I�N�^�[�u�����t�@#�̃�t

dos = sin(w1*fdos) + (1/3)*sin(w2*fdos) + (1/9)*sin(w3*fdos) + (1/30)*sin(w4*fdos);         % �h#�̍���
res = sin(w1*fres) + (1/3)*sin(w2*fres) + (1/9)*sin(w3*fres) + (1/30)*sin(w4*fres);         % ��#�̍���
fas = sin(w1*ffas) + (1/3)*sin(w2*ffas) + (1/9)*sin(w3*ffas) + (1/30)*sin(w4*ffas);         % �t�@#�̍���
ras = sin(w1*fras) + (1/3)*sin(w2*fras) + (1/9)*sin(w3*fras) + (1/30)*sin(w4*fras);         % ��#�̍���
si = sin(w1*fsi) + (1/3)*sin(w2*fsi) + (1/9)*sin(w3*fsi) + (1/30)*sin(w4*fsi);              % �V�̍���
do2 = sin(w1*fdo2) + (1/3)*sin(w2*fdo2) + (1/9)*sin(w3*fdo2) + (1/30)*sin(w4*fdo2);         % 1�I�N�^�[�u�����h�̍���
do2s = sin(w5*fdo2s) + (1/3)*sin(w6*fdo2s) + (1/9)*sin(w7*fdo2s) + (1/30)*sin(w8*fdo2s);    % 1�I�N�^�[�u�����h#�̍���
re2s = sin(w5*fre2s) + (1/3)*sin(w6*fre2s) + (1/9)*sin(w7*fre2s) + (1/30)*sin(w8*fre2s);    % 1�I�N�^�[�u������#�̍���
fa2 = sin(w1*ffa2) + (1/3)*sin(w2*ffa2) + (1/9)*sin(w3*ffa2) + (1/30)*sin(w4*ffa2);         % 1�I�N�^�[�u�����t�@�̍���
fa2s = sin(w1*ffa2s) + (1/3)*sin(w2*ffa2s) + (1/9)*sin(w3*ffa2s) + (1/30)*sin(w4*ffa2s);    % 1�I�N�^�[�u�����t�@#�̍���

wa1 = fa2s + ras;       % �a���A�t�@#+��#�̍���
wa2 = si + fa2;         % �a���A�V+�t�@�̍���
dos = dos/max(abs(dos));    dos(1:401) = y.* dos(1:401);    dos(4002:4801) = e1.* dos(4002:4801);   % �ő�l�̒����ƁA�X���ƌ�����������H
res = res/max(abs(res));    res(1:401) = y.* res(1:401);   res(4002:4801) = e1.* res(4002:4801);    %                   �V 
fas = fas/max(abs(fas));    fas(1:401) = y.* fas(1:401);   fas(4002:4801) = e1.* fas(4002:4801);    %                   �V   
do2 = do2/max(abs(do2));    do2(1:401) = y.* do2(1:401);   do2(4002:4801) = e1.* do2(4002:4801);    %                   �V
do2s = do2s/max(abs(do2s)); do2s(1:401) = y.* do2s(1:401); do2s(2001:2400) = e2.* do2s(2001:2400);  %                   �V
re2s = re2s/max(abs(re2s)); re2s(1:401) = y.* re2s(1:401); re2s(2001:2400) = e2.* re2s(2001:2400);  %                   �V
wa1 = wa1/max(abs(wa1));    wa1(1:401) = y.* wa1(1:401);   wa1(4002:4801) = e1.* wa1(4002:4801);    %                   �V
wa2 = wa2/max(abs(wa2));    wa2(1:401) = y.* wa2(1:401);   wa2(4002:4801) = e1.* wa2(4002:4801);    %                   �V

z1 = [re2s do2s fas wa1 wa1 re2s do2s fas wa1 wa1];     %�Ȃ̍ŏ��̕������܂Ƃ߂�
z2 = [re2s do2s fas wa1 res wa1 dos wa2 wa2];           %�Ȃ̎��̕���
z3 = [re2s do2s dos wa2 wa2 re2s do2s dos wa2 wa2];     %�Ȃ̂��̎��̕���
z4 = [re2s do2s dos wa2 res wa2 fas wa1 wa1];           %�Ȃ̍Ō�̕���
z = [z1 z2 z3 z4];                                      %�Ȃ̃f�[�^����̕ϐ��ɂ܂Ƃ߂�

z = z/max(abs(z));
plot(z);
wavplay(z,Fs)                                           %�Ȃ̍Đ�

return    % �v���O�����̏I��