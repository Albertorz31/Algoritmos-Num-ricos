function [X,Error,costo] = QR(A, b)
X=[];
[m, n] = size(A);
R = zeros(n, n);
V = A;
Q=zeros(m, n);
costo = 0 ;
for i =1:n
    R(i,i)= norm(V(:,i));
    Q(:,i)= V(:,i)/R(i,i);
    costo=costo+1;
    for j=i+1:m
       R(i,j)= (Q(:,i)')*V(:,j);
       V(:,j)=V(:,j) - R(i,j)*Q(:,i);
       costo = costo + 3 ;
    end
end
X=inv(R)*Q'*b;
Error = norm(eye(m)-inv(Q*R)*A);
costo= costo + 3;
end