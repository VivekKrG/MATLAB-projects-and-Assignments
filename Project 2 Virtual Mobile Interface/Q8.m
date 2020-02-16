a = -100; b = 100;
x=-100:100;
mu = (a + b)/2;
 

p1 = @(s)-0.5 * ((x - mu)/s) .^ 2;
p2 = @(s)(s * sqrt(2*pi));
f=@(s)exp(p1(s)) ./ p2(s);
%%
X = 100.*f(30);  %sigma=30
subplot(4,2,1)
plot(x,X,'r')
grid on
title('X: Gauss Distribution:Bell Curve')
xlabel('Randomly produced numbers')
ylabel('Gauss Distribution')
%%
Y = 100.*f(10);
subplot(4,2,2)
plot(x,Y,'g')
grid on
title('Y: Gauss Distribution:Bell Curve')
xlabel('Randomly Variables')
ylabel('Gaussian Distribution')
%%
X2=X.^2;
subplot(4,2,3)
plot(x,X2,'b')
grid on
title('X^2, X: Gaussian')
xlabel('Randomly Variables')
ylabel('Gaussian Distribution')
%%
Y2=Y.^2;
subplot(4,2,4)
plot(x,Y2,'c')
grid on
title('Y^2, Y: Gaussian')
xlabel('Randomly Variables')
ylabel('Distribution')
%%
Z2=X2+Y2;
subplot(4,2,5)
plot(x,Z2,'m')
grid on
title('X^2+Y^2, X & Y: Gaussian')
xlabel('Randomly Variables')
ylabel('Distribution')
%%
Z=Z2.^0.5;
subplot(4,2,6)
plot(x,Z,'y')
grid on
title('Z=(X^2+Y^2)^0^.^5, X: Gaussian')
xlabel('Randomly Variables')
ylabel('Distribution')
%%
P=exp(X);  %sigma=30
subplot(4,2,7)
plot(x,P,'k')
grid on
title('P= e^X, X: Gaussaian Distribution')
xlabel('Randomly Variables')
ylabel('Distribution')