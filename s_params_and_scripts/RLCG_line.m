% plot_RLCG.m
% Compute and plot distributed R, L, C, G per μm from open/short S11 measurements
% Plotting from 100 MHz to 10 GHz

%--- Parameters -----------------------------------------------------------
Z0    = 50;              % System reference impedance [Ω]
l     = 1.15e-3;         % Line length [m]
scale = 1e-6;            % Convert per-m to per-μm

%--- Load S-parameters ---------------------------------------------------
op = sparameters('open_line.s1p');
sh = sparameters('short_line.s1p');

f      = op.Frequencies;                 % Frequency vector [Hz]
S11_op = squeeze(op.Parameters(1,1,:));  % Open S11
S11_sh = squeeze(sh.Parameters(1,1,:));  % Short S11

%--- Compute Zin, Zc, γ -----------------------------------------------
Zin_op = Z0*(1 + S11_op)./(1 - S11_op);
Zin_sh = Z0*(1 + S11_sh)./(1 - S11_sh);

Zc      = sqrt(Zin_op .* Zin_sh);
gamma_l = atanh(Zin_sh ./ Zc);      % γ⋅l
gamma   = gamma_l ./ l;             % per-meter

alpha = real(gamma);   % attenuation [Np/m]
beta  = imag(gamma);   % phase constant [rad/m]
omega = 2*pi*f;

%--- Distributed per-meter parameters ------------------------------------
R_per_m = 2 * alpha .* real(Zc);
G_per_m = 2 * alpha ./ real(Zc);
L_per_m = real(Zc) .* (beta ./ omega);
C_per_m = (beta ./ omega) ./ real(Zc);

%--- Convert to per-μm ----------------------------------------------------
R = R_per_m * scale;    % [Ω/μm]
G = G_per_m * scale;    % [S/μm]
L = L_per_m * scale;    % [H/μm]
C = C_per_m * scale;    % [F/μm]

%--- Trim to 100 MHz – 10 GHz --------------------------------------------
idx = f >= 100e6 & f <= 10e9;
f   = f(idx);
R   = R(idx);
L   = L(idx);
C   = C(idx);
G   = G(idx);

%--- Prepare frequency axis in GHz ----------------------------------------
f_GHz   = f/1e9;          % [GHz]
xlimits = [0.1 10];       % [GHz]

%--- Plot ---------------------------------------------------------------
figure('Color','w','Position',[100 100 800 600]);

subplot(2,2,1)
plot(f_GHz, R, 'LineWidth',1.2)
xlabel('Frequency (GHz)')
ylabel('R (Ω/μm)')
title('Resistance per μm')
xlim(xlimits)
grid on

subplot(2,2,2)
plot(f_GHz, L, 'LineWidth',1.2)
xlabel('Frequency (GHz)')
ylabel('L (H/μm)')
title('Inductance per μm')
xlim(xlimits)
grid on

subplot(2,2,3)
plot(f_GHz, C, 'LineWidth',1.2)
xlabel('Frequency (GHz)')
ylabel('C (F/μm)')
title('Capacitance per μm')
xlim(xlimits)
grid on

subplot(2,2,4)
plot(f_GHz, G, 'LineWidth',1.2)
xlabel('Frequency (GHz)')
ylabel('G (S/μm)')
title('Conductance per μm')
xlim(xlimits)
grid on

sgtitle('Distributed R, L, C, G per μm (100 MHz – 10 GHz)')
