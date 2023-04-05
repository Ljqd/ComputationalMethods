function result = chebyshevCalculator(func, a, b, n)
    result = 0;

    if n < 1 || n > 6
        error("chebyshev: n < 1 or n > 6");
    end

    if a > b
        error("chebyshev: a > b");
    end

    % set weights and nodes
    nodes = zeros(1, n);
    weights = 2 ./ n; 
    switch n 
        case 1 
        case 2 
            nodes(2) = 0.5773502691; nodes(1) = - nodes(2); 
        case 3 
            nodes(3) = 0.7071067812; nodes(1) = - nodes(3); 
        case 4 
            nodes(4) = 0.7946544723; nodes(1) = - nodes(4); 
            nodes(3) = 0.1875924741; nodes(2) = - nodes(3); 
        case 5 
            nodes(5) = 0.8324974870; nodes(1) = - nodes(5); 
            nodes(4) = 0.3745414096; nodes(2) = - nodes(4); 
        case 6 
            nodes(6) = 0.8662468181; nodes(1) = - nodes(6); 
            nodes(5) = 0.4225186538; nodes(2) = - nodes(5); 
            nodes(4) = 0.2666354015; nodes(3) = - nodes(4);
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