y=randn(1000,1);
hist(y); hold on
%%
miu =0;
sigma=1;
x = -20:20;
%%pi = 3.14;
f= (1/sqrt(2*(pi)*(sigma).*(sigma)))*exp((-((x-miu).*(x-miu)))/(2*((sigma).*(sigma)))) ;
plot(x,f); hold off;
%%Normalization can be done by deviding their sume or deviding by their
%%area.