classdef (Abstract) QuadraticFunction2D
    %QUADRAT Base class of a quadratic formula
    %   All quadratic formulas evenually converge to this formula:
    %       f(x) = sum_{i=a}^n C(x_i)f(x_i)
    %   where C(x_i) - weight or weight function
    %   
    %   this class provides a base type and an interface for different
    %   variations of quadratic formulas

    methods(Abstract)
        evaluate_uniform(func, a, b, n);
        evaluate_custom(func, points);
    end
end

