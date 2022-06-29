A=[3, -0.1, -0.2;0.1, 7, -0.3;0.3, -0.2, 10];
b=[7.85;-19.3;71.4];
[L,U] = lu_semipivoteamento(A);
y=L\b;
x=U\y;
disp('A solucao é:');
disp(x);
function [L,U] = lu_semipivoteamento(A)
n = size(A,1);
L = eye(n);
for k=1:n
    L(k+1:n,k) = A(k+1:n,k)/A(k,k);
    for p = k +1:n
        A(p,:) = A(p,:) - L(p,k)*A(k,:);
    end
end
U = A;
end