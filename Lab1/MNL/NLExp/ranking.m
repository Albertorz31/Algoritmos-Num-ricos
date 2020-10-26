function [top] = ranking(costoBi,costoRegu,costoPunto,costoSec,costoNew,errorBi,errorRegu,errorPunto,errorSec,errorNew,porC,porE)
    top=[];
    valBiseccion = (costoBi*porC) + (errorBi*porE);
    top(1)=valBiseccion;
    valRegulaFalsi = (costoRegu*porC) + (errorRegu*porE);
    top(2)=valRegulaFalsi;
    valPuntoFijo = (costoPunto*porC) + (errorPunto*porE);
    top(3)=valPuntoFijo;
    valSecante = (costoSec*porC) + (errorSec*porE);
    top(4)=valSecante;
    valNewton = (costoNew*porC) + (errorNew*porE);
    top(5)= valNewton;
    i=1;
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
      if(top(i)== valBiseccion)
         fprintf('%i. Biseccion\n',ran)
         ran=ran+1;
      elseif(top(i)== valRegulaFalsi)
         fprintf('%i. Regula Falsi\n',ran)
         ran=ran+1; 
      elseif(top(i)== valPuntoFijo)
         fprintf('%i. Punto Fijo\n',ran)
         ran=ran+1; 
      elseif(top(i)== valSecante)
         fprintf('%i. Secante\n',ran)
         ran=ran+1; 
      elseif(top(i)== valNewton)
         fprintf('%i. Newton-Raphson\n',ran)
         ran=ran+1; 
      end
    end
end