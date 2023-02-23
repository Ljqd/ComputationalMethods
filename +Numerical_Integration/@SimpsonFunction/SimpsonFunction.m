classdef SimpsonFunction < Numerical_Integration.QuadraticFunction
    %TRAPEZOIDALFUNCTION Summary of this class goes here
    %   Detailed explanation goes here    
    methods        
        function output = evaluate_uniform(obj, func, a, b, n)
            % output = symsum(func, a, b, n);

            trapez = Numerical_Integration.TrapezoidalFunction();
            output = 1/3*( ...
                4*trapez.evaluate_uniform(func, a, b, n) - trapez.evaluate_uniform(func, a, b, fix(n/2)) ...
            );
        end

        function output = evaluate_custom(obj, func, points)
            % output = symsum(func, a, b, n);
            
            % just drop each second point
            widerPoints = points(1:2:end);

            trapez = Numerical_Integration.TrapezoidalFunction();
            output = 1/3*( ...
                4*trapez.evaluate_custom(func, points) - trapez.evaluate_custom(func, widerPoints) ...
            );
        end
    end
end

