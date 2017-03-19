%%  MATLAB Final Project
%   George Ho
%   Helper function to compute Jacobian.
%   
%   func = symbolic function of distributions
%   var = variable of which func is a function (usually x)
%   params = column vector of parameters
%   data = matrix of data, x and y values along the top

function J = computeJacobian(func, var, params, data)
    [n ~] = size(data);
    Jsym = jacobian(func, params);
    J = sym(zeros(n, length(params)));
    for i = 1:length(data)
        J(i,:) = subs(Jsym, var, data(i, 1));
    end
end