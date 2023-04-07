function [X, Y] = eulerSolver(dfunc, x0, u0, xn, n, side)
    if x0 >= xn
        error("eulerSolver: x0 >= xn");
    end


    if side == SideEnum.Left
        [X, Y] = eulerSolverLeft(dfunc, x0, u0, xn, n);
        return
    end

    if side == SideEnum.Center
        [X, Y] = eulerSolverCenter(dfunc, x0, u0, xn, n);
        return
    end
    
    [X, Y] = eulerSolverRight(dfunc, x0, u0, xn, n);
end

function [X, Y] = eulerSolverLeft(dfunc, x0, u0, xn, n)
    dx = (xn - x0) / n;
    X = x0:dx:xn;
    Y = u0;

    y0 = u0;
    for i=2:length(X)
        y1 = y0 + dx * dfunc(x0, y0);
        x0 = x0 + dx;
        y0 = y1;
        Y(i) = y0;
    end
end

function [X, Y] = eulerSolverCenter(dfunc, x0, u0, xn, n)
    dx = (xn - x0) / n;
    X = linspace(x0, xn, n);
    Y = u0;

    y0 = u0;
    for i=2:length(X)

        if i == 2
            y1 = y0;
        else
            F = @(y)(y - dx*(dfunc(x0, y0) + dfunc(x0 + dx, y))/2 - y0);
            y1 = newton(F, y0);
        end

        y0 = y1;
        x0 = x0 + dx;
        Y(i) = y0;
    end
end

function [X, Y] = eulerSolverRight(dfunc, x0, u0, xn, n)
    dx = (xn - x0) / n;
    X = linspace(x0, xn, n);
    Y = u0;

    y0 = u0;
    for i=2:length(X)
        x0 = x0 + dx;

        if i == 2
            y1 = y0;
        else
            F = @(y)(y - dx*dfunc(x0, y) - y0);
            y1 = newton(F, y0);
        end

        y0 = y1;
        Y(i) = y0;
    end
end