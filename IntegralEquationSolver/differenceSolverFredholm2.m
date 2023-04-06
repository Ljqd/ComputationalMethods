function [X, Y] = collocationSolverFredholm2(lambda, core, a, b, rightFunc, n, quadFormula)    
    % u(x) - lambda \int_a^b K(x, t) u(t) dt = f(x)

    % TO DO:
    % - lambda != 0
    % - 

    % create grid
    X = linspace(a, b, n);
    weights = quadFormula(a, b, n);

    %
    A = zeros(length(X), length(X));
    F = zeros(length(X), 1);
    for i=1:length(X)
        for j=1:length(X)
            A(i, j) = -lambda * weights(j) * core(X(i), X(j));
        end
        % kronecker
        A(i, i) = 1 + A(i, i);
        F(i, 1) = rightFunc(X(i));
    end

    % solve SLR
    Y = linsolve(A, F);
end