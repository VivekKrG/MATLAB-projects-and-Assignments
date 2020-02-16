figure(1)
miu=5;
sigma=1;
F = [];

for i= 0:1000
    X = random('Normal', miu ,sigma );
    F = [F X];
end
subplot(3,1,1)
bean=10;
[f,x]= hist(F, bean);
bar(x,f/trapz(x,f));
%%
subplot(3,1,2)
x1= -11:0.01:9;
fx = (1/sqrt(2*(pi)*(sigma)*(sigma)))*exp((-((x-miu).*(x-miu)))/(2*((sigma)*(sigma)))) ;
plot(x1, fx);
