%%  MATLAB Final Project
%   Levenberg - Marquardt Algorithm
%   George Ho

function [est_params, Jevals] = levenbergMarquardt(func, var, params, data, guess, tolerance)
    lambda = 0.01;              %   Damping factor
    incr_factor = 10;           %   Amount to increase lambda by
    decr_factor = 10;           %   Amount to decrease lambda by

    est_params = guess;         %   Running best estimate of parameters

    J = computeJacobian(func, var, params, data);
    evalJ = true;
    Jevals = 0;

    while Jevals < 100
        if evalJ
            %   Evaluate the Jacobian, J, at current est_params,
            %   compute relevant matrices and increase Jevals by 1
            J = vpa(subs(J, params, est_params));
            Jt = transpose(J);
            JtJ = Jt*J;
            Jevals = Jevals + 1;

            %   Evaluate the residuals, res, at current est_params
            est_func(var) = subs(func, params, est_params);
            y_est = vpa(est_func(data(:, 1)));
            res = data(:, 2) - y_est;
        end

        %   Compute delta,update the parameters and compute
        %   the residuals given by the updated parameters
        delta = inv(JtJ + lambda*diag(diag(JtJ)))*Jt*res;
        updated_params = est_params + delta;
        updated_func(var) = subs(func, params, updated_params);
        updated_y_est = vpa(updated_func(data(:, 1)));
        updated_res = data(:, 2) - updated_y_est;

        %   If the sum of squares of the updated residuals are less than
        %   that of the original residuals,
        %       1) Remember current est_params as prev_est_params
        %       2) Make current est_params the updated_params
        %       3) Decrease lambda
        %       4) Remember to re-evaluate J
        %   Otherwise
        %       1) Do not update anything
        %       2) Increase lambda
        %       3) Remember that there is no need to re-evaluate J
        if (sumsqr(updated_res) < sumsqr(res))
            prev_est_params = est_params;
            est_params = updated_params;
            lambda = lambda/decr_factor;
            evalJ = true;
        else
            lambda = lambda*incr_factor;
            evalJ = false;
        end

        %   If the sum of absolute differences between the
        %   updated parameters and the previous parameters is
        %   below the tolerance, we are done.
        if (Jevals > 1 && sum(abs(est_params - prev_est_params)) < tolerance)
            break
        end
    end
end