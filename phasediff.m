function diff = phasediff(h)
a = 95.54*10^(-7); % 导温系数
lambda = 36; % 导热系数
% h = 100; % 对流换热系数

DM = 0.02; % 壁厚
DN = 20; % 壁厚等分节点数，总节点数=（DN+1）
dx = DM/DN; % 壁厚等分间隔

tM = 60000; % 计算终止时间
tN = 20000; % 时间等分节点数
dt = tM/tN; % 时间间隔

tc = 30; % 热流周期

q0 = @(t) 10000*(sin(2*pi/tc*t)+1); % 左侧热流

T0 = 20*ones(1,DN+1)'; % 壁初始温度
Tf = 20; % 右侧面流体温度

Bi = h*dx/lambda; % 离散Bi数
Fo = a*dt/(dx)^2; % 离散Fo数

% 检查壁厚
D_max = 0.733*sqrt(4*pi*a*tc);
if DM > D_max
    error('too dick!')
end

% 构成A矩阵
A = (2+2*Fo)*eye(DN+1)+... % 主对角线
    diag(-Fo*ones(1,DN),1)+... % 主对角线+1位置
    diag(-Fo*ones(1,DN),-1);   % 主对角线-1位置

A(1,1) = 2+Fo; A(1,2) = -Fo; % 左边界条件，第一行为特殊值
A(DN+1,DN) = -Fo; A(DN+1,DN+1) = 1+Fo*(1+Bi); % 右边界条件，最后一行为特殊值

% 构成b矩阵 b=b1*T+b2
b1 = (2-2*Fo)*eye(DN+1)+... % 主对角线
    diag(Fo*ones(1,DN),1)+... % 主对角线+1位置
    diag(Fo*ones(1,DN),-1);   % 主对角线-1位置
b1(1,1) = 2-Fo; b1(1,2) = Fo; % 左边界条件，第一行为特殊值
b1(DN+1,DN) = Fo; b1(DN+1,DN+1) = 1-Fo*(1+Bi); % 右边界条件，最后一行为特殊值

b2 = zeros(DN+1,1);
b2(1,1) = Fo*dx/lambda*(q0(0)+q0(1*dt));
b2(DN+1,1) = Fo*Bi*(Tf+Tf);

b = b1*T0+b2; % 装载温度初值

TT = zeros(DN+1,tN+1); % 温度记录矩阵表
TT(:,1) = b;

for t=1:(tN+1)
    % 构成b矩阵
    T = A^(-1)*b; % 解算
    b2(1,1) = Fo*dx/lambda*(q0(t*dt)+q0((t+1)*dt));
    b2(DN+1,1) = Fo*Bi*(Tf+Tf);
    b = b1*T+b2;
    TT(:,t) = T; % 记录
end

% 相关性分析检测相位差,取最后三个周期的节点数floor(3*tc/dt)
TT_sample = TT(1,(tN-floor(3*tc/dt)):(tN+1)); 
q0_sample = q0(dt*(tN-floor(3*tc/dt)):dt:dt*(tN+1))/10000;

Ix=sum(TT_sample.^2)/(floor(3*tc/dt)+2);
Iy=sum(q0_sample.^2)/(floor(3*tc/dt)+2);
Ixy=sum(TT_sample.*q0_sample)/(floor(3*tc/dt)+2);

diff=180*acos(Ixy/(Ix*Iy)^0.5)/pi;

end






