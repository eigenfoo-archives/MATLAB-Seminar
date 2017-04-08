%%  MATLAB Final Project
%   Levenberg - Marquardt Algorithm
%   George Ho

function [est_params, Jevals] = levenbergMarquardt(func, var, params, data, guess, tolerance)
    %   DAMPING FACTOR AND UPDATE SCHEME:
    lambda = 0.01;      %   Damping factor
    incr_factor = 10;   %   Amount to increase lambda by
    decr_factor = 10;   %   Amount to decrease lambda by
    lambdaincrs = 0;    %   Number of lambda increases without a Jacobian evaluation

    est_params = guess; %   Running estimate of parameters
    evalJ = true;       %   Compute Jacobian at next iteration if true
    Jevals = 0;         %   Number of Jacobian evaluations so far
    J = computeJacobian(func, var, params, data);

    while Jevals < 50
        if evalJ
            %   Evaluate the Jacobian, J, at current est_params
            %   Compute relevant matrices and increase Jevals by 1
            J = vpa(subs(J, params, est_params));
            Jt = transpose(J);
            JtJ = Jt*J;
            Jevals = Jevals + 1;

            %   Evaluate the residuals, res, at current est_params
            est_func(var) = subs(func, params, est_params);
            y_est = vpa(est_func(data(:, 1)));
            res = data(:, 2) - y_est;
        end

        %   Compute delta,update the parameters the residuals given by the
        %   updated parameters
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
        %       5) Set lambda increases counter to 0
        %   Otherwise
        %       1) Do not update anything
        %           If we have increased lambda more than 50 times without
        %           a Jacobian evaluation (and suspect runaway growth)
        %               2) Throw an error
        %           Otherwise
        %               2) Increase lambda
        %               3) Increment the lambda increase counter
        %               4) Remember that there is no need to re-evaluate J
        if (sumsqr(updated_res) < sumsqr(res))
            prev_est_params = est_params;
            est_params = updated_params;
            lambda = lambda/decr_factor;
            lambdaincrs = 0;
            evalJ = true;
        else
            if (lambdaincrs >= 50)
                error('Runaway lambda growth: refine initial guess or update scheme');
            else
                lambda = lambda*incr_factor;
                lambdaincrs = lambdaincrs + 1;
                evalJ = false;
            end
        end

        %   If the sum of absolute differences between the updated 
        %   parameters and the previous parameters is below the tolerance,
        %   we are done.
        if (Jevals > 1 && sum(abs(est_params - prev_est_params)) < tolerance)
            break
        end
    end
end