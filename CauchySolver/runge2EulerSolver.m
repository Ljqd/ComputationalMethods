function [X, Y] = runge2EulerSolver(dfunc, x0, u0, xn, n)
    dx = (xn - x0) / n;
    X = x0:dx:xn;
    Y = u0;

    gamma = 0.5;
    A1 = gamma; A2 = 1 - gamma;

    y0 = u0;
    for i=2:length(X)
        K1 = dfunc(x0, y0);
        K2 = dfunc(x0 + dx / (2*gamma), y0 + dx / (2*gamma) * K1);

        y1 = y0 + dx * (A1 * K1 + A2 * K2);
        x0 = x0 + dx;
        y0 = y1;
        Y(i) = y0;
    end
end