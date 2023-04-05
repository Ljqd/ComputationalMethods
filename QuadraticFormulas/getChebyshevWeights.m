function weights = getChebyshevWeights(a, b, n)
    if n < 1 || n > 6
        error("chebyshev: n < 1 or n > 6");
    end

    if a > b
        error("chebyshev: a > b");
    end

    weights = 2 ./ n; 
    % transform if [a, b] != [-1, 1]
    if a ~= -1 || b ~= 1
        weights = 0.5 .* (b - a) .* weights;
    end
end