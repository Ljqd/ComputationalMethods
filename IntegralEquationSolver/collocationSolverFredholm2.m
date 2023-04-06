function [X, Y] = collocationSolverFredholm2(lambda, core, a, b, rightFunc, n, quadFormula)    
    % u(x) - lambda \int_a^b K(x, t) u(t) dt = f(x)

    % TO DO:
    % - lambda != 0
    % - 

    % create grid
    X = linspace(a, b, n);
    n = length(X);

    collocationGrid = zeros(1, n);
    for i=1:n - 1
        collocationGrid(i) = (X(i) + X(i + 1)) / 2;
    end
    collocationGrid(end) = X(end);

    %
    A = zeros(n, n);
    F = zeros(n, 1);
    for i=1:n
        for j=1:n
            A(i, j) = -lambda * collocationGrid(j) * core(collocationGrid(i), collocationGrid(j));
        end
        % kronecker
        A(i, i) = 1 + A(i, i);
        F(i, 1) = rightFunc(collocationGrid(i));
    end

    % solve SLR
    Y = linsolve(A, F);
end