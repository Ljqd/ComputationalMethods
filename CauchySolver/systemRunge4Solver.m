function [X1, Y1, X2, Y2] = systemRunge4Solver(df, x1, u1, dg, x2, u2, xn, n)
    [X1, Y1] = runge4EulerSolver(df, x1, u1, xn, n);
    [X2, Y2] = runge4EulerSolver(dg, x2, u2, xn, n);
end