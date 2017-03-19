%%  MATLAB Assignment 6
%   George Ho, 2/22/2017

%%  Question 1
b = [3/7 2/3 1/2];  % Numerator coeffs
a = [1/2 0 1/3 2];  % Denominator coeffs

%   Part a
[z, p, k] = tf2zp(b, a);

%   Part b
figure
zplane(z, p)
title('Pole-Zero Plot for H(z)');

%   Part c
[h, t] = impz(b, a, 50);
figure
stem(t, h)
title('Impulse Response for H(z)');
xlabel('n');
ylabel('h[n]');

%   Part d
x = (-1/2).^(0:49);
y1 = filter(b, a, x);
figure
subplot(2, 1, 1)
stem(t, y1)
title('x filtered by H(z)');
xlabel('n');
ylabel('y1[n]');

%   Part e
y2long = conv(h, x);
y2 = y2long(1:50);
subplot(2, 1, 2)
stem(t, y2)
title('x convolved with h');
xlabel('n');
ylabel('y2[n]');

%%  Question 2a
%   The difference equation is y[n] = x[n] + y[n-1] + y[n-2]
fib = zeros(1, 100);
fib(1) = 1;
fib(2) = 1;
for i = 3:100
    fib(i) = fib(i-1) + fib(i-2);
end
figure
semilogy(0:99, fib, '.')
title('Fibonacci Sequence')
xlabel('n')
ylabel('nth Fibonacci Number')

%%  Question 2b
%   H(z) = (z^2)/(z^2-z-1)
%   Zeros = 0 (multiplicity 2); Poles = 1/2 +/- sqrt(5)/2

bfib = [1 0 0];
afib = [1 -1 -1];

[z, p, k] = tf2zp(bfib, afib);

figure
zplane(z, p)
title('Pole-Zero Plot for Fibonacci System')

%   Assuming the system is realizable...
%   1) System is causal because the ROC contains infinity, or difference
%   equation needs only past/present values of input/output to compute the
%   present value of the output
%   2) System is not stable because ROC containing infinity does not 
%   contain unit circle, or difference equation takes a bounded input 
%   (impulse) and yields an unbounded output (impulse response)
