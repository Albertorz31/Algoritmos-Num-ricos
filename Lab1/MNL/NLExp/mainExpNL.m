clear,clc

%En la primera parte del laboratorio tenemos que evaluar ciertas funciones
%con todo los metodos programados, se declaran las funciones que se van a
%evaluar:

func1 = @(x) 2*x - 2^(-x);
func2 = @(x) x^3 - 7*x^2 + 14*x - 2;

%Se declaran las condiciones con las cuales se probararan cada una de las
%funciones.
n = 100; %Nos indica la cantidad de iteraciones que tendremos
a = 0 ; %Punto inicial
b = 2 ; %Punto final funcion 1
c = 1 ; %Punto final funcion 2
error = 10^-15; %Error experimentado en el laboratorio
%------------------------------------ % % ----------------------------- %
%primera y segunda derivada de las funciones
derivada1F1= @(x) 2^(-x)*log(2)+2;
derivada2F1= @(x) -log(2)^2*2^(-x);
derivada1F2= @(x) 3*x^2-14*x+14;
derivada2F2= @(x) 6*x-14;

%funciones g(x) para el metodo del pto. fijo
funcionG1 = @(x) 2^(-x)/2;
funcionG2 = @(x) 1/7+x^2/2-x^3/14; 

InicialF1 = reglaFourier(func1,derivada1F1,derivada2F1,a,b);
InicialF2 = reglaFourier(func2,derivada1F2,derivada2F2,a,c);

% %Declaracion de llamado a la funcion 1
% 

[valorBi1,errorBise1,costoBi1,iteBiF1] = biseccion(a,b,n,error,func1);
[valorRegu1,errorRegu1,costo1ReguF1,iteReguF1] = regulaFalsi(a,b,n,error,func1);
%Para usar metodo de Aitken y Steffensen cambia el ultimo parametro del
%punto fijo.  0 = sin nada;  1 = Aitken; 2=Steffensen
[valorPunto1F1,errorPunto1F1,costoPunto1F1,itePunto1F1] = punto_fijo(InicialF1,error,n,funcionG1,0); 
[valorPunto2F1,errorPunto2F1,costoPunto2F1,itePunto2F1] = punto_fijo(InicialF1,error,n,funcionG1,1);
[valorPunto3F1,errorPunto3F1,costoPunto3F1,itePunto3F1] = punto_fijo(InicialF1,error,n,funcionG1,2); 
[valorSec1,errorSec1,costoSecF1,iteSecF1] = secante(a,b,n,error,func1); 
[valorNew1,errorNew1,costoNewF1,iteNewF1] = newtonRaphson(InicialF1,n,error,func1);
% 
%
%RANKING de los Métodos
%
%Ranking de los metodos segun eficiencia (costo) vs eficacia (precision)
%Se ingresan distintos porcentajes de distribucion de eficiencia vs
%eficacia
%
%Primero porcentaje de distribucion %50 vs %50 osea no existe prioridad
disp('Función 1:')
disp('Ranking 50% vs 50%')
[top1] = ranking(costoBi1,costo1ReguF1,costoPunto1F1,costoSecF1,costoNewF1,iteBiF1,iteReguF1,itePunto1F1,iteSecF1,iteNewF1,50,50);
%Segundo porcentaje de distribucion %30 vs %70 de prioridades
disp('Ranking 30% vs 70%')
[top2] = ranking(costoBi1,costo1ReguF1,costoPunto1F1,costoSecF1,costoNewF1,iteBiF1,iteReguF1,itePunto1F1,iteSecF1,iteNewF1,30,70);
%Tercer porcentaje de distribucion %90 vs %10 de prioridades
disp('Ranking 90% vs 10%')
[top3] = ranking(costoBi1,costo1ReguF1,costoPunto1F1,costoSecF1,costoNewF1,iteBiF1,iteReguF1,itePunto1F1,iteSecF1,iteNewF1,90,10);

% %Llamado a las graficas de las funciones
% 
% %Funcion 1
% 
%
graficarValores(valorBi1,valorRegu1,valorSec1,valorNew1);
graficarErrores(errorBise1,errorRegu1,errorSec1,errorNew1);
graficarValoresPF(valorPunto1F1,valorPunto2F1,valorPunto3F1);
graficarErroresPf(errorPunto1F1,errorPunto2F1,errorPunto3F1);
% 
% % ------------------------------------% % -------------------------------%
% 
% % %Declaracion de llamado a la funcion 2
% 
%
[valorBi2,errorBise2,costoBi2,iteBiF2] = biseccion(a,c,n,error,func2);
[valorRegu2,errorRegu2,costo1ReguF2,iteReguF2] = regulaFalsi(a,c,n,error,func2);
%Para usar metodo de Aitken y Steffensen cambia el ultimo parametro del
%punto fijo.  0 = sin nada;  1 = Aitken; 2=Steffensen
[valorPunto1F2,errorPunto1F2,costoPunto1F2,itePunto1F2] = punto_fijo(InicialF2,error,n,funcionG2,0);
[valorPunto2F2,errorPunto2F2,costoPunto2F2,itePunto2F2] = punto_fijo(InicialF2,error,n,funcionG2,1);
[valorPunto3F2,errorPunto3F2,costoPunto3F2,itePunto3F2] = punto_fijo(InicialF2,error,n,funcionG2,2);
[valorSec2,errorSec2,costo1SecF2,iteSecF2] = secante(a,c,n,error,func2);
[valorNew2,errorNew2,costoNewF2,iteNewF2] = newtonRaphson(InicialF2,n,error,func2);
% 
%
%RANKING de los Métodos
%
%Ranking de los metodos segun eficiencia (costo) vs eficacia (precision)
%Se ingresan distintos porcentajes de distribucion de eficiencia vs
%eficacia
%
%Primero porcentaje de distribucion %50 vs %50 osea no existe prioridad
disp('Funcion 2:')
disp('Ranking 50% vs 50%')
[top4] = ranking(costoBi2,costo1ReguF2,costoPunto1F2,costo1SecF2,costoNewF2,iteBiF2,iteReguF2,itePunto1F2,iteSecF2,iteNewF2,50,50);
%Segundo porcentaje de distribucion %30 vs %70 de prioridades
disp('Ranking 30% vs 70%')
[top5] = ranking(costoBi2,costo1ReguF2,costoPunto1F2,costo1SecF2,costoNewF2,iteBiF2,iteReguF2,itePunto1F2,iteSecF2,iteNewF2,30,70);
disp('Ranking 90% vs 10%')
[top6] = ranking(costoBi2,costo1ReguF2,costoPunto1F2,costo1SecF2,costoNewF2,iteBiF2,iteReguF2,itePunto1F2,iteSecF2,iteNewF2,90,10);


% % %Funcion 2
% % 
% 
graficarValores(valorBi2,valorRegu2,valorSec2,valorNew2);
graficarErrores(errorBise2,errorRegu2,errorSec2,errorNew2);
graficarValoresPF(valorPunto1F2,valorPunto2F2,valorPunto3F2);
graficarErroresPf(errorPunto1F2,errorPunto2F2,errorPunto3F2);

% % Metodo de Newton-Raphson multivariable: Procedemos hacer la parte II parte d del
% % laboratorio que nos indica evaluar dos sistema de ecuaciones:
% 
% 1. Sistema de ecuaciones: (2 variables)
x0=0;
y0=0;
f1= @(x,y) x^2 - 10*x + y^2 + 8;
f2 = @(x,y) x * y^2 + x - 10*y + 8;
error2= 10^-15;

[valNewMX,valNewMY,errorNWM1,costoNWM1]=newtonRaphsonMult(f1,f2,x0,y0,error2,n);

graficarNewtonRaphsonMult2V(valNewMX,valNewMY,'Solucion del sistema 1')
graficarNewtonRaphsonMult2VError(errorNWM1, 'Errores del sistema 1');
% 
%
% 2. Sistema de ecuaciones: (3 variables)
x0=[0;0;0];
syms x y z
f3 =x^2+y-37;
f4 =x-y^2-5;
f5 =x+y+z-3;
F2=[f3;f4;f5];
error3 = 10^-15;

%No se pudo realizar

%Guardamos resultados de las funciones
h=figure(1);
saveas(h,'.\MNL\NLExp\NLG\imagenes\resultadosFuncion1.png');
h=figure(2);
saveas(h, '.\MNL\NLExp\NLG\imagenes\erroresFuncion1.png');
h=figure(3);
saveas(h, '.\MNL\NLExp\NLG\imagenes\resultadosFuncion1PF.png');
h=figure(4);
saveas(h, '.\MNL\NLExp\NLG\imagenes\erroresFuncion1PF.png');
h=figure(5);
saveas(h, '.\MNL\NLExp\NLG\imagenes\resultadosFuncion2.png');
h=figure(6);
saveas(h, '.\MNL\NLExp\NLG\imagenes\erroresFuncion2.png');
h=figure(7);
saveas(h, '.\MNL\NLExp\NLG\imagenes\resultadosFuncion2PF.png');
h=figure(8);
saveas(h, '.\MNL\NLExp\NLG\imagenes\erroresFuncion2PF.png');
h=figure(9);
saveas(h, '.\MNL\NLExp\NLG\imagenes\resultadoFuncion1NWM.png');
h=figure(10);
saveas(h, '.\MNL\NLExp\NLG\imagenes\erroresFuncion1NWM.png');







