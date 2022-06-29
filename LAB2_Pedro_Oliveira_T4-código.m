format long
f =@(x) 4* sin(x) - exp(x);
epsilon1=0.00001;epsilon2 = 0.00001; maxinteracoes = 100;
a = 0; b = 1;
x0=a;x1=b; 
secante(f,x0,x1, epsilon1,epsilon2, maxinteracoes);
function [r,k] = secante(f,x0,x1, epsilon1,epsilon2, maxinteracoes)
tmp = x0;
r = x1;
k=0;
if abs(f(tmp)) <epsilon1 || abs(f(r))<epsilon1 || abs(r - tmp) <epsilon2
    return;
end
while k<maxinteracoes
    tmp2 = r;
    r = r - (f(r)/(f(r) -f(tmp)))*(r - tmp);
    k = k+1;
    if abs(f(r))<epsilon1 || abs(r - tmp2)< epsilon2
        break;
    end
    tmp = tmp2;
end
fprintf('O valor da raiz aproximada é %.12f, obtido em %d iterações. \n',r,k);
end


