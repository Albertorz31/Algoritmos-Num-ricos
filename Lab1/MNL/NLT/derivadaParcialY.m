function [x] = derivadaParcialY(f,x0,y0)
   x = (f(x0,y0+0.00000001)- f(x0,y0))/0.00000001;
end