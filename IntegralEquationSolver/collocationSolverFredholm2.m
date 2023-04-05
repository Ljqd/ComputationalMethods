function [X, Y] = collocationSolverFredholm2(lambda, core, a, b, rightFunc, n)    
    % u(x) - lambda \int_a^b K(x, t) u(t) dt = f(x)

    % TO DO:
    % - lambda != 0
    % - 

    % create grid
    X = getGrid1D(a, b, n);

    %
    A = zeros(length(X) - 1, length(X) - 1);
    F = zeros(length(X) - 1, 1);
    for i=1:length(X) - 1
        for j=1:length(X) - 1
            node = core(X(i), X(j));
            weight = (core(X(i), X(j)) + core(X(i), X(j + 1)))/2 * (X(j + 1) - X(j));
            A(i, j) = -lambda * node * weight;
        end
        % kronecker
        A(i, i) = 1 + A(i, i);
        
        F(i, 1) = rightFunc(X(i));
    end

    % solve SLR
    Y = linsolve(A, F);
    X = X(1:end-1);
end