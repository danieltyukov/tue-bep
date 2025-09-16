close ; clear ; clc

Ztotal = zparameters('\\icnas-op01.campus.tue.nl\IC_Staff_PhD_MSc\Projects_BEP\Daniel_Tyukov\tue_bep_daniel_1819283\s_params_and_scripts\dut_die_bumps_line.s1p');
Zdie = zparameters('\\icnas-op01.campus.tue.nl\IC_Staff_PhD_MSc\Projects_BEP\Daniel_Tyukov\tue_bep_daniel_1819283\s_params_and_scripts\die_direct_measurement_after_calibration.s1p');

%% De-embed CPW
% Find Zseries and Zparallel of CPW
Zopen = zparameters('\\icnas-op01.campus.tue.nl\IC_Staff_PhD_MSc\Projects_BEP\Daniel_Tyukov\tue_bep_daniel_1819283\s_params_and_scripts\open_line.s1p');
Zshort = zparameters('\\icnas-op01.campus.tue.nl\IC_Staff_PhD_MSc\Projects_BEP\Daniel_Tyukov\tue_bep_daniel_1819283\s_params_and_scripts\short_line.s1p');

Zs = Zshort.Parameters;
Zp = Zopen.Parameters - Zs;
% Remove Zseries
Z = Ztotal.Parameters- Zs;
% Remove Yparallel
Z = y2z(z2y(Z) - z2y(Zp));

%% Assume 10 MHz is DC
% R = abs(Z(1) - Zdie.Parameters(1)); % contains imaginary component

%% Fit parameters

f = Ztotal.Frequencies;
s = permute(1i*2*pi*f, [3 2 1]);

% --- Define the model function ---
% params = [Rs Ls Cp]
params_fixed = [5.18 NaN NaN];
crl_impedance = @(params, s) (1./(params_fixed(1) + params(2)*s + Zdie.Parameters) + s*params(3)).^-1;

% --- Define the error function ---
impedance_error = @(params) sum(abs(crl_impedance(params, s) - Z).^2);

% --- Initial guess for [R, L, C] ---
initial_guess = [5, 1e-9, 1e-15];  % Adjust based on expected values

% --- Optimization ---
options = optimset('Display', 'off', 'TolFun',1e-24,'TolX',1e-24);
opt_params = fminsearch(impedance_error, initial_guess, options);

% --- Display results ---
fprintf('Optimal C1: %.3g F\n', opt_params(3)/2);
fprintf('Fixed R: %.3g Ohm\n', params_fixed(1)/1.5);
fprintf('Optimal L: %.3g H\n', opt_params(2)/1.5);

% --- Plot comparison ---
Z_fit = crl_impedance(opt_params, s);

figure;
subplot(2,1,1)
hold on
plot(f, abs(permute(Z, [3 2 1])), 'b')
plot(f, abs(permute(Z_fit, [3 2 1])), 'r--')
hold off
xlabel('Frequency (Hz)')
ylabel('|Z| (Ohms)')
legend('Measured SP', 'Fitted', 'Location','northwest')
title('Magnitude of Impedance')
% set(gca, 'Xscale', 'log')

subplot(2,1,2)
hold on
plot(f, angle(permute(Z, [3 2 1]))/pi*180, 'b')
plot(f, angle(permute(Z_fit, [3 2 1]))/pi*180, 'r--')
hold off
xlabel('Frequency (Hz)')
ylabel('Phase (degrees)')
legend('Measured PS', 'Fitted', 'Location','south')
title('Phase of Impedance')
% set(gca, 'Xscale', 'log')

S_fit = z2s(Z_fit);
S = z2s(Z);
figure;
subplot(2,1,1)
hold on
plot(f, abs(permute(S, [3 2 1])), 'b')
plot(f, abs(permute(S_fit, [3 2 1])), 'r--')
hold off
xlabel('Frequency (Hz)')
ylabel('S11 (dB)')
legend('Measured SP', 'Fitted', 'Location','northwest')
title('Magnitude of Impedance')
% set(gca, 'Xscale', 'log')

subplot(2,1,2)
hold on
plot(f, angle(permute(S, [3 2 1]))/pi*180, 'b')
plot(f, angle(permute(S_fit, [3 2 1]))/pi*180, 'r--')
hold off
xlabel('Frequency (Hz)')
ylabel('Phase (degrees)')
legend('Measured PS', 'Fitted', 'Location','south')
title('Phase of Impedance')
% set(gca, 'Xscale', 'log')