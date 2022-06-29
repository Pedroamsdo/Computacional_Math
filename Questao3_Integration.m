a = 0.4;b =1;nseg = 3;
f =@(x) 2 + 5*(x) -3*(x.^2) + 6*(x.^3) -7*(x.^4) -3*(x.^5) + x.^6;
real = integral(f,0,1);
x = zeros(1,nseg +1);x(1) = a;x(end) = b;
aprox = Umoitavo(x,a,b,nseg,f);
fprintf('Valor aproximado(3/8) : %.6f\n',aprox);
fprintf('Valor aproximado : %.6f\n',1.157453 + aprox);
fprintf('Erro absoluto : %.6f\n',real -(1.157453 + aprox));
function [valor] = Umoitavo(x,a,b,nseg,f)
h = (b-a)/(nseg);
    i = 1;
    while (a +i*h) ~= x(end)
        x(i+1) = a + i*h;
        i = i+1;
    end
    valor = nseg*h*(f(x(1)) + 3*f(x(2)) + 3*f(x(3)) + f(x(end)))/8;
    return
end