a = 0;b =0.4;nseg = 2;
f =@(x) 2 + 5*(x) -3*(x.^2) + 6*(x.^3) -7*(x.^4) -3*(x.^5) + x.^6;
x = zeros(1,nseg +1);x(1) = a;x(end) = b;
aprox = Umterco(x,a,b,nseg,f);
fprintf('valor real : %.6f\n',integral(f,0,1));
fprintf('Valor aproximado (1/3) : %.6f\n',aprox);
function [valor] = Umterco(x,a,b,nseg,f)
h = (b-a)/(nseg);
    i = 1;
    while i*h ~= x(end)
        x(i+1) = i*h;
        i = i+1;
    end

    aux1 =0;aux2=0;n =1;
    while 2*n<=nseg     
        aux1 = aux1 + f(x(2*n));
        n = n+1;
    end
    n = 1;
    while 2*n+1<=(nseg -1)     
        aux2 = aux2 + f(x(2*n +1));
        n = n+1;
    end
    valor = h*(f(x(1)) + 4*aux1 + 2*aux2 + f(x(end)))/3;
    return
end