x1 = [ 1 1 0 1 0 1 1 1 0 1];                                    % Binary Information
bp = 0.0001;                                                    % bit period
bit = []; 
for i=1:length(x1)
    if x1(i)==1;
       info1 = ones(1,50);
    else if x1(i)==0;
        info1 = zeros(1,50);
    end
     bit = [bit info1];

end
t1 = bp/100:bp/100:50*length(x1)*(bp/100);
subplot(6,2,1);
plot(t1,bit,'lineWidth',1.5); grid on;
ylim([-0.5 1.5]);
ylabel('amplitude(volt)');
xlabel(' time(sec)');
title('information as digital signal');


% Binary-ASK modulation 
A1 = 10;                      % Amplitude of carrier signal for information 1
A0 = 0;                       % Amplitude of carrier signal for information 0
bit_rate = 1/bp;              % bit rate
f = bit_rate*5;               % carrier frequency 
t2 = bp/100:bp/100:bp;                 
xx = length(t2);
m=[];
for (i=1:length(x1))
    if (x1(i)==1)
        n2 = A1*cos(2*pi*f*t2);
    else
        n2 = A0*cos(2*pi*f*t2);
    end
    m=[m n2];
end
t3 = bp/100:bp/100:bp*length(x1);
subplot(6,2,2);
plot(t3/2,m);
xlabel('time(sec)');
ylabel('amplitude(volt)');
title('waveform for binary ASK modulation coresponding binary information');


% PSK

x=[ 1 1 0 0 0 1 1 0 1 1 1 0 0 1];                          % Binary Information
bp=.0001;                                                  % bit period
bit=[]; 
for n=1:1:length(x)
    if x(n)==1;
       info1=ones(1,50);
    else x(n)==0;
        info1=zeros(1,50);
    end
     bit=[bit info1];

end
t1=bp/100:bp/100:50*length(x)*(bp/100);
subplot(6,2,3);
plot(t1,bit,'lineWidth',1.5);grid on;
ylim([-0.5 1.5]);
ylabel('amplitude(volt)');
xlabel(' time(sec)');
title('information');

A=4;                                          % Amplitude of carrier signal 
bit_rate1 = 1/bp;                             % bit rate
f = bit_rate1*2;                              % carrier frequency 
t2 = bp/100:bp/100:bp;                 
m=[];
for (i=1:1:length(x))
    if (x(i)==1)
        n2=A1*cos(2*pi*f*t2);
    else
        n2=A0*cos(2*pi*f*t2+pi); 
    end
    m=[m n2];
end
t3=bp/100:bp/100:bp*length(x);
subplot(6,2,4);
plot(t3/2,m);
xlabel('time(sec)');
ylabel('amplitude(volt)');
title('waveform for binary PSK modulation');

                                    
% QAM

M = 16;
k = log2(M);
n = 50000;
nps = 1; % number per sample

rng default
data = randi([0,1],n,1);
subplot(6,2,5);
stem(data([1:40]));
title('Random binary bits');
xlabel('Bit index');
ylabel('bits value');

four_bit_data = reshape(data , length(data)/k ,k); % creates 4 bit data for QAM
datanew = bi2de(four_bit_data);                    % converts 4 bit binary data to decimal value

subplot(6,2,6);
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
