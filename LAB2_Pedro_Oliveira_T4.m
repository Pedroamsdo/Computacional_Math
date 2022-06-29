format long
f =@(x) 4* sin(x) - exp(x);
a = 0; b=1; epsilon=0.001; maxinteracoes = 100;
Bisseccao(f, a, b, epsilon, maxinteracoes)
function [r,k] = Bisseccao(f, a, b, epsilon, maxinteracoes)
k = 0;
while k < maxinteracoes
    r = (a +b)/2;
    k = k +1;
    if abs(b-a) < epsilon
        r = (a +b)/2;
        fprintf('o valor da raiz aproximada é %.12f, obtido em %d iterações. \n',r,k);
        break;
    end
    if f(a)*f(r) > 0
        a = r;
    else
        b= r;
    end
end

end
