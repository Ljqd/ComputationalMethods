function [X, Y] = adamsSolver(dfunc, x0, u0, xn, n, side)
    if side == SideEnum.Left
        [X, Y] = adamsSolverLeft(dfunc, x0, u0, xn, n);
        return
    end
    [X, Y] = adamsSolverRight(dfunc, x0, u0, xn, n);
end

function [X, Y] = adamsSolverLeft(dfunc, x0, u0, xn, n)
    dx = (xn - x0) / n;
    X = x0:dx:xn;
    Y = u0;

    y0 = u0;
    y = y0;

    for i=2:length(X)

        if i == 2
            gamma = 0.5;
            A1 = gamma; A2 = 1 - gamma;
            K1 = dfunc(x0, y0);
            K2 = dfunc(x0 + dx / (2*gamma), y0 + dx / (2*gamma) * K1);

            y1 = y0 + dx * (A1 * K1 + A2 * K2);
        else
            y1 = y0 + dx/2 * (-dfunc(x0 - dx, y) + 3*dfunc(x0, y0));
        end
        x0 = x0 + dx;
        
        y = y0;
        y0 = y1;

        Y(i) = y0;
    end
end

function [X, Y] = adamsSolverRight(dfunc, x0, u0, xn, n)
    dx = (xn - x0) / n;
    X = x0:dx:xn;
    Y = u0;

    y0 = u0;

    for i=2:length(X)

        F = @(e)(e - dx/2 * (dfunc(x0, y0) + dfunc(x0 + dx, e)) - y0);
        y1 = newton(F, y0);
        x0 = x0 + dx;
        
        y0 = y1;

        Y(i) = y0;
    end
end