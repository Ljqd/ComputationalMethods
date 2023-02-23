classdef TrapezoidalFunction < QuadraticFunction2D
    %TRAPEZOIDALFUNCTION Summary of this class goes here
    %   Detailed explanation goes here    
    methods        
        function output = evaluate_uniform(func, a, b, n)
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

        function evaluate_custom(func, points)
            % output = symsum(func, a, b, n);
            
            output = 0;
            xi = points(1);
            xj = points(2);

            for i=2:n-1
                step = (xj - xi);
                output = output + 0.5 * (func(xi) + func(xj)) * step;
                xi = points(i);
                xj = points(i+1);
            end
        end
    end
end

