%%  MATLAB Final Project
%   Test Cases for Implementation of Levenberg-Marquardt Algorithm
%   George Ho
%
%   This file runs the three test cases, outlined in the proposal.
%   Documentation, results and comments are discussed in the readme file.

%%  TEST CASE 1: POISSON
rate = 3;

data = zeros(20, 2);
data(:, 1) = transpose(1:20);
data(:, 2) = transpose(pdf('Poisson', 1:20, rate)) + 0.0005*normrnd(20, 1);

syms lambda x;
func = (lambda^x)*(exp(-lambda))/(factorial(x));
params = [lambda];
guess = [5];

[params1, Jevals1] = levenbergMarquardt(func, x, params, data, guess, 0.01);
params1
Jevals1

%%  TEST CASE 2: NORMAL
mu = 1;
sigma = 3;

data = zeros(100, 2);
data(:, 1) = transpose(linspace(-20, 20, 100));
data(:, 2) = normpdf(data(:, 1), mu, sigma) + 0.002.*randn(100, 1);

syms mu sigma x;
func = (1/(2*pi*sigma))*exp((-1/2)*((x-mu)/sigma).^2);
params = [mu; sigma];
guess = [0; 1];

[params2, Jevals2] = levenbergMarquardt(func, x, params, data, guess, 0.005);
params2
Jevals2

%%  TEST CASE 3: SINUSOID
A = 1;
B = 2;
C = 3;
D = 4;

data = zeros(100, 2);
data(:, 1) = transpose(linspace(0, 2*pi, 100));
data(:, 2) = A*sin(B*data(:, 1)+C)+D + normrnd(0, 1, 100, 1);

syms A B C D x;
func = symfun(A*sin(B*x+C)+D, x);
params = [A; B; C; D];
guess = [2.5; 2.5; 2.5; 2.5];

[params3, Jevals3] = levenbergMarquardt(func, x, params, data, guess, 0.01);
params3
Jevals3
