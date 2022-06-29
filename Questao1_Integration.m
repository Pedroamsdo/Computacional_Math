a = 0;b =1;
nseg = 10;
f =@(x) 2 + 5*(x) -3*(x.^2) + 6*(x.^3) -7*(x.^4) -3*(x.^5) + x.^6;
real = integral(f,a,b);
x = zeros(1,nseg +1);
x(1) = a;
x(end) = b;
aprox = Trapezio(x,a,b,nseg,f);
fprintf('Valor aproximado : %.3f\n',aprox);
fprintf('Erro Exato : %.3f\n',real - aprox);

function [valor] = Trapezio(x,a,b,nseg,f)
h = (b-a)/(nseg);
if nseg == 1
    valor = h * (f(x(1)) + f(x(end)))/2;
    return 
else
    i = 1;
    while i*h ~= x(end)
        x(i+1) = i*h;
        i = i+1;
    end
    aux =0;
    for j =2:(nseg)     
        aux = aux + f(x(j));
    end
    valor = h*(f(x(1)) + 2*aux + f(x(end)))/2;
    return
end
end