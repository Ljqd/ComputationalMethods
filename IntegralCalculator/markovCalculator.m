function result = markovCalculator(func, a, b, n)
    result = 0;

    if n < 2 || n > 6
        error("markov: n < 2 or n > 6");
    end

    if a > b
        error("markov: a > b");
    end

    % set weights and nodes
    nodes = linspace(-1, 1, n);
    weights = ones(1,  n);
    switch n
        case 3 
            C = [1, 4, 1] ./ 3; 
        case 4 
            nodes(3) = 1./5; nodes(2) = - nodes(3); weights = [1, 5, 5, 1] ./ 6; 
        case 5 
            nodes(4) = 3 ./ 7; nodes(2) = - nodes(4); weights = [9, 49, 64, 49, 9] ./ 90; 
        case 6 
            nodes(5) = 0.76505532; nodes(2) = - nodes(5); 
            nodes(4) = 0.28523152; nodes(3) = - nodes(4); 
            weights(6) = 0.06666667; weights(1) = weights(6); 
            weights(5) = 0.37847496; weights(2) = weights(5); 
            weights(4) = 0.55485837; weights(3) = weights(4); 
    end

    % transform if [a, b] != [-1, 1]
    if a ~= -1 || b ~= 1
        ab = 0.5 .* (a + b); % .* - element-wise multiplication
        ba = 0.5 .* (b - a); 
        
        nodes = ab + ba .* nodes;
        weights = ba .* weights;
    end

    % compute, finally
    for i=1:n
        result = result + weights(i) * func(nodes(i));
    end
end