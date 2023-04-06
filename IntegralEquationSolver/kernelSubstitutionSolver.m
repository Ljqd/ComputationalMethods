function [X, Y] = kernelSubstitutionSolver(lambda, kernel, a, b, rightFunc, n, quadFormula)    
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
        [Ak(:, i), Bk(:, i)] = kernel(X(i), 0);
        F(i, 1) = rightFunc(X(i));
    end

    for i=1:length(X)
        for j=1:length(X)
            s = 0;
            for k=1:length(X)
                s = s + weights(j) * Ak(j, k) * Bk(j, k);
            end
            A(i, j) = -lambda * s;
        end
        % kronecker
        A(i, i) = 1 + A(i, i);

        s = 0;
        for k=1:n
            s = s + weights(k) * F(k) * Bk(i, k);
        end
    end

    % solve SLR
    Y = linsolve(A, F);
end