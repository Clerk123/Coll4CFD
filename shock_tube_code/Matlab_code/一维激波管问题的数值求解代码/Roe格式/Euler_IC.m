function [rho,u,p] = Euler_IC(x,IC)
%��������ĳ�ֵ
%case1: Jiang and Shu 1996 �����еļ���������
switch IC
    case 1
        fprintf('Case 1: Sods problem \n');
        x1 = x<=0.5;
        x2 = x>0.5;
        rho = 0.445*x1 + 0.5*x2;
        u   = 0.698*x1 + 0.0*x2;
        p   = 3.528*x1 + 0.571*x2;
        
end
        


end