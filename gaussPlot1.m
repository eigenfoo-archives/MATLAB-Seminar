%%  MATLAB Assignment 4
%   George Ho 2/8/2017
%   Question 1e) helper function
%   This function was modified from the code written in lab on 2/8/2017.

function matrix = gaussPlot1(x, mus, sigma)
    figure
    matrix = zeros(length(x), length(mus));
    hold on
    for i = 1:length(mus)
        matrix(:, i) = 1/sqrt(2*pi*sigma)*exp(-(x-mus(i)).^2/(2*sigma^2));
        legendString = ['\mu = ', num2str(mus(i)),' \sigma = ',num2str(sigma)];
        plot(x, matrix(:, i), 'DisplayName', legendString)
    end
end