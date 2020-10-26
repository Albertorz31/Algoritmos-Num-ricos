 function [valoresX, errores,costo,iteraciones] = secante(x0, x1, n, error, f)
    valoresX = [];
    errores = [];
    iteraciones=0;
    e = 1;
    numerador = f(x1)*(x1 - x0);
    denominador = (f(x1) - f(x0));
    xn = x1 - (numerador/denominador);
    x0 = x1;
    x1 = xn;
    valoresX = [valoresX, xn];
    costo = 5;
    for i = 1 : n  
       iteraciones= iteraciones+1;
       if (e <= error)
           break;
       end
       numerador = f(x1)*(x1 - x0);
       denominador = (f(x1) - f(x0));
       xn = x1 - (numerador/denominador);
       e = abs(x1 - x0)/x0;
       x0 = x1;
       x1 = xn;
       valoresX = [valoresX, xn];
       errores = [errores, abs(e)];
       costo = costo + 8;
    end
end