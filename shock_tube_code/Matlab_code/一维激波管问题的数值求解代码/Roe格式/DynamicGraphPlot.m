%��̬ͼ��ͼ
[rho,vel,pre] = conservation_to_physics(U);

if (mod(i,10)==0) 
    %���㵱ǰʱ���µĽ�����
    [rho_exact,u_exact,p_exact] = ...
             EulerExact(rho0(1),u0(1),p0(1),rho0(end),u0(end),p0(end),x,i*dt);
    E_exact = p_exact./((gamma-1)*rho_exact)+0.5*u_exact.^2;

    %��ͼ
    figure(2);
    subplot(2,2,1);
    plot(x,rho,'b',x,rho_exact,'r');
    title('�ܶ�');
    subplot(2,2,2);
    plot(x,vel,'b',x,u_exact,'r');
    title('�ٶ�');
    subplot(2,2,3);
    plot(x,pre,'b',x,p_exact,'r');
    title('ѹ��'); 

    xlabel(strcat('time = ',num2str(dt*i)));
    pause(0.01);
end
