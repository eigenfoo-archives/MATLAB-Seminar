%%  MATLAB Assignment 4
%   George Ho 2/8/2017
%   Question 1c)

function estimate = orthoProj(vector, orthnorm)
    [m, n] = size(orthnorm);
    estimate = zeros(m, 1);
    for i = 1:n
        estimate = estimate + (dot(vector, orthnorm(:, i))).*orthnorm(:, i);
    end
end