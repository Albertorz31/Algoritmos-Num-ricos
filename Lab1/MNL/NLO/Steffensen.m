function Xval = Steffensen(x1,x2,x3)
    Xval= x1 - (((x2 - x1)^2) / (x3-2*x2+x1));
end