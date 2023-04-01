function result = gaussChristoffel(func, a, b, n)
    result = 0;

    if n < 1 || n > 6
        error("gaussChristoffel: n < 1 or n > 6");
    end

    if a > b
        error("gaussChristoffel: a > b");
    end

    % set weights and nodes
    switch n
        case 1
            nodes = 0;
            weights = 2;
        case 2
            nodes = [-0.577350, 0.577350];
            weights = [1, 1];
        case 3
            nodes = [-0.774597, 0.000000, 0.774597];
            weights = [0.555556, 0.888889, 0.555556];
        case 4
            nodes = [-0.861136, -0.339981, 0.339981, 0.861136];
            weights = [0.347855, 0.652145, 0.652145, 0.347855];
        case 5
            nodes = [-0.906180, -0.538469, 0.000000, 0.538469, 0.906180];
            weights = [0.236927, 0.478629, 0.568889, 0.478629, 0.236927];
        case 6
            nodes = [-0.932470, -0.661209, -0.238619, 0.238619, 0.661209, 0.932470];
            weights = [0.171324, 0.360762, 0.467914, 0.467914, 0.360762, 0.171324];
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