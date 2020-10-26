function[C] = multiplicarMatrices(A, B)
[m r ]= size(A);
[s n] = size(B);
C = zeros(m,n);

if(r == s)
   for j = 1 : m
       for k = 1 : n
           c = 0;
           for i = 1 : r
              c = c + A(j,i) * B(i,k); 
           end
           C(j,k) = c;
       end
   end
end
end