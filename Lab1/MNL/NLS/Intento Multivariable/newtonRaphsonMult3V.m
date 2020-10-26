function [raices,errores,costo] = newtonRaphsonMult3V(funciones,x0,error,n)
    costo=0;
    raices=[];
    errores=[];
    fprima=jacobian(funciones);
    f=inline(funciones);
    jf=inline(fprima);
    e=norm(f(x0(1),x0(2),x0(3)),2);
    for i=1:n
        fx0=f(x0(1),x0(2),x0(3));
        fpx0=jf(x0(1),x0(2),x0(3));
        x1=x0-inv(fpx0)*fx0;
        fx1=f(x1(1),x1(2),x1(3));
        e=norm((fx1),2);
        errores=[errores,e];
        raices=[raices,x1];
        x0=x1;
        if(e <=error)
             break;
         end   
    end