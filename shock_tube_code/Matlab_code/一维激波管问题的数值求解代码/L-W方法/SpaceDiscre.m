function dF = SpaceDiscre(U,dt,dx,x)
%FVS�����Ŀռ���ɢ
global gamma;

%���ȼ���ͨ�����ԳƸ�ʽ����Ҫ����ͨ������
[rho,u,p] = conservation_to_physics(U);
E = p/(gamma-1) + 0.5*rho.*u.^2;
%����ֵ
if ( sum(p./rho <= 0) > 0 )
    [p;rho]
    error('���ָ���');
end
c = sqrt(gamma*p./rho);
lambda = max(max(abs(u)+c));
%ͨ��
F = [rho.*u; rho.*u.^2+p; (E+p).*u];
% F_posi = 0.5*(F+lambda*U);
% F_nega = 0.5*(F-lambda*U);

%��������ͨ����ӭ����
dF = FluxDiffLax_W(U,F,dx,dt);

end

