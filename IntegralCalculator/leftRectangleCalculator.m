function result = leftRectangleCalculator(func, a, b, n)

    if a > b
        error("centerRectangle: a > b");
    end
    
    result = 0;
    step = (b - a) / n;

    xi = a;

    for i=1:n
        result = result + func(xi) * step;
        xi = xi + step;
    end
end