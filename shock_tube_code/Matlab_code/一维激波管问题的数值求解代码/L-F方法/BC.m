function U = BC(U,n)
%�߽紦��ĺ���
%U���غ�����n�������Ҹ����صĳ���

% %���ڱ߽�
% Uleft = U(:,end-n+1:end);
% Uright = U(:,1:n);
% U = [Uleft U Uright];

%���˱߽�
for i = 1:n
    U = [U(:,1) U U(:,end)];
end 

% %����߽�
% [rho,u,p] = conservation_to_physics(U);
% %�߽�ֱ�Ӹ�ֵ�Ĳ���
% u(1) = 0;      u(end) = 0;
% p(1) = p(2);   p(end-1) = p(end);
% %�����Ĳ���
% uleft = []; uright = [];
% pleft = []; pright = [];
% rholeft = []; rhoright = [];
% for i = 1:n
%     uleft = [-u(i+1) uleft];
%     uright = [uright -u(end-i)];
%    
%     pleft = [p(i+1) pleft];
%     pright = [pright p(end-i)];
%     
%     rholeft = [rho(i+1) rholeft];
%     rhoright = [rhoright rho(end-i)];    
% end
% u = [uleft u uright];
% p = [pleft p pright];
% rho = [rholeft rho rhoright];
% U = physics_to_conservation(rho,u,p);

end