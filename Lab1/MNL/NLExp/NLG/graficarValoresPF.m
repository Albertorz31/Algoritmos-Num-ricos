function graficarValoresPF(punto_fijo,Aitken,Steffensen)
%CREATEFIGURE(Y1)
% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');

%Create plot
plot([punto_fijo],'-ob','MarkerSize',5,'MarkerFaceColor','b'); hold on;
plot([Aitken],'-*r','MarkerSize',5,'MarkerFaceColor','r'); hold on;
plot([Steffensen],'-pc','MarkerSize',5,'MarkerFaceColor','c'); hold on;
title('Raíces de la función')
ylabel('Raíces') % y-axis label
xlabel('Iteraciones') % x-axis label
legend('Punto Fijo','Aitken','Steffensen')
end