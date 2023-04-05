function weights = getGaussChristoffelWeights(a, b, n)
    if n < 1 || n > 6
        error("gaussChristoffel: n < 1 or n > 6");
    end

    if a > b
        error("gaussChristoffel: a > b");
    end

    % set weights and nodes
    switch n
        case 1
            weights = 2;
        case 2
            weights = [1, 1];
        case 3
            weights = [0.555556, 0.888889, 0.555556];
        case 4
            weights = [0.347855, 0.652145, 0.652145, 0.347855];
        case 5
            weights = [0.236927, 0.478629, 0.568889, 0.478629, 0.236927];
        case 6
            weights = [0.171324, 0.360762, 0.467914, 0.467914, 0.360762, 0.171324];
    end

    % transform if [a, b] != [-1, 1]
    if a ~= -1 || b ~= 1
        weights = 0.5 .* (b - a) .* weights;
    end
end