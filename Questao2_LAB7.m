x = [1,2,3,4,5,6];y = [1.487,2.958,5.602,8.003,11.452,13.021];n = length(x);
results = Regre2grau(x,y,n);
St = results(4);Sr = results(5);
r = coefco(St,Sr);
fprintf('coeficiente a0: %.3f\n',results(1));
fprintf('coeficiente a1: %.3f\n',results(2));
fprintf('coeficiente a2: %.3f\n',results(3));
fprintf('coeficiente de determinação: %.4f\n',r^2);
fprintf('coeficiente de correlação: %.4f\n',r);
f = @(v) results(1) + results(2).*v + results(3)*(v.^2);valory = f(x);
plot(x,valory);
title('Gráfico do ajuste de curva de 2 grau');
legend('função do ajuste de curva');
function [r]=coefco(St,Sr)
r = sqrt((St-Sr)/St);
end
function [results] = Regre2grau(x,y,n)
Sx = sum(x);Sy = sum(y);Sx2 = sum(x.^2);Sx3 = sum(x.^3);Sx4 = sum(x.^4);Sxy = sum(x.*y);
Sx2y = sum((x.^2).*y);
ym = sum(y)/n;
A = zeros(3,3);
A(1,1) = n;A(2,2)=Sx2;A(3,3)=Sx4;
A(1,2)=Sx;A(2,1)=Sx;
A(1,3) =Sx2; A(3,1) = Sx2;
A(2,3) =Sx3; A(3,2) = Sx3;
b = [Sy, Sxy, Sx2y];
results = A\(b');
results(4)= sum((y -ym).^2);
results(5)= sum((y -results(1) -results(2).*x -results(3).*(x.^2)).^2);
end