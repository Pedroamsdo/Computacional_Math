x = [1,2,3,4,5,6];
y = [1.487,2.958,5.602,8.003,11.452,13.021];
x = log10(x);
y = log10(y);
n = length(x);
results = RegreLinear(x,y,n);
fprintf('Coeficiente a0: %.3f\n',results(1));
fprintf('Coeficiente a1: %.3f\n',results(2));
alfa = 10^results(1);
fprintf('Coeficiente alfa: %.3f\n',alfa);
beta = results(2);
fprintf('Coeficiente beta: %.3f\n',beta);
St = results(3);
Sr = results(4);
fator = correlation(St,Sr);
fprintf('Coeficiente de determinação: %.3f\n',fator^2);
fprintf('Coeficiente de correlação: %.3f\n',fator);
x = 10.^x;
f = @(v) results(1) + v*results(2);
g = @(v) alfa*((v).^beta);
valory = f(x);
plot(x,valory);
hold on;
valory = g(x);
plot(x,valory);
hold off;
title('Gráfico da reta e potência');
legend('função da reta','função da potência');

function [valor] = correlation(St,Sr)
valor = sqrt((St -Sr)/St);
end
function results = RegreLinear(x,y,n)
x2 = zeros(1,n);
xy = zeros(1,n);
for i=1:n
    x2(i) = (x(i))^2;
    xy(i)=x(i)*y(i);
end
Sx = sum(x);
Sy = sum(y);
Sx2 = sum(x.^2);
Sxy = sum(x.*y);
xm = Sx/n;
ym = Sy/n;
results =zeros(1,4);
results(2) = (n*Sxy - Sx*Sy)/(n*Sx2 - (Sx)^2);
results(1) = ym - results(2)*xm;
results(3) = sum((y - ym).^2);
results(4) = sum((y - results(1) -results(2)*x).^2);
end
