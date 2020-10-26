clear,clc

%Funcion a evaluar 
func= @(x) 2^x - 4*x;

%En esta primera parte del laboratorio se ingresan los parametros siendo:
%-t = tolerancia.
%-a = punto inicial del intervalo
%-b = punto final del intervalo

tol = input('Ingrese la toleracia: ');
a = input ('Ingrese punto inicial del intervalo: ');
b = input ('Ingrese punto final del intervalo: ');


%Parten todas la iteraciones de las 3 forma de calculo en 0
iteT = 0; %Numero de iteraciones del trapecio
iteS13 = 0; %Numero de iteraciones de Simpson 1/3
iteS38 = 0; %Numero de iteraciones de Simpson 3/8

%Guardo los errores
errorT=[];
errorS13=[];
errorS38=[];

%funciones de trapecio, simpson 1/3 y simpson 3/8
[valorTrapecio,iteT,errorT]=IntegralTrapecio(a,b,tol,iteT,func,errorT);
[valorSimpson13,iteS13,errorS13]=IntegralSimpson13(a,b,tol,iteS13,func,errorS13);
[valorSimpson38,iteS38,errorS38]=IntegralSimpson38(a,b,tol,iteS38,func,errorS38);

%Llamado a las graficas de las funciones
graficarErrores(errorT,errorS13,errorS38);

%Guardamos los resultados de las funciones
% h=figure(1);
% saveas(h,'.\Parte I\imagenes\erroresFuncion.png');


