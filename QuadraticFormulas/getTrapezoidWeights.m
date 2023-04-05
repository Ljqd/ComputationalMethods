function weights = getTrapezoidWeights(a, b, n)

    if a > b
        error("centerRectangle: a > b");
    end
    
    step = (b - a) / n;
    weights = ones(1, n) * step;
    weights(1) = weights(1) / 2;
    weights(n) = weights(n) / 2;
end