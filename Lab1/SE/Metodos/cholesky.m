function [x,Error,costo]=cholesky(A, b)
    [N,M]=size(A);
    costo = 0;
    for k = 1 : N
        A(k,k) = sqrt(A(k,k));
        A(k+1:N,k) = A(k+1:N,k)/A(k,k);
        costo= costo+2;
        for j = k + 1 : N
            A(j:N,j) = A(j:N,j) - A(j,k)*A(j:N,k);
            costo = costo + 2;
            
        end
    end
    L = tril(A);
    LT = L'; 
    z = inv(L)*b;
    x = inv(LT)*z;
    Error = norm(eye(N)-inv(L*LT)*A);
    costo = costo + 1;
end