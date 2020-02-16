n=-10:10;
imp1=n==0;
imp2=n==1;
imp3=n==2;
a=input('alpha:\n');
b=input('beta:\n');
c=input('gama:\n');
w=0:(pi/180):pi;
h=[a b c];
H=freqz(h);
plot(abs(H))
% 