function graficarDatos(Df,Msal,nz,m)
val=0;
Df2 = [];

for j=1:m
     val=Df(nz-1,j);
     Df2=[Df2,val];
end
    

%CREATEFIGURE(Y1)
% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');

% Create Plot
plot([Df2],'-dg','MarkerSize',1,'MarkerFaceColor','g'); hold on;
plot([Msal],'-*r','MarkerSize',5,'MarkerFaceColor','r'); hold on;
title('Resultados')
ylabel('Proteina') % y-axis label
xlabel('Tiempo') % x-axis label
legend('Proteina','Modulacion de sal')