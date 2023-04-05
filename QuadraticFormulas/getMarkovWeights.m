function weights = getMarkovWeights(a, b, n)
    if n < 2 || n > 6
        error("markov: n < 2 or n > 6");
    end

    if a > b
        error("markov: a > b");
    end

    % set weights and nodes
    weights = ones(1, n);
    switch n
        case 3 
            weights = [1, 4, 1] ./ 3; 
        case 4 
            weights = [1, 5, 5, 1] ./ 6; 
        case 5 
            weights = [9, 49, 64, 49, 9] ./ 90; 
        case 6 
            weights(6) = 0.06666667; weights(1) = weights(6); 
            weights(5) = 0.37847496; weights(2) = weights(5); 
            weights(4) = 0.55485837; weights(3) = weights(4); 
    end

    % transform if [a, b] != [-1, 1]
    if a ~= -1 || b ~= 1        
        weights = 0.5 .* (b - a) .* weights;
    end
end