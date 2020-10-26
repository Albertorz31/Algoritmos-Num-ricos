function [valoresX, erroresM,costo,iteraciones] = biseccion(a, b, n, error, f)
    erroresM = [];
    valoresX = [];
    costo = 0;
    iteraciones = 0;
    e = 1; %El error maximo que se tiene 
    for iteracion = 1 : n
        iteraciones= iteraciones+1;
        medio = (b+a)/2;
        costo = costo+2;
        valoresX = [valoresX, medio];
        if(f(a) * f(medio) >= 0)
            e = abs((medio - a)/medio);
            a = medio;
            costo= costo+4;
        else
            e = abs((medio - b)/medio);
            b = medio;
            costo=costo+2;
        end
        erroresM = [erroresM, e];
        if(error > e)
            break;
        end
    end
end