function [valoresX,errores,costo,iteraciones] = newtonRaphson(x0, n, error, f)  
    e = 1;
    valoresX = [];
    errores = [];
    costo = 0;
    iteraciones = 0;
    for i = 1: n
        iteraciones= iteraciones+1;
        x1 = x0 - (f(x0)/derivada1p(f,x0));
        e = abs((x1 - x0)/x1);
        valoresX = [valoresX, x1];
        errores = [errores, e];
        x0 = x1;
        costo = costo+7;
        if (e <= error)
            break;
        end
    end
end