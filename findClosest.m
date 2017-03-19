%%  MATLAB Assignment 3 
%   George Ho, 2/2/2017
%   Question 2 Function

function [val, ind] = findClosest(x, desiredValue)
    y = x(:);
    err = abs(y - desiredValue);
    ind = find(err == min(err));
    val = y(ind);
end