clear all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% %G(s)=K/(s+5)
% % D(s)=(s +5) +K=0  %  [s/5 K+1] =0;
% hold on,
% for K=0:.05:10
%     y=roots([1/5 1+K]);
%     y1=y(1,:);
%     plot(real(y1),imag(y1),'*','color',[0,0,1]);
%      pause(0.05)
%   end




%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%



% 
% G(s)=K(s + 1)/(s + 5) 
% hold on,
% for K=0:.1:20
%     y=roots([1+K 5+K]);
%     y1=y(1,:);
%     plot(real(y1),imag(y1),'*','color',[0,0,1]);
%      pause(0.05)
% end
%   


% 
% % %%%%%%%%%%%%%%%%%
% % %%%%%%%%%%%%%%%%%%%%%%%%%
%G(s)=K/(s + 5)(s +2) 
% hold on,
% for K=0:.01:5
%     y=roots([(1/10) (1/5 + 1/2) 1+K]);
%     y1=y(1,:);
%     y2=y(2,:);
%     plot(real(y1),imag(y1),'*','color',[0,0,1]);
%      plot(real(y2),imag(y2),'*','color',[1,0,0])
%      pause(0.1)
%   end
% 




%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
% s^2/10 + s2/10 + (1+K)=0
hold on,
for K=0:.1:5
    y=roots([(1/10) 2/10 1+K]);
    y1=y(1,:);
    y2=y(2,:);
    plot(real(y1),imag(y1),'*','color',[0,0,1]);
     plot(real(y2),imag(y2),'*','color',[1,0,0])
     pause(0.1)
  end


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % G(s)=K/s(s^2+ 3s + 2) 
% hold on,
% for K=0:.01:10
%     y=roots([1 3 2 K]);
%     y1=y(1,:);
%     y2=y(2,:);
%     y3=y(3,:);
%     plot(real(y1),imag(y1),'*','color',[0,0,1]);
%      plot(real(y2),imag(y2),'*','color',[1,0,0])
%      plot(real(y3),imag(y3),'*','color',[0,1,1])
%      pause(0.05)
%  end


  


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% % G(s)=K/s(s+3)(s^2 +2s +2)
% hold on,
% % axis(-100, 100, -100, 100);
%   %y=zeros(2,100);
% for K=0:.2:20
%     y=roots([1 5 8 6  K]);
%     y1=y(1,:);
%     y2=y(2,:);
%     y3=y(3,:);
%     y4=y(4,:);
%     plot(real(y1),imag(y1),'*');
%      plot(real(y2),imag(y2),'*')
%      plot(real(y3),imag(y3),'*')
%      plot(real(y4),imag(y4),'*')
%      pause(0.5)
%  end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% hold on,
% % G(s)=K(s+2)/(s^2 +2s +2)
% %K varies from zero to infinity
% for K=0:.05:20
%     % calculate roots of the syste,
%     y=roots([1 2+K 2*K+2]);
%     %since this is a second order system there will be two roots and the
%     %roots are stored in column of the matrix.
%     y1=y(1,:);
%     y2=y(2,:);
%     %plot the real vs imaginory component of each root.
%     plot(real(y1),imag(y1),'*','color',[0,0,1]);
%      plot(real(y2),imag(y2),'*','color',[1,0,0])
%      pause(0.5)
%  end