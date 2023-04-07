function [X, Y] = runge4EulerSolver(dfunc, x0, u0, xn, n)
    dx = (xn - x0) / n;
    X = x0:dx:xn;
    Y = u0;

    [A1, A2, A3, A4] = deal(1/6, 1/3, 1/3, 1/6);

    y0 = u0;
    for i=2:length(X)
        K1 = dfunc(x0, y0);
        K2 = dfunc(x0 + dx / 2, y0 + dx / 2 * K1);
        K3 = dfunc(x0 + dx / 2, y0 + dx / 2 * K2);
        K4 = dfunc(x0 + dx, y0 + dx * K3);

        y1 = y0 + dx * (A1 * K1 + A2 * K2 + A3 * K3 + A4 * K4);
        x0 = x0 + dx;
        y0 = y1;
        Y(i) = y0;
    end
end