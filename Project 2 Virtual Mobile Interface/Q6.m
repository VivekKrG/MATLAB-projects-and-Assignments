%%
%   Q6. Program to implement ASK, PSK And QAM
b=randi(0:1,1,10);
subplot(3,2,1);
n=length(b);
t=0:0.01:n;
x=1:(n+1)*100;

for i=1:n
  for j=i:.1:i+1
    a(x(i*100:(i+1)*100))=b(i);
  end
end
a=a(100:end);
plot(t,a,'r')
title("Random Generated Bit Pattern"); xlabel("n");ylabel("Bit value");
%%
s=a.*sin(2*pi*5*t);
subplot(3,2,2)
plot(t,s,'g')
title("ASK Plot"); xlabel("t");ylabel("Amplitude");
%%
%PSK
for i=1:n
  if b(i)==0
    p(i)=-1;
  else
    p(i)=1;
  end
  for j=i:.1:i+1
    ps(x(i*100:(i+1)*100))=p(i);
  end
end
ps=ps(100:end);
s=ps.*sin(2*pi*5*t);
subplot(3,2,3)
plot(t,s,'b')
title("PSK Plot"); xlabel("t");ylabel("Amplitude");
%%
%FSK
for i=1:n
  if b(i)==0
    p(i)=-1;
  else
    p(i)=1;
  end
  for j=i:.1:i+1
    f(x(i*100:(i+1)*100))=p(i);
  end
end
f=f(100:end);
s=sin(2*pi*7.5*t+(2*pi*2.5*t).*f);
subplot(3,2,4)
plot(t,s,'m')
title("FSK Plot"); xlabel("t");ylabel("Amplitude");
%%
M = 16;
k = log2(M);
n2 = 50000;
nps = 1; % number per sample

rng default
data = randi([0,1],n2,1);
subplot(3,2,5);
stem(data([1:40]));
title('Random binary bits');
xlabel('Bit index');
ylabel('bits value');

four_bit_data = reshape(data , length(data)/k ,k); % creates 4 bit data for QAM
datanew = bi2de(four_bit_data);                    % converts 4 bit binary data to decimal value

subplot(3,2,6);
stem(datanew([1:40]));
title('random value');
xlabel('index value');
ylabel('Integer value');

modulated_data = qammod(datanew , M ,'bin');
Eb = 10;
snr = Eb + 10*log10((k)/(nps));
recieved_signal = awgn(modulated_data , snr , 'measured');

newplot = scatterplot(recieved_signal,1,0,'b.');
hold on;
scatterplot(modulated_data,1,0,'k+',newplot);

