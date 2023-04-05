function result = centerRectangleCalculator(func, a, b, n)

    if a > b
        error("centerRectangle: a > b");
    end

    result = 0;
    step = (b - a) / n;

    xi = a;
    xj = a + step;

    for i=1:n
        xm = (xi + xj) / 2;
        result = result + func(xm) * step;
        xi = xj;
        xj = xj + step;
    end
end

