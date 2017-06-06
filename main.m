clear;
h1 = 10; % h开始值
h2 = 10000; % h终止值
h0 = 10; % h间隔
hn = (h2-h1)/h0 + 1; % h的个数

h = h1:h0:h2; % 生成h枚举向量
diff = zeros(1,hn); % 生成相位差diff储存向量

tic; % 生成剩余时间
diff(1,1) = phasediff(h(1));
fprintf('Simple cycle cost %f s\n',toc);
fprintf('Totally cost expected: %.1f min\n',toc*hn*0.6/60);

parfor i=1:hn % 无上下关系依赖，可以并行运算
    diff(1,i) = phasediff(h(i));
    fprintf('h = %d complete! diff = %.4f\n',h(i),diff(1,i));
end

plot(h,diff);

%% 
% diff011 材料钢1.5c  壁厚0.010  热流周期20s
% diff021 材料钢1.5c  壁厚0.015  热流周期20s
% diff031 材料钢1.5c  壁厚0.020  热流周期20s
% diff041 材料钢1.5c  壁厚0.025  热流周期20s
% diff051 材料钢1.5c  壁厚0.030  热流周期20s

% diff131 材料纯铜    壁厚0.020  热流周期20s
% diff231 材料镍铬钢  壁厚0.020  热流周期20s

% diff030 材料钢1.5c  壁厚0.020  热流周期10s
% diff032 材料钢1.5c  壁厚0.020  热流周期30s






