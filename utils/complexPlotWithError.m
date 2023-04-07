function complexPlotWithError(X, Y, explicitFunc, xLabel, yLabel, plotTitle)
    % xMin = min(X); xMax = max(X);
    % yMin = min(Y); yMax = max(Y);

    if nargin == 3
        xLabel = "X";
        yLabel = "Y";
        plotTitle = "xOy plot";
    end

    % stupid, but I don't want to creat second method
    % no default arg - welcome to matlab :/
    if nargin == 4
        plotTitle = xLabel;
        xLabel = "X";
        yLabel = "Y";
    end

    if nargin == 5
        plotTitle = "xOy plot";
    end

    fig = figure;
    fig.Position(3:4) = [800, 400];
    subplot(1, 2, 1);
    
    Y0 = explicitFunc(X);
    error = Y - Y0;

    subplot(1, 2, 1);


    plot(X, Y);
    xlim([min(X), max(X)]);

    xlabel(xLabel);
    ylabel(yLabel);
    title(plotTitle);
    
    grid on;

    subplot(1, 2, 2);
    plot(X, error, 'r');
    xlim([min(X), max(X)]);

    xlabel(xLabel);
    ylabel(yLabel);
    title("Error");
    
    grid on;
end