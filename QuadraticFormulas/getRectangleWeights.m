function weights = getRectangleWeights(a, b, n)
    % it's the same for central|right|left rectangle quadratic formulas
    if a > b
        error("centerRectangle: a > b");
    end

    step = (b - a) / n;
    weights = zeros(1, n - 1) * step;
end

