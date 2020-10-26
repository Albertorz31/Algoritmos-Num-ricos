function graficarErrores(trapecio,simpson13,simpson38)
%CREATEFIGURE(Y1)
% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');

% Create Plot
plot([trapecio],'-dg','MarkerSize',1,'MarkerFaceColor','g'); hold on;
plot([simpson13],'-*r','MarkerSize',5,'MarkerFaceColor','r'); hold on;
plot([simpson38],'-pc','MarkerSize',1,'MarkerFaceColor','c'); hold on;
title('Errores de la función')
ylabel('Errores') % y-axis label
xlabel('Iteraciones') % x-axis label
legend('Trapecio','Simpson 1/3','Simpson 3/8')

end
