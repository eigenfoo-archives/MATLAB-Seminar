%%  MATLAB Assignment 4
%   George Ho 2/8/2017

%% Part d)

testVec = rand(5, 1) + 1j*rand(5, 1);

vectors1 = rand(5, 3) + 1j*rand(5, 3);
orthnorm1 = gramSchmidt(vectors1);
isOrthonormal(orthnorm1)
proj1 = orthoProj(testVec, orthnorm1);
error1 = norm(testVec - proj1);

vectors2 = rand(5, 5) + 1j*rand(5, 5);
orthnorm2 = gramSchmidt(vectors2);
isOrthonormal(orthnorm2)
proj2 = orthoProj(testVec, orthnorm2);
error2 = norm(testVec - proj2);

table(error1, error2)
%% Part e)

clear

x = linspace(0, 2*pi, 100);
sin = sin(x);

gausses = gaussPlot1(x, 0:pi/2:2*pi, 1);
plot(x, sin, 'DisplayName', 'sin(x)')
xlabel('x')
ylabel('f(x)')
title('Sinusoid and Gaussians')
legend('show')

basis = gramSchmidt(gausses);
sinest = orthoProj(sin, basis);

figure;
subplot(2,2,1)
plot(x, sin)
xlabel('x')
ylabel('f(x)')
title('Sinusoid')

subplot(2,2,2)
plot(x, sinest)
xlabel('x')
ylabel('f(x)')
title('Estimated Sinusoid')

subplot(2,2,[3 4])
for i = 1:5
    plot(x, basis(:, i))
    hold on
end
xlabel('x')
ylabel('f(x)')
title('Orthonormal Basis')
