function[valor,iteS,erroresS] = IntegralSimpson38(a,b,tol,iteS,f,erroresS)
     iteS = iteS+1;
     m=(a+b)/2;
     %h= (b - a)/3, ya que la funcion se tabula con cuatro puntos de igual distancia h 
     %y formando tres subintervalos.
     h1=(a-b)/3;
     h2=(a-m)/3;
     h3=(m-b)/3;
     t1 = (((b-a)/8)*(f(a) + 3*f(a+h1) + f(a+2*h1) + f(b)));
     t2 = (((m-a)/8)*(f(a) + 3*f(a+h2) + f(a+2*h2) + f(m)));
     t3 = (((b-m)/8)*(f(m) + 3*f(m+h3) + f(m+2*h3) + f(b)));
     e = 10*(t1-t2-t3);
     %verifica si el error es menor que la tolerancia para seguir iterando
      %o terminar
      erroresS=[erroresS,e];
      if(e < tol)
          valor=t1;
      else
          [valorAux,iteS,erroresS]= IntegralSimpson13(a,m,tol,iteS,f,erroresS);
          [valorAux2,iteS,erroresS] = IntegralSimpson13(m,b,tol,iteS,f,erroresS);
          valor=valorAux+valorAux2;
      end