function result = trapezoid(func, a, b, n)

    if a > b
        error("centerRectangle: a > b");
    end
    
    result = 0;
    step = (b - a) / n;

    xi = a;
    xj = a + step;

    for i=1:n
        result = result + (func(xj) + func(xi))/2 * step;
        xi = xj;
        xj = xj + step;
    end
end