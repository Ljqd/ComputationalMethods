function y0 = newton(f, y0)
    eps = 10^(-9);

    depth = 300; k = 0;
    while f(y0) ~= 0 && k < depth 
        df = (f(y0 + eps) - f(y0)) / eps;

        y0 = y0 - f(y0) / df;
        k = k + 1;
    end
end