function graficarNewtonRaphsonMult2VError(valores, nombre)
%CREATEFIGURE(Y1)
% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');

% Create plot
plot([valores(1,:)],'-dg','MarkerSize',5,'MarkerFaceColor','g'); hold on;
title(nombre)
ylabel('Ra?ces') % y-axis label
xlabel('Iteraciones') % x-axis label
legend('Error')
end