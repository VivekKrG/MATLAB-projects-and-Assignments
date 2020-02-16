fprintf('Given function is:\n');
fprintf('y=1;x=(0,1)\ny=-1; x=(1,2)');
n=input('Enter number of harmonics:');
a0=0;
an=0;
x=0;
t=0:0.01*pi:10;
for i=1:2:n
    bn=2*( 1-(-1)^i )/(i*pi);
    %x=x+ a0+ an*cos(i*pi*t)+bn*sin(i*pi*t);
    x=x+bn*sin(i*pi*t);
end
plot(t,x);




