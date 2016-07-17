%{ ----------  Info  ---------- %}
% @author MehrdadFI <http://m3hrdadfi.com>
% @date 04-Mar-2016
% @title Discriminant Function for the Normal Density:: Case 3:

clc; clear; close all;

%% Definition
p1 = 0.5;
p2 = 0.5;

N = 300;

MU1 = [3; 3];
MU2 = [-3; -3];

SIGMA1 = [0.5 0; 0 2];
SIGMA2 = [2 0; 0 2];

N1 = mvnrnd(MU1, SIGMA1, N);
N2 = mvnrnd(MU2, SIGMA2, N);

%% Decision Boundary

INV_SIGMA1 = inv(SIGMA1);
W1 = -0.5 * INV_SIGMA1;
w1 = INV_SIGMA1 * MU1;
w10 = 0.5 * MU1' * INV_SIGMA1 * MU1 - 0.5 * log(det(SIGMA1)) + log(p1);

INV_SIGMA2 = inv(SIGMA2);
W2 = -0.5 * INV_SIGMA2;
w2 = INV_SIGMA2 * MU2;
w20 = 0.5 * MU2' * INV_SIGMA2 * MU2 - 0.5 * log(det(SIGMA2)) + log(p2);

syms a b;
g1S = [a; b]' * W1 * [a; b] + w1' * [a; b] + w10;
g2S = [a; b]' * W2 * [a; b] + w2' * [a; b] + w20;
g1 = matlabFunction(g1S);
g2 = matlabFunction(g2S);
% g = matlabFunction(g1S - g2S);

X1 = -10:.1:10;
X2 = zeros(1, numel(X1));
syms XX;
X1 = -10:.05:10;
E = g1(X1, XX) - g2(X1, XX);
for i = 1:numel(E)
    eqn = E(i) == 0;
    X2(i) = solve(eqn, XX);
end

%% Results
figure
    plot(N1(:,1), N1(:,2), '+r');
hold on
    plot(N2(:,1), N2(:,2), '*b');
    plot(X1, X2)
    xlabel('X1')
    ylabel('X2')
grid on
