%���һά����������
%last modified in 2019.5.24
clc; clear;
format long e;

%�����������
N = 1001;
T = 0.10;
x = linspace(0,1,N);
dx = x(2) - x(1);
dt = dx*0.1;
Tnumber = T/dt;

%�������
global gamma;
gamma = 1.4;

%����IC
[rho0,u0,p0] = Euler_IC(x,1);
E0 = p0./((gamma-1)*rho0)+0.5*u0.^2;  % �������ܶ�
a0 = sqrt(gamma*p0./rho0);            % ����

%��ʼ����
%����L-F��ʽΪ���ĶԳƸ�ʽ������Ҫ����ͨ������
U_last = physics_to_conservation(rho0,u0,p0);
for i = 1:Tnumber
    
    %�ȴ���߽磬Ȼ�����ռ���ɢ�������ʱ���ƽ�
    U_last = BC(U_last,1); %��ǰ����ʹ�����˱߽缴��
    dF = SpaceDiscre(U_last,dt,dx,x);
    U = 0.5*(U_last(:,1:end-2)+U_last(:,3:end))-dt*dF;
    
    %ά��ѭ������ͼ
    U_last = U;
    DynamicGraphPlot;
%     pause(0.01);
    
end
