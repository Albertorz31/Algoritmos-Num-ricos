function [raizX,raizY, errores,costo] = newtonRaphsonMult(f1,f2,x0,y0,error,n)
     ex=1;
     ey=1;
     e=1;
     costo=0;
     raizX=[];
     raizY=[];
     errores=[];
     for i = 1:n
         valJacobiano = Jacobiano(f1,f2,x0,y0);
         x1 = x0 - ((f1(x0,y0)*derivadaParcialY(f2,x0,y0) - f2(x0,y0)*derivadaParcialY(f1,x0,y0))/valJacobiano);
         y1 = y0 - ((f2(x0,y0)*derivadaParcialX(f1,x0,y0) - f1(x0,y0)*derivadaParcialX(f2,x0,y0))/valJacobiano);
         ex= abs((x1-x0)/x1);
         ey= abs((y1-y0)/y1);
         e= (ex+ey)/2;
         raizX=[raizX,x1];
         raizY=[raizY,y1];
         errores=[errores,e];
         x0=x1;
         y0=y1;
         costo=costo+10;
         if(e <=error)
             break;
         end   
     end

end
    
    
    
   
    