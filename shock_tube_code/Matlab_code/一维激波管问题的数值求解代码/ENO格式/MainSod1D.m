%���һά����������
%ENO��ʽ�������ʽ�еĹ⻬����Ӳ�δʹ����ԭʼ�ļ����
%last modified in 2019.5.25
clc; clear;
format long e;

%�����������
global N;
N = 1601;
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
U_last = physics_to_conservation(rho0,u0,p0);
for i = 1:Tnumber
    
    %Roe��ʽ�ǿռ���ɢ��ʽ��ʱ����ɢ����ʹ������RK3��ʽ
    U_last = BC(U_last,3);
    U1 = U_last(:,4:end-3) - dt*SpaceDiscre(U_last,dt,dx,x);
    U1 = BC(U1,3);
    U2 = 0.75*U_last(:,4:end-3) + 0.25*U1(:,4:end-3) - 0.25*dt*SpaceDiscre(U1,dt,dx,x);
    U2 = BC(U2,3);
    U = 1/3*U_last(:,4:end-3) + 2/3*U2(:,4:end-3) - 2/3*dt*SpaceDiscre(U2,dt,dx,x);

    %ά��ѭ������ͼ
    U_last = U;
    ResultPlot;
    pause(0.01);
end
cal_order;
