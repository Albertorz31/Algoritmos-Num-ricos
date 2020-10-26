%Se utilizan diferencias 
%El z maximo es igual al largo L 
%Se asume que el tiempo inicial es 0
%Condiciones de frontera:
%Cb(0,t) = funcion pulso: Cb 0<t <= tinyeccion
%Cb(L,t) = 0  0<t<t_max
%Cb(z,0) = 0   0<z<L

%Df corresponde al a concentracion en Cb(z,t)

function [Df,Msal,costo,errores] = DifFinitas(cb0,t_fin,L,nz,m,tinyeccion,tlavado,telucion,PE,Cosal,Coi,Cfsal)
   dz= L/(nz-1);
   dt = t_fin/(m-1);
   
   costo=0;
   error=0;
   errores=[];
   %Se crea la matriz nz x m llenandola inicialmente de ceros
   Df=zeros(nz,m);
   
   %Obtener valores de delta h y delta t
   B=dz/dt;
   A= 1-B;

   %Se multiplica el tiempo de inyeccion apra adaptarlo al tiempo elegido
   it_inyeccion = fix(m*tinyeccion/t_fin);
   
   %Se guardará la concentracion de sal en el trancurso de la fase
   Msal = [];
   sal=0;
   
   
   %Se comienza iterando por la matriz para obtener los calores de cada
   %punto, usando las direrencias finitas.
   for j=1:m
       if j< it_inyeccion
           Df(1,j)=cb0;
           Msal=[Msal,sal];
       else
           Df(1,j)=0;
       end
       Df(nz,j)=0;
   end
    for j=2:m
      for i=2:nz
          if(i<nz)
              Df(i,j)= 1/PE *(Df(i-1,j)-2*Df(i,j)+Df(i+1,j)/dz^2) + B*Df(i-1,j-1) + A*Df(i,j-1);
              costo = costo+13;
              error= error+((Df(i-1,j)-Df(i,j))^2);
              errores=[errores,error];
          elseif(i==nz)  %Posterior a la gradiente
               Df(i,j)=0;
           end
           fprintf('Df(%i,%i): %i\n',i,j,Df(i,j));
           %Para la sal comienza a aumentar cuando comienza el proceso de
           %inyeccion hasta el proceso de lavado
            if(j > it_inyeccion && j < (it_inyeccion+tlavado) && i==2)
                sal = -(Df(i,j)- Cosal/Coi)/nz;
                costo=costo+3;
                Msal=[Msal,sal];
             %Depues debe seguir aumentando hasta que termine el proceso de
             %elucion
            elseif(j > (it_inyeccion+tlavado) && j < (it_inyeccion+tlavado+telucion) && i==2)
                sal= -(Df(i,j)-(Cosal/Coi+(Cosal/Coi)/telucion*(j-tlavado)))/nz; %Durante la gradiente
                costo=costo+6;
                Msal=[Msal,sal];
            elseif(j > (it_inyeccion+tlavado+telucion) && i==2)
                sal=Cfsal;    %Posterior a la gradiente
                Msal=[Msal,sal];
            end
           
      end
    end

   surf(Df');
   xlabel("Z");
   ylabel("t");
   zlabel("Cb");
   
                
end

       
       
       