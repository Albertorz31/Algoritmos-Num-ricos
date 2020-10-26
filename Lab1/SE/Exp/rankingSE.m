function [top] = rankingSE(costoJac,costoSei,costoCho,costoDoo,costoQR,errorJac,errorSei,errorCho,errorDoo,errorQR,porC,porE)
      top=[];
      valJac =(costoJac*porC) + (errorJac*porE);
      top(1)=valJac;
      valSei = (costoSei*porC)+ (errorSei*porE);
      top(2)=valSei;
      valCho= (costoCho*porC) + (errorCho*porE);
      top(3) = valCho;
      valDoo = (costoDoo*porC) + (errorDoo*porE);
      top(4) = valDoo;
      valQR = (costoQR*porC) + (errorQR*porE);
      top(5) = valQR;
      i=0;
      ordenado=0;
      while(i<5 && ordenado==0)
           i=i+1;
           ordenado=1;
           j=0;
           while(j<4)
              j=j+1;
              if(top(j) > top(j+1))
                  ordenado=0;
                  aux=top(j);
                  top(j)=top(j+1); 
                  top(j+1)=aux;
              end
           end
      end
      i=0;
      ran=1;
    while(i<5)
      i=i+1; 
      if(top(i)== valJac)
         fprintf('%i. Gauss.Jacobi\n',ran)
         ran=ran+1;
      elseif(top(i)== valSei)
         fprintf('%i. Gauss.Seidel\n',ran)
         ran=ran+1; 
      elseif(top(i)== valCho)
         fprintf('%i. Cholesky\n',ran)
         ran=ran+1; 
      elseif(top(i)== valDoo)
         fprintf('%i. Doolittle (LU)\n',ran)
         ran=ran+1; 
      elseif(top(i)== valQR)
         fprintf('%i. QR\n',ran)
         ran=ran+1; 
      end
    end        
end