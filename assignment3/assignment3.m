%%  MATLAB Assignment 3
%   George Ho, 2/2/2017

%%  Question 1
%   Parts a), b)
A = true(100);
B = false(100);

%   Parts c), d)
[M N] = meshgrid(1:100, 1:100);
A = A & ~(sqrt((M-50).^2 + (N-50).^2) < 20);
B = B | (sqrt((M-40).^2 + (N-40).^2) < 20);

%   Part e)
figure
imshow(A)       % Black disc against white, centered
figure
imshow(B)       % White disc against black, off center
figure
imshow(A & B)   % White crescent against black, off center
figure
imshow(A | B)   % Black crescent against white, centered
figure
imshow(~(A&B))  % Black crescent against white, off center
figure
imshow(~(A|B))  % White crescent against black, centered

%%  Question 2
%   Function in findClosest.m (attached)
[ind, val] = findClosest(sin(linspace(0,5,100))+1, 3/2)

%%  Question 3
%   Part a)
x = linspace(-2*pi, 2*pi, 10001);
y = sinc(x);
figure
plot(x, y)

%   Part b) in findFlips.m (attached)

%   Part c)
inds = findFlips(y);
xRoots = x(inds);
yRoots = y(inds);
hold on     % Alternative to axis tight
plot(xRoots, yRoots, 'ko')

%   Part d)
dydx = diff(y);
inds = findFlips(dydx);
xMinMax = x(inds);
yMinMax = y(inds);
hold on     % Alternative to axis tight
plot(xMinMax, yMinMax, 'r*')
