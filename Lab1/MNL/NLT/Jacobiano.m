function [x] = Jacobiano(f1,f2,x0,y0)
    devParF1deX = derivadaParcialX(f1,x0,y0);
    devParF1deY = derivadaParcialY(f1,x0,y0);
    devParF2deX = derivadaParcialX(f2,x0,y0);
    devParF2deY = derivadaParcialY(f2,x0,y0);
    x = abs((devParF2deY*devParF1deX)-(devParF2deX*devParF1deY));
end