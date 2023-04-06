function weights = getSimpsonWeights(a, b, n)

    if a > b
        error("centerRectangle: a > b");
    end

    if n < 3
        error("getSimpsonWeights: n < 3")
    end

    if mod(n, 2) == 0
        % explicit error. I don't want to ask about 2k array,
        % and implicitly produce 2k + 1; So, it's method's invariant
        error("getSimpsonWeights: n != 2k + 1. Ask for appropriate simpson weights explicitly")
    end

    step = (b - a) / n;
    weights = ones(1, n) * (step / 3);

    for i=2:2:n-1
        weights(i) = weights(i) * 2;
        weights(i + 1) = weights(i + 1) * 4;
    end
end