function[valor,iteS,erroresS] = IntegralSimpson13(a,b,tol,iteS,f,erroresS)
     iteS = iteS+1;
     m=(a+b)/2;
     t1 = (((b-a)/6)*(f(a) + 4*f((a+b)/2) + f(b)));
     t2 = (((m-a)/6)*(f(a) + 4*f((a+m)/2) + f(m)));
     t3 = (((b-m)/6)*(f(m) + 4*f((m+b)/2) + f(b)));
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