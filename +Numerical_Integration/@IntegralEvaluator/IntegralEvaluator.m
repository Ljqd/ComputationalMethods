classdef IntegralEvaluator
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
        
        function value = compute(grid)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            value = grid;
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