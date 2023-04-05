function complexPlot(X, Y, xLabel, yLabel, plotTitle)
    % xMin = min(X); xMax = max(X);
    % yMin = min(Y); yMax = max(Y);

    if nargin == 2
        xLabel = "X";
        yLabel = "Y";
        plotTitle = "xOy plot";
    end

    % stupid, but I don't want to creat second method
    % no default arg - welcome to matlab :/
    if nargin == 3
        plotTitle = xLabel;
        xLabel = "X";
        yLabel = "Y";
    end

    if nargin == 4
        plotTitle = "xOy plot";
    end

    plot(X, Y);

    xlabel(xLabel);
    ylabel(yLabel);
    title(plotTitle);
    
    grid on;
end