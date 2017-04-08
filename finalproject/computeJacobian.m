%%  MATLAB Final Project
%   Helper function to compute Jacobian.
%   George Ho

function J = computeJacobian(func, var, params, data)
    [n ~] = size(data);
    Jsym = jacobian(func, params);
    J = sym(zeros(n, length(params)));
    for i = 1:length(data)
        J(i,:) = subs(Jsym, var, data(i, 1));
    end
end