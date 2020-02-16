%%
%Amplitude modulation

Ac=2;      fc=300;
%mu=input('Enter Value of mu: ');      
%Am= mu*Ac;  
fm=25;

mt= @(t)sin(2*pi*fm*t);
ct= @(t)sin(2*pi*fc*t);
yt= @(t,mu)Ac*(1 + mu*mt(t)).*ct(t);

t=0:0.0001:0.1;
subplot(5,1,1)
plot( t,mt(t),'g' );
title('Message Signal: m(t)');
xlabel('time'); ylabel('Amplitude');

subplot(5,1,2)
plot( t,2*ct(t),'b' );
title('Career Signal: c(t)');
xlabel('time'); ylabel('Amplitude');

subplot(5,1,3)
plot( t,yt(t,0.5),'r' );
title('Amplitude Modulated Signal: y(t): mu=0.5');
xlabel('time'); ylabel('Amplitude');

subplot(5,1,4)
plot( t,yt(t,1),'r' );
title('Amplitude Modulated Signal: y(t): mu=1');
xlabel('time'); ylabel('Amplitude');

subplot(5,1,5)
plot( t,yt(t,1.5),'r' );
title('Amplitude Modulated Signal: y(t): mu=1.5');
xlabel('time'); ylabel('Amplitude');