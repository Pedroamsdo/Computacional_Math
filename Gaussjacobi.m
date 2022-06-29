A =[3,-0.1,-0.2;0.1,7,-0.3;0.3,-0.2,10];b=[7.85;-19.3;71.4];prec=0.0000001;maxiteracoes = 1000;
[S, dr, k] = GaussJacobi(A,b,prec,maxiteracoes);
fprintf('O número de iterações é : %d\n',k);
disp('A solução do sistema é :'),S
fprintf('O critério de parada foi atendido com : %d\n',dr);
function[S,dr,k] = GaussJacobi(A,b,prec,maxiteracoes)
ord = size(A);X(1:size(b),1) = 0;
for i = 1 : size(b)
    X(i,1) = (b(i,1)/A(i,i));
end
k=1;C(1:ord,1) = 0;g(1:ord,1) =0;deltax(1:ord,1) =0;
for i=1:ord
    for j = 1:ord
        if i==j
            C(i,j) = 0;g(i,1) = b(i,1)/A(i,i);
        else
            C(i,j) = - A(i,j)/A(i,i);
        end
    end
end
while k<=maxiteracoes
    S = C*X + g;
    for i = 1:ord
        deltax(i,1) = abs(S(i,1) - X(i,1));
    end
    dr = max(abs(deltax))/max(abs(S));
    if(dr < prec)
        break;
    end
    X = S ;k = k+1;
end
end
