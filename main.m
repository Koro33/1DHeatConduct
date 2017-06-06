clear;
h1 = 10; % h��ʼֵ
h2 = 10000; % h��ֵֹ
h0 = 10; % h���
hn = (h2-h1)/h0 + 1; % h�ĸ���

h = h1:h0:h2; % ����hö������
diff = zeros(1,hn); % ������λ��diff��������

tic; % ����ʣ��ʱ��
diff(1,1) = phasediff(h(1));
fprintf('Simple cycle cost %f s\n',toc);
fprintf('Totally cost expected: %.1f min\n',toc*hn*0.6/60);

parfor i=1:hn % �����¹�ϵ���������Բ�������
    diff(1,i) = phasediff(h(i));
    fprintf('h = %d complete! diff = %.4f\n',h(i),diff(1,i));
end

plot(h,diff);

%% 
% diff011 ���ϸ�1.5c  �ں�0.010  ��������20s
% diff021 ���ϸ�1.5c  �ں�0.015  ��������20s
% diff031 ���ϸ�1.5c  �ں�0.020  ��������20s
% diff041 ���ϸ�1.5c  �ں�0.025  ��������20s
% diff051 ���ϸ�1.5c  �ں�0.030  ��������20s

% diff131 ���ϴ�ͭ    �ں�0.020  ��������20s
% diff231 ����������  �ں�0.020  ��������20s

% diff030 ���ϸ�1.5c  �ں�0.020  ��������10s
% diff032 ���ϸ�1.5c  �ں�0.020  ��������30s






