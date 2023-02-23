classdef TrapezoidalFunction < Numerical_Integration.QuadraticFunction
    %TRAPEZOIDALFUNCTION Summary of this class goes here
    %   Detailed explanation goes here    
    methods        
        function output = evaluate_uniform(obj, func, a, b, n)
            % output = symsum(func, a, b, n);
            
            output = 0;
            step = (b - a) / n;
            xi = a; xj = a + step;

            for i=1:n
                output = output + 0.5 * (func(xi) + func(xj)) * step;
                xi = xi + step;
                xj = xj + step;
            end
        end

        function output = evaluate_custom(obj, func, points)
            % output = symsum(func, a, b, n);
            
            output = 0;

            for i=1:length(points)-1
                xi = points(i);
                xj = points(i + 1);
                step = (xj - xi);
                output = output + 0.5 * (func(xi) + func(xj)) * step;
            end
        end
    end
end

