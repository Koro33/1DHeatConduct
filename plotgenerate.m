%% h
h1 = 10; % h��ʼֵ
h2 = 10000; % h��ֵֹ
h0 = 10; % h���
hn = (h2-h1)/h0 + 1; % h�ĸ���

h = h1:h0:h2; % ����hö������

%% �Աȱں�

% plot(h,diff011);
hold on;
plot(h,diff021);
hold on;
plot(h,diff031);
plot(h,diff041);
plot(h,diff051);

%% �ԱȲ���

plot(h,diff031);
hold on;
plot(h,diff131);
plot(h,diff231);


%% �Ա�����

plot(h,diff030);
hold on;
plot(h,diff031);
plot(h,diff032);