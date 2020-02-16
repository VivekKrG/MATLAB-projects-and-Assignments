%%
%   Q4. Program to draw fourier transform of trinangular function.
T=4;    %a= -2 to b= +2
V0=5;   %V=+-(10) Asussumed 
w= 2*pi/T;
%%
%Function declareation
fun1= @(t)( (-4*V0/T).*(t + T/2) );
fun2= @(t)( (4*V0/T).*t );
fun3= @(t)( (-4*V0/T).*(t - T/2) );
func= @(t)( fun1(t)+fun2(t)+fun3(t) );
%%
%a0, an & bn finding
a10=@(n)(2/T)*integral( fun1, -T/2, -T/4 );
a20=@(n)(2/T)*integral( fun2, -T/4,  T/4 );
a30=@(n)(2/T)*integral( fun3,  T/4,  T/2 );
a0 =@(n)( a10(n)+a20(n)+a30(n) );

a1n=@(n)(2/T)*integral( @(t)fun1(t).*cos(n*w*t), -T/2, -T/4 );
a2n=@(n)(2/T)*integral( @(t)fun2(t).*cos(n*w*t), -T/4,  T/4 );
a3n=@(n)(2/T)*integral( @(t)fun3(t).*cos(n*w*t),  T/4,  T/2 );
an =@(n)( a10(n)+a20(n)+a30(n) );

b1n=@(n)(2/T)*integral( @(t)fun1(t).*sin(n*w*t), -T/2, -T/4 );
b2n=@(n)(2/T)*integral( @(t)fun2(t).*sin(n*w*t), -T/4,  T/4 );
b3n=@(n)(2/T)*integral( @(t)fun3(t).*sin(n*w*t),  T/4,  T/2 );
bn =@(n)( b1n(n)+b2n(n)+b3n(n) );
%%
t=-4:0.01:4;
t1=-3:0.01:-1;
t2=-1:0.01: 1;
t3= 1:0.01: 3;
%%
for j=1:2:50
    
    %hold on
    plot(t1,fun1(t1),'k')
    plot(t2,fun2(t2),'k')
    plot(t3,fun3(t3),'k')
    
    FS=0;
    for k=1:j
        FS=FS + an(k).*cos(k*w*t)+bn(k).*sin(k*w*t);
    end
    FS=FS+a0(0);
    plot(t,t==0,'g',t==0,t,'g', t1,fun1(t1),'b', t2,fun2(t2),'b', t3, fun3(t3),'b',t,FS,'r' )
    pause(1)
end
