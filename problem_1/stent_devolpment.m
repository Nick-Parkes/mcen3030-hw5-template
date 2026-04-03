clear; close all; clc;

L_vals = 5:30;
D_vals = 10:50;
N_tot = 1000; 

P = zeros(length(L_vals), length(D_vals));

for i = 1:length(L_vals)
    for j = 1:length(D_vals)
        
        L = L_vals(i);
        D = D_vals(j);
        
        mu = 0.02 * L * D^2;
        sigma = 6;
        S = mu + sigma .* randn(N_tot,1);
        
        E = 24*log(L * D^2) + 0.18*L*D^2 - 9.5*(S + 4);
        
        successes = sum(E >= 100);
        
        P(i,j) = successes / N_tot;
    end
end

[D_grid, L_grid] = meshgrid(D_vals, L_vals);

figure;
surf(D_grid, L_grid, P);

xlabel('Drug Dosage D');
ylabel('Lifetime L');
zlabel('Probability P');
title('Probability of Successful Treatment');

shading interp;
colorbar;