function grid = rangeVector(a, b, n)
    if a > b
        error("rangeVector error: a > b")
    end

    step = (b - a) / n;
    grid = a:step:b;
end