%%
%Nakagami-m Distribution
clc; clear all; close all;
colors=['r','g','b'] ;
m = 1;
x = [0:0.05:3];
subplot(411)
for w = 1:3
    for ii = 1:length(x)
        y(ii)=((2*m^m)/(gamma(m)*w^m))*x(ii)^(2*m-1)*exp(-((m/w)*x(ii)^2));
    end
    plot(x,y,colors(w))
    hold on
end
xlabel('Support'); 
ylabel('PDF'); 
title('Nakagami-m Distribution:Probability Density Function')
hleg1 = legend('w=1','w=2','w=3');
set(hleg1,'Location','NorthEast')
axis([0 3 0 2]);
grid on 
%%
x = (10:1000:125010)';
y = lognpdf(x,log(20000),1.0);

subplot(412)
plot(x,y)
title('Log Normal Distribution')
h = gca;
h.XTick = [0 30000 60000 90000 120000];
h.XTickLabel = {'0','$30,000','$60,000','$90,000','$120,000'};
% Compute the Lognormal Distribution pdf
% Suppose the income of a family of four in the United States follows
% a lognormal distribution with mu = log(20,000) and sigma = 1.
% Compute and plot the income density

%%
mu = 1:5;

y = gampdf(1,1,mu);
%y = [0.3679  0.3033  0.2388  0.1947  0.1637]
y1 = exppdf(1,mu);
subplot(413)
plot(mu,y,mu,y1)
title("Gamma Distribution Function")
%%
%Rician 
x = linspace(0, 8, 100);

subplot(4, 1, 4)
plot(x, ricepdf(x, 0, 1),  x, ricepdf(x, 1, 0.50), x, ricepdf(x, 1, 1.00))
title('Rice PDF with s = 1')
function y = ricepdf(x, v, s)
s2 = s.^2; % (neater below)
    try
        y = (x ./ s2) .*...
            exp(-0.5 * (x.^2 + v.^2) ./ s2) .*...
            besseli(0, x .* v ./ s2);
            % besseli(0, ...) is the zeroth order modified Bessel function of
            % the first kind. (see help bessel)
        y(x <= 0) = 0;
    catch
        error('ricepdf:InputSizeMismatch','Non-scalar arguments must match in size.');
    end
end
%%
