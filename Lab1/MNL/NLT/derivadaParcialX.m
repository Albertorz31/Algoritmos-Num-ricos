function [x] = derivadaParcialX(f,x0,y0)
   x = (f(x0 + 0.00000001,y0)- f(x0,y0))/0.00000001;
end