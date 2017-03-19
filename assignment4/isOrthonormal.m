%%  MATLAB Assignment 4
%   George Ho 2/8/2017
%   Question 1b)

function result = isOrthonormal(vectors)
    [m, n] = size(vectors);
    result = 1;
    for i = 1:n
        for j = i+1:n
            if dot(vectors(:, i), vectors(:, j)) > eps('single')
                result = 0;
            end
        end
    end
end
