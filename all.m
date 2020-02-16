x = [0 2 3 5 4 6 7 8 9 9 10 5 8 7 9 4 5 1 0 4 1 2];
hist(x)

x= 1900:10:2000 ;
y = [12 145 121 62 45 45 11 48 12 102];
hist(x,y)

y = [1 2 3; 4 5 6];
ax1 = subplot(2,1,1);
bar(ax1,y);
ax2 = subplot(2,2,1);
bar(ax1,y);


y = [1 4 9 16 25];
Q = trapz(y);


X = 0:pi/100000:pi;
Y = sin(X);
Q = trapz(X,Y);

%%
miu =0;
sigma=1;
x = -20:20;
%%pi = 3.14;
f= (1/sqrt(2*(pi)*(sigma).*(sigma)))*exp((-((x-miu).*(x-miu)))/(2*((sigma).*(sigma)))) ;
%%
figure(1)
miu=5;
sigma=1;
F[];
%%pi = 3.14;
for i= 0:1000
    x = random('normal',miu,sigma);
    F = [F X];
end
subplot(3,1,1)
bean=10;
[f,x]= hist(F, bean);
bar(x,f/trapz(x,f));
