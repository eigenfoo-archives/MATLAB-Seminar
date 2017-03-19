%%  MATLAB Assignment 5
%   George Ho, 2/18/2017
%   This code is the class definition for a kickstarter project. The two
%   methods plotTiers() and convertCurrency() are also included.

classdef kickstarter
    properties
        amtpledged
        by
        category
        currency
        goal
        City
        State
        numbackers
        pledgetier
        title
        url
    end
    methods
        function plotTiers(obj)
            x = [];
            y = [];
            for i = 1:length(obj.pledgetier)
                if any(obj.pledgetier{i}.pledge == x)
                    ind = find(obj.pledgetier{i}.pledge == x);
                    y(ind) = y(ind) + obj.pledgetier{i}.num_backers;
                else
                    x = [x, obj.pledgetier{i}.pledge];
                    y = [y, obj.pledgetier{i}.num_backers];
                end
            end
            bar(x, y)
        end
        function obj = convertCurrency(obj, convert_to)
            if strcmp([obj.currency convert_to], 'usdgbp')
                factor = 0.80;
            elseif strcmp([obj.currency convert_to], 'gbpusd')
                factor = 1/0.80;
            elseif strcmp([obj.currency convert_to], 'usdeur')
                factor = 0.95;
            elseif strcmp([obj.currency convert_to], 'eurusd')
                factor = 1/0.95;
            elseif strcmp([obj.currency convert_to], 'usdcad')
                factor = 1.31;
            elseif strcmp([obj.currency convert_to], 'cadusd')
                factor = 1/1.31;
            elseif strcmp([obj.currency convert_to], 'gbpeur')
                factor = 0.95/0.80;
            elseif strcmp([obj.currency convert_to], 'eurgbp')
                factor = 0.80/0.95;
            elseif strcmp([obj.currency convert_to], 'gbpcad')
                factor = 1.31/0.80;
            elseif strcmp([obj.currency convert_to], 'cadgbp')
                factor = 0.80/1.31;
            elseif strcmp([obj.currency convert_to], 'eurcad')
                factor = 1.31/0.95;
            elseif strcmp([obj.currency convert_to], 'cadeur')
                factor = 0.95/1.31;
            else
                factor = 1;
            end
            
            obj.amtpledged = factor*obj.amtpledged;
            obj.goal = factor*obj.goal;
            for i = 1:length(obj.pledgetier)
                obj.pledgetier{i}.pledge = factor*obj.pledgetier{i}.pledge;
            end
            obj.currency = convert_to;
        end
    end
end
