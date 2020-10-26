function graficarErrores(biseccion, secante, regulaFalsi,newton)
%CREATEFIGURE(Y1)
% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');

% Create plot
plot([biseccion],'-ob','MarkerSize',5,'MarkerFaceColor','b'); hold on;
plot([secante],'-*r','MarkerSize',5,'MarkerFaceColor','r'); hold on;
plot([regulaFalsi],'-pc','MarkerSize',5,'MarkerFaceColor','c'); hold on;
plot([newton],'-dg','MarkerSize',5,'MarkerFaceColor','g'); hold on;
title('Errores de la función')
ylabel('Errores') % y-axis label
xlabel('Iteraciones') % x-axis label
legend('Bisección','Secante','Regula Falsi','Newton-Raphson')


end