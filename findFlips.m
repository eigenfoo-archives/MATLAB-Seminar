%%  MATLAB Assignment 3
%   George Ho, 2/2/2017
%   Question 3 Part b) Function

function flips = findFlips(x)
    y = (x >= 0);
    original = y(1:end-1);
    shifted = y(2:end);
    flips = find(xor(original, shifted));
end