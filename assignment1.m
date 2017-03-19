%%  Assignment 1
%   By George Ho
%   1/18/17
%%  Part 1
a = 5.7*pi/6.9;
b = 239 + exp(5) - 2.5e23;
c = log(4.23)*asin(0.7);
z = (3+2j)*(4+5j);
%%  Part 2
real(z)
imag(z)
abs(z)
angle(z)
conj(z)
%%  Part 3
aVec = [3.14 15 9 26+0.1j];
A1 = repmat(aVec, 3, 1);
A2 = [aVec; aVec; aVec];
bVec1 = [3.14; 15; 9; 26+0.1j];
bVec2 = transpose(aVec);
cVec = -5:0.1:5;
dVec = linspace(-5, 5, 100);
B = [1+2j 1e-5; exp(j*2*pi) 3+4j];
% eye(1000000);                 commented so script can run without error
speye(1000000);
%%  Part 4
A = magic(5)/65;
B = randn(5);
C = B*A;
D = B.*A;
F = (1/4)*A^3 + (1/4)*A^2 + (1/3)*A + (1/6)*eye(5);
G = inv(A);