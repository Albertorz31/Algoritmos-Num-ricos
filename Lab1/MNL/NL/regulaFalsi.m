function [valoresX, errores,costo,iteraciones] = regulaFalsi(a, b, n, error, fIn)
errores = [];
valoresX = [];
e = 1;
costo = 0 ;
iteraciones = 0;
    for iteracion = 1 : n
        iteraciones= iteraciones+1;
        xi = a - (fIn(a) * (b - a))/(fIn(b) - fIn(a));
        costo= costo+5;       
        if(abs(e) < error)
            break;
        end
        valoresX = [valoresX, xi];        
        
        if (fIn(a) * fIn(xi) >= 0)
            e = (a - xi) / a;
            a = xi; 
            costo=costo+2;
        else
            e = (b - xi) / b;
            b = xi;
            costo=costo+2;
        end
        errores = [errores, abs(e)];
    end
end