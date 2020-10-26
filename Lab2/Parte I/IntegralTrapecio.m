function[valor,iteT,erroresT] = IntegralTrapecio(a,b,tol,iteT,f,erroresT)
      iteT=iteT+1;
      m = (a+b)/2;
      t1 = (((b-a)/2)*(f(a)+f(b)));
      t2 = (((m-a)/2)*(f(a)+f(m)));
      t3 = (((b-m)/2)*(f(m)+f(b)));
      e = 10*(t1-t2-t3);
      %verifica si el error es menor que la tolerancia para seguir iterando
      %o terminar
      erroresT=[erroresT,e];
      if(e < tol)
          valor=t1;
      else
          [valorAux,iteT,erroresT]= IntegralTrapecio(a,m,tol,iteT,f,erroresT);
          [valorAux2,iteT,erroresT] = IntegralTrapecio(m,b,tol,iteT,f,erroresT);
          valor=valorAux+valorAux2;
      end
          
          
          