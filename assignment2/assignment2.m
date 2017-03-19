%%  MATLAB Assignment 2
%   George Ho, 1/25/17

%%  Question 1
%   a)
x = linspace(0, 1, 100);
y = exp(x);

%   b)
traparea = trapz(y)*(1/99);
rectarea = sum(y)*(1/99);

%   c)
trapint = cumtrapz(y)*(1/99);
rectint = cumsum(y)*(1/99);

%   d)
deriv1 = diff(y)/(1/99);           % deriv1 has 99 elements
deriv2 = diff(deriv1)/(1/99);      % deriv2 has 98 elements

%   e)
v = [0 1 2 3 4 5];
shiftv = circshift(v, 3, 2);

%%  Question 2
%   a)
A = 1:100;
A = reshape(A, 10, 10);

%   b)
B = magic(10);
C = diag(diag(B));

%   c)
B(:, 2) = flipud(B(:, 2));

%   d)
A = fliplr(A);

%   e)
cSum = sum(A*B);

%   f)
cMean = mean(A*B, 2);

%   g)
A(:, end) = [];

%%  Question 3
%   a)
tic
for i = 1:300
    for j = 1:500
        X(i, j) = (i.^2 + j.^2) / (i+j+3);
    end
end
timea = toc;

%   b)
tic
Y = zeros(300, 500);
for i = 1:300
    for j = 1:500
        Y(i, j) = (i.^2 + j.^2) / (i+j+3);
    end
end
timeb = toc;

%   c)
tic
a = 1:500;
b = 1:300;
[ahat, bhat] = meshgrid(a, b);
numer = ahat.^2 + bhat.^2;
denom = ahat + bhat + repmat(3, 300, 500);
Z = numer./denom;
timec = toc;

table(timea, timeb, timec)
