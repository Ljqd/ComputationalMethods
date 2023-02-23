classdef IntegralEvaluator < handle
    %INTEGRALEVALUATOR Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (SetAccess = private)
        quadraticFunction;
    end
    
    methods
        function obj = IntegralEvaluator(quadraticFunction)
            %INTEGRALEVALUATOR Construct an instance of this class
            %   Detailed explanation goes here
            obj.quadraticFunction = quadraticFunction;
        end

        function value = evaluate_uniform(obj, func, a, b, n)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            value = obj.quadraticFunction.evaluate_uniform(func, a, b, n);
        end
        
        function value = evaluate_custom(obj, func, points)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            value = obj.quadraticFunction.evaluate_custom(func, points);
        end

        function obj = setQuadraticFunction(obj, newQuadraticFunction)
            obj.quadraticFunction = newQuadraticFunction;
        end
    end

    methods (Static)
        function value = compute_with(grid)
            value = grid;
        end
    end
end