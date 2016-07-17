%{ ----------  Info  ---------- %}
% @author MehrdadFI <http://m3hrdadfi.com>
% @date 04-Mar-2016
% @title Discriminant Function for the Normal Density:: Case 2:

clc; clear; close all;

%% Definition
p1 = 0.9;
p2 = 0.1;

N = 500;

MU1 = [3; -2];
MU2 = [10; 3];

SIGMA = [5 0.2; 0.2 5];

N1 = mvnrnd(MU1, SIGMA, N);
N2 = mvnrnd(MU2, SIGMA, N);

%% Decision Boundary
W = inv(SIGMA) * (MU1 - MU2);
X0 = 0.5 * (MU1 + MU2) - (1 / ((MU1 - MU2)' * inv(SIGMA) * (MU1 - MU2))) * (log(p1/p2)) * (MU1 - MU2);

X1 = -20:.05:20;
X2 = (W' * X0 - W(1) * X1) / W(2);
%% Results
figure
    plot(N1(:,1), N1(:,2), '+r');
hold on
    plot(N2(:,1), N2(:,2), '*b');
    plot(X1, X2)
    xlabel('X1')
    ylabel('X2')
grid on
