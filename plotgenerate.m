%% h
h1 = 10; % h开始值
h2 = 10000; % h终止值
h0 = 10; % h间隔
hn = (h2-h1)/h0 + 1; % h的个数

h = h1:h0:h2; % 生成h枚举向量

%% 对比壁厚

% plot(h,diff011);
hold on;
plot(h,diff021);
hold on;
plot(h,diff031);
plot(h,diff041);
plot(h,diff051);

%% 对比材料

plot(h,diff031);
hold on;
plot(h,diff131);
plot(h,diff231);


%% 对比周期

plot(h,diff030);
hold on;
plot(h,diff031);
plot(h,diff032);