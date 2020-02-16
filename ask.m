function ASK_FSK_PSK(msglen)
n=msglen;
b=randi(1,n);
f1=1;f2=2;
t=0:1/30:1-1/30;
%ASK
sa1=sin(2*pi*f1*t);
E1=sum(sa1.^2);
sa1=sa1/sqrt(E1); %unit energy 
sa0=0*sin(2*pi*f1*t);
%FSK
sf0=sin(2*pi*f1*t);
E=sum(sf0.^2);
sf0=sf0/sqrt(E);
sf1=sin(2*pi*f2*t);
E=sum(sf1.^2);
sf1=sf1/sqrt(E);
%PSK
sp0=-sin(2*pi*f1*t)/sqrt(E1);
sp1=sin(2*pi*f1*t)/sqrt(E1);
%MODULATION
ask=[];psk=[];fsk=[];
for i=1:n
    if b(i)==1
        ask=[ask sa1];
        psk=[psk sp1];
        fsk=[fsk sf1];
    else
        ask=[ask sa0];
        psk=[psk sp0];
        fsk=[fsk sf0];
    end
end
figure(1)
subplot(411)
stairs(0:10,[b(1:10) b(10)],'linewidth',1.5)
axis([0 10 -0.5 1.5])
title('Message Bits');grid on
subplot(412)
tb=0:1/30:10-1/30;
plot(tb, ask(1:10*30),'b','linewidth',1.5)
title('ASK Modulation');grid on
subplot(413)
plot(tb, fsk(1:10*30),'r','linewidth',1.5)
title('FSK Modulation');grid on
subplot(414)
plot(tb, psk(1:10*30),'k','linewidth',1.5)
title('PSK Modulation');grid on
xlabel('Time');ylabel('Amplitude')
