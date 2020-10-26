function [valoresX,errores,costo,iteraciones] = punto_fijo(x0,error,n,g,op)
    e=1;
    valoresX=[];
    errores=[];
    costo=0;
    iteraciones=0;
    if(abs(derivada1p(g,x0)) < 1)
        for i = 1:n
            iteraciones= iteraciones+1;
            x1 = g(x0);
            x2 = g(x1);
            e = abs((x1 - x0)/x1);
            valoresX= [valoresX,x1];
            errores = [errores, e];
            resto = mod(i,3);
            costo=costo+2;
            if(op==1 && n>2)
                x0 = Aitken(x0,x1,x2);
                costo=costo+4;
            elseif(op==2 && n>2)
                if(resto==0)
                    x0 = Steffensen(x0,x1,x2);
                    costo=costo+4;
                else
                    x0=x1;
                end
            elseif(op==0)
                x0=x1;
            end
            if(e <= error)
                break;
            end
        end
    end

end


