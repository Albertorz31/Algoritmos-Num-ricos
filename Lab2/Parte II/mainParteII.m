
clc,clear

%Parte II del laboratorio 

%Parametros
Co = 2; %Concentracion inicial de proteina (mg/mL)
cv = 10; %Largo del gradiente de sal (volumenes de columna
F = 7.5; %Flujo volumetrico de la fase movil (mL/min)
vm = 2; %Volumen de inyeccion de la muestra (mL)
vlavado =  15; %Volumen de lavado (mL)
Cosal = 0.001; %Concentracion inicial de sal
Cfsal = 2; %Concentracion final de sal
BSA=1;
Hb=0;


%Parametros numericos 
%Numero de intervalos en la direccion de la columna (z)
nz=20; %se varia 
nr=2; %Numero de nodos de colocacion interna
z=1;
dz = 2*(z-0)/(nz-1);

%Parametros de la matriz / columna 
Cinf= 21/66000; %Capacidad maxima de la columna
d = 1.784;     % Diametro de la columna (cm) Usando frontal surface area
L = 0.4; %Largo de la columna (cm)
Eb = 0.947;     % Fraccion de huecos de la columna () segun Yang Etzel 2003
Rp = 3e-4/2; %Radio del poro (cm) valor minimo segun Orr2013
dporo  = 3.e4; % Diametro de macroporo de la particula de adsorbene (A)
Vloop  = 0.280;    % Volumen de las mangueras que conectan la columna al equipo (mL)
%Parametros de la fase movil
ro =  0.99823; % Densidad (g/cm^3)
mu = 0.01005; % Viscosidad (g/(cm*s))


%Necesarios para la determinacion de adimencionales 
N = BSA+Hb; %Numero de proteinas. La sal es el componente N+1
Ep = ones(1,N); %Crea una matriz de puros uno con 1 fila y N columnas
K = ones(1,N);
PM = ones(1,N);
i=1;
if(BSA==1)
    Ep(i) = 0.55;
    K(i)= 0.0012; %mg/(maU*mL)
    PM(i)= 14300;
    i;
end
Vol_col = pi*(d^2/4)*L; % Volumen de la columna (m^3)
v  = 4*F/(pi*d^2*Eb);  % Velocidad intersticial de la fase movil (m/s)
%Calculo de numeros adimensionales
Dax = 1e-7;
Pe  = L*v/Dax;  %Numero de Peckett
keff = 1e-3;
xi  = (keff)*(L/v)*(1-Eb)/Eb;
t_fin=6;

% Factores para adimensionar variables temporales y de concentracion
factor_tpo = L/v;
Coi = Co./PM; % La concentraci?n maxima de proteinas equivale a su concentracion inicial

%Adimensionamiento de variables temporales 
tinyeccion= (vm/F)/factor_tpo;  %Tiempo adimencional de inyeccion
t_igrad = (vlavado+vm+Vloop+Vol_col)/F; %Tiempo en el que empieza la gradiente 
tlavado = (t_igrad)/factor_tpo;  % Tiempo adimensional de lavado (antes de inicio del gradiente)
tgrad  = cv*Vol_col/F;  % Tiempo de duracion del gradiente
telucion  = (tgrad)/factor_tpo ;   
telucion0  = (tgrad)/factor_tpo ; % Tiempo adimensional de duracion del gradiente 
tfin  = t_fin/factor_tpo;      % Tiempo adimensional al cual termina la cromatografia

%condicion inicial
%En la fase movil  
ciProt = zeros(1,N*nz);  %Proteinas (Ci=0)
ciSal= Cosal*ones(1,nz); %sal(Ci=Csal)
%En la parte liquida
ciPartProt=zeros(1,N*nz*nr);
%En la parte solida
ciadProt=zeros(1,N*nz*nr);
c_i= [ciProt ciSal ciPartProt ciadProt];

t=100;

[Df,Msal,costo,errores]= DifFinitas(Co,t_fin,L,nz,t,tinyeccion,tlavado,telucion,Pe,Cosal,Coi,Cfsal);


%Se calcula el error final
large = length(errores);
errorFinal= errores(large)/large;

%Graficar elucion y modulacion
graficarDatos(Df,Msal,nz,t);

% f=figure(1);
% saveas(f,'.\Parte II\imagenes\grafico3d.png');
% f=figure(2);
% saveas(f,'.\Parte II\imagenes\resultado1.png');






