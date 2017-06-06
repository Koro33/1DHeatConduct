function diff = phasediff(h)
a = 95.54*10^(-7); % ����ϵ��
lambda = 36; % ����ϵ��
% h = 100; % ��������ϵ��

DM = 0.02; % �ں�
DN = 20; % �ں�ȷֽڵ������ܽڵ���=��DN+1��
dx = DM/DN; % �ں�ȷּ��

tM = 60000; % ������ֹʱ��
tN = 20000; % ʱ��ȷֽڵ���
dt = tM/tN; % ʱ����

tc = 30; % ��������

q0 = @(t) 10000*(sin(2*pi/tc*t)+1); % �������

T0 = 20*ones(1,DN+1)'; % �ڳ�ʼ�¶�
Tf = 20; % �Ҳ��������¶�

Bi = h*dx/lambda; % ��ɢBi��
Fo = a*dt/(dx)^2; % ��ɢFo��

% ���ں�
D_max = 0.733*sqrt(4*pi*a*tc);
if DM > D_max
    error('too dick!')
end

% ����A����
A = (2+2*Fo)*eye(DN+1)+... % ���Խ���
    diag(-Fo*ones(1,DN),1)+... % ���Խ���+1λ��
    diag(-Fo*ones(1,DN),-1);   % ���Խ���-1λ��

A(1,1) = 2+Fo; A(1,2) = -Fo; % ��߽���������һ��Ϊ����ֵ
A(DN+1,DN) = -Fo; A(DN+1,DN+1) = 1+Fo*(1+Bi); % �ұ߽����������һ��Ϊ����ֵ

% ����b���� b=b1*T+b2
b1 = (2-2*Fo)*eye(DN+1)+... % ���Խ���
    diag(Fo*ones(1,DN),1)+... % ���Խ���+1λ��
    diag(Fo*ones(1,DN),-1);   % ���Խ���-1λ��
b1(1,1) = 2-Fo; b1(1,2) = Fo; % ��߽���������һ��Ϊ����ֵ
b1(DN+1,DN) = Fo; b1(DN+1,DN+1) = 1-Fo*(1+Bi); % �ұ߽����������һ��Ϊ����ֵ

b2 = zeros(DN+1,1);
b2(1,1) = Fo*dx/lambda*(q0(0)+q0(1*dt));
b2(DN+1,1) = Fo*Bi*(Tf+Tf);

b = b1*T0+b2; % װ���¶ȳ�ֵ

TT = zeros(DN+1,tN+1); % �¶ȼ�¼�����
TT(:,1) = b;

for t=1:(tN+1)
    % ����b����
    T = A^(-1)*b; % ����
    b2(1,1) = Fo*dx/lambda*(q0(t*dt)+q0((t+1)*dt));
    b2(DN+1,1) = Fo*Bi*(Tf+Tf);
    b = b1*T+b2;
    TT(:,t) = T; % ��¼
end

% ����Է��������λ��,ȡ����������ڵĽڵ���floor(3*tc/dt)
TT_sample = TT(1,(tN-floor(3*tc/dt)):(tN+1)); 
q0_sample = q0(dt*(tN-floor(3*tc/dt)):dt:dt*(tN+1))/10000;

Ix=sum(TT_sample.^2)/(floor(3*tc/dt)+2);
Iy=sum(q0_sample.^2)/(floor(3*tc/dt)+2);
Ixy=sum(TT_sample.*q0_sample)/(floor(3*tc/dt)+2);

diff=180*acos(Ixy/(Ix*Iy)^0.5)/pi;

end






