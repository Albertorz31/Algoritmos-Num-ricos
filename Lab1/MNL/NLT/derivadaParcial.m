function [x] = derivadaParcialX(f,x0,y0)
   x = (f(x0 + 0.00001,y0)- f(x0,y0))/0.00001;
end