x =[0.22,0.47,1.09,1.36,1.92];y=[0.7065,0.4085,0.1294,0.0722,0.0407];
valor(1)=SplineCube(x,y,0.22);
valor(2)=SplineCube(x,y,0.47);
valor(3)=SplineCube(x,y,1.09);
valor(4)=SplineCube(x,y,1.36);
valor(5)=SplineCube(x,y,1.92);
f = @(x)1/(1+7*x^2);
fx = zeros(5,1);
for i=1:5
    fx(i) = f(x(i));
    %disp(fx(i));
end 
for i=1:5
    erro = 100*abs(valor(i)-fx(i))/fx(i);
    disp(erro);
end
function [val]=SplineCube(x,y,xx)
n = length(x) -1;m =n-1;h=zeros(1,m+1);
for i=0:m
    h(i+1) = x(i+2) -x(i+1);
end
A=zeros(n-1,n-1);A(1,1)=1;A(n+1,n+1)=1;
for i= 2:n
    for j=2:n
        if i == j
            A(i,j)=2*(h(i-1) +h(i));A(i,j-1)=h(i-1);A(i,j+1)=h(i);
        end
    end
end
b=zeros(n+1,1);
for i=2:n
    b(i,1)=(((y(i+1) -y(i))/h(i)) - ((y(i)-y(i-1))/(h(i-1))));
end
g=A\b;
for k=1:n
    ak(k)=(g(k+1) -g(k))/(6*h(k));bk(k)=g(k+1)/2;
    ck(k)=((y(k+1) -y(k))/h(k)) + (2*h(k)*g(k+1) + g(k)*h(k))/6;dk(k)=y(k+1);
end
i=1;
while xx>x(i+1)
    i=i+1;
end
val = ak(i)*((xx - x(i+1)).^3) +bk(i)*((xx-x(i+1)).^2) +ck(i)*(xx - x(i+1)) +dk(i);
end

    

