clear,clc

error = 10^-15; %Error experimentado en el laboratorio

% se cargan los datos
%289
A1 = load('A289.dat');
b1 = load('b289.dat');
% %%%
% 
[SolucJacoM1, ErrorJacoM1, valorJacoM1,CostoJacoM1] = gaussJacobi(A1, b1, error);
[SolucSeiM1, ErrorSeiM1, valorSeiM1,CostoSeiM1] = gaussSeidel(A1, b1, error);
[valorQRM1, ErrorQRM1, CostoQRM1] = QR(A1, b1);
[valorChoM1, ErrorChoM1, CostoChoM1] = cholesky(A1, b1);
[valorDooM1, ErrorDooM1, CostoDooM1] = doolittle(A1, b1);
% 
disp('Ranking 289x289')
disp('Ranking 50% vs 50%')
[top1]=rankingSE(CostoJacoM1,CostoSeiM1,CostoChoM1,CostoDooM1,CostoQRM1,100,74,ErrorChoM1,ErrorDooM1,ErrorQRM1,50,50);
%Segundo porcentaje de distribucion %30 vs %70 de prioridades
disp('Ranking 30% vs 70%')
[top2]=rankingSE(CostoJacoM1,CostoSeiM1,CostoChoM1,CostoDooM1,CostoQRM1,100,74,ErrorChoM1,ErrorDooM1,ErrorQRM1,30,70);
%Tercer porcentaje de distribucion %90 vs %10 de prioridades
disp('Ranking 90% vs 10%')
[top3]=rankingSE(CostoJacoM1,CostoSeiM1,CostoChoM1,CostoDooM1,CostoQRM1,100,74,ErrorChoM1,ErrorDooM1,ErrorQRM1,90,10);

% %Grafico Valores 
graficarValoresIt(SolucJacoM1, SolucSeiM1, 'Aproximaciones sistema 289');
graficarValorDir(valorDooM1,valorChoM1, valorQRM1);
graficarErrores2(ErrorJacoM1, ErrorSeiM1);
% 
% %
% %
% %1089
% %
% %Se cargan los datos
A2 = load('A1089.dat');
b2 = load('b1089.dat');
% %%%
%
[SolucJacoM2, ErrorJacoM2, valorJacoM2,CostoJacoM2] = gaussJacobi(A2, b2, error);
[SolucSeiM2, ErrorSeiM2, valorSeiM2,CostoSeiM2] = gaussSeidel(A2, b2, error);
[valorDooM2, ErrorDooM2, CostoDooM2] = doolittle(A2, b2);
[valorChoM2, ErrorChoM2, CostoChoM2] = cholesky(A2, b2);
[valorQRM2, ErrorQRM2, CostoQRM2] = QR(A2, b2);
% 
disp('Ranking 1089x1089')
disp('Ranking 50% vs 50%')
[top4]=rankingSE(CostoJacoM2,CostoSeiM2,CostoChoM2,CostoDooM2,CostoQRM2,100,100,ErrorChoM1,ErrorDooM2,ErrorQRM2,50,50);
%Segundo porcentaje de distribucion %30 vs %70 de prioridades
disp('Ranking 30% vs 70%')
[top2]=rankingSE(CostoJacoM2,CostoSeiM2,CostoChoM2,CostoDooM2,CostoQRM2,100,100,ErrorChoM1,ErrorDooM2,ErrorQRM2,30,70);
%Tercer porcentaje de distribucion %90 vs %10 de prioridades
disp('Ranking 90% vs 10%')
[top3]=rankingSE(CostoJacoM2,CostoSeiM2,CostoChoM2,CostoDooM2,CostoQRM2,100,100,ErrorChoM1,ErrorDooM2,ErrorQRM2,90,10);


% %Grafico valores
graficarValoresIt(SolucJacoM2, SolucSeiM2, 'Aproximaciones sistema 1089');
graficarValores2(valorDooM2,valorChoM2, valorQRM2);
graficarErrores2(ErrorJacoM2, ErrorSeiM2);

%
%
%4225
% % 
A3 = load('A4225.dat');
b3 = load('b4225.dat');
% %%%
[SolucJacoM3, ErrorJacoM3, valorJacoM3,CostoJacoM3] = gaussJacobi(A3, b3, error);
[SolucSeiM3, ErrorSeiM3, valorSeiM3,CostoSeiM3] = gaussSeidel(A3, b3, error);
[valorDooM3, ErrorDooM3, CostoDooM3] = doolittle(A3, b3);
[valorChoM3, ErrorChoM3, CostoChoM3] = cholesky(A3, b3);
[valorQRM3, ErrorQRM3, CostoQRM3] = QR(A3, b3);
% 
% 
disp('Ranking 4225x4225')
disp('Ranking 50% vs 50%')
[top7]=rankingSE(CostoJacoM3,CostoSeiM3,CostoChoM3,CostoDooM3,CostoQRM3,100,100,ErrorChoM3,ErrorDooM3,ErrorQRM3,50,50);
%Segundo porcentaje de distribucion %30 vs %70 de prioridades
disp('Ranking 30% vs 70%')
[top8]=rankingSE(CostoJacoM3,CostoSeiM3,CostoChoM3,CostoDooM3,CostoQRM3,100,100,ErrorChoM3,ErrorDooM3,ErrorQRM3,30,70);
%Tercer porcentaje de distribucion %90 vs %10 de prioridades
disp('Ranking 90% vs 10%')
[top3]=rankingSE(CostoJacoM3,CostoSeiM3,CostoChoM3,CostoDooM3,CostoQRM3,100,100,ErrorChoM3,ErrorDooM3,ErrorQRM3,90,10);

% %Grafico Valores
graficarValoresIt(SolucJacoM3, SolucSeiM3, 'Aproximaciones sistema 4225');
graficarValorDir(valorDooM3,valorChoM3, valorQRM3);
graficarErrores2(ErrorJacoM3, ErrorSeiM3);

%guardamos los resultados de los sistemas de ecuaciones 
h=figure(1);
saveas(h,'.\SE\Exp\graficos\imagenes\resultadosValItM1.png');
h=figure(2);
saveas(h,'.\SE\Exp\graficos\imagenes\resultadosValDirM1.png');
h=figure(3);
saveas(h,'.\SE\Exp\graficos\imagenes\resultadosErrorM1.png');
h=figure(4);
saveas(h,'.\SE\Exp\graficos\imagenes\resultadosValItM2.png');
h=figure(5);
saveas(h,'.\SE\Exp\graficos\imagenes\resultadosValDirM2.png');
h=figure(6);
saveas(h,'.\SE\Exp\graficos\imagenes\resultadosErrorM2.png');
h=figure(7);
saveas(h,'.\SE\Exp\graficos\imagenes\resultadosItM3.png');
h=figure(8);
saveas(h,'.\SE\Exp\graficos\imagenes\resultadosValDirM3.png');
h=figure(9);
saveas(h,'.\SE\Exp\graficos\imagenes\resultadosErrorM3.png');

