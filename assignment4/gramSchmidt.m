%%  MATLAB Assignment 4
%   George Ho 2/8/2017
%   Question 1a)

function orthnorm = gramSchmidt(vectors)
    [m, n] = size(vectors);
    orthnorm = zeros(m, n);
    orthnorm(:, 1) = vectors(:, 1)/norm(vectors(:, 1));
    for i = 2:n
        w = vectors(:, i);
        sum = zeros(m, 1);
        for j = 1:i-1
            v = orthnorm(:, j);
            sum = sum + (dot(v, w)/(norm(v))^2)*v;
        end
        orthnorm(:, i) = (w - sum)/norm(w - sum);
    end
end
