%{ ----------  Info  ---------- %}
% @author MehrdadFI <http://m3hrdadfi.com>
% @date 04-Mar-2016
% @title Discriminant Function for the Normal Density:: Case 1:

clc; clear; close all;

%% Definition
p1 = 0.5;
p2 = 0.5;

N = 500;

MU1 = [4; 4];
MU2 = [-4; -4];

sigma = 6;
SIGMA1 = [sigma ^ 2 0; 0 sigma ^ 2];
SIGMA2 = [sigma ^ 2 0; 0 sigma ^ 2];

N1 = mvnrnd(MU1, SIGMA1, N);
N2 = mvnrnd(MU2, SIGMA2, N);

%% Decision Boundary
W = MU1 - MU2;
X0 = 0.5 * (MU1 + MU2) - ((sigma ^ 2) / (norm(MU1 - MU2) ^ 2)) * (log(p1 / p2)) * (MU1 - MU2);

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
