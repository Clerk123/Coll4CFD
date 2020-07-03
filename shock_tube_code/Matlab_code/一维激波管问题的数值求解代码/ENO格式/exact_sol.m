%���һά���������⾫ȷ��
clc; clear;
format long e;

%�����������
global N;
N = 3201;
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
%���㵱ǰʱ���µĽ�����
[rho_exact,u_exact,p_exact] = EulerExact(rho0(1),u0(1),p0(1),rho0(end),u0(end),p0(end),x,T);
E_exact = p_exact./((gamma-1)*rho_exact)+0.5*u_exact.^2;
p1 = plot(x,rho_exact,'b',x,u_exact,'r',x,p_exact,'black');set(p1,'linewidth', 3);
grid on;
legend('Density','Velocity','Pressure');
title(['Exact Solution:  t = ' num2str(T) ',N=' num2str(N-1)]);
drawnow;