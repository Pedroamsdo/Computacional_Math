a =-3;b=3;grau=10;
f = @(x) 4/(5+2*x^2);
x = zeros(1,grau+1);fx = zeros(1,grau+1);
%Letra a
disp('Os nós de Chebyshev são:');
for i=0:grau
    x(i+1) = Cheb(a,b,grau,i);
    disp(x(i+1));
    fx(i+1) =f(x(i+1));
end
p = polyfit(x,fx,grau);
fprintf('Coeficientes do polinômio de maior grau ao menor\n');
disp(p);
fp =@(x) funcao(p,grau,x);
space = linspace(-3,3);
px = zeros(1,100);fx = zeros(1,100);
for j=1:100
    fx(j) = f(space(j));
    px(j) = fp(space(j));
end
plot(space,px,space,fx);
title('Gráfico de f(x) e p(x)');
legend('p(x)','f(x)');
%Letra c
maximo = erro(fx,px);
fprintf('o erro absoluto é: %d\n',maximo);
function [fp]=funcao(p,grau,x)
fp = 0;
    for k=1:(grau+1)
        fp = fp + p(k)*x^(grau -k+1);
    end
end
function [maximo] = erro(fx,px)
 maximo = abs(px(1) -fx(1));
 for k=2:100
     valor=abs(px(k)-fx(k));
     if valor > maximo
         maximo = valor;
     end
 end
end
function [coef] = Cheb(a,b,grau,k)
    coef = (a+b)/2 +(b -a)*cos((k*pi)/grau)/2;
end