% Compute and plot distributed R, L, C, G per μm from open/short S11 measurements

% Parameters
Z0    = 50;
l     = 1.15e-3;
scale = 1e-6;

% Load S-parameters
op = sparameters('open_line.s1p');
sh = sparameters('short_line.s1p');

f      = op.Frequencies;
S11_op = squeeze(op.Parameters(1,1,:));
S11_sh = squeeze(sh.Parameters(1,1,:));

% Compute line parameters
Zin_op = Z0*(1 + S11_op)./(1 - S11_op);
Zin_sh = Z0*(1 + S11_sh)./(1 - S11_sh);

Zc      = sqrt(Zin_op .* Zin_sh);
gamma_l = atanh(Zin_sh ./ Zc);
gamma   = gamma_l ./ l;

alpha = real(gamma);
beta  = imag(gamma);
omega = 2*pi*f;

R_per_m = 2 * alpha .* real(Zc);
G_per_m = 2 * alpha ./ real(Zc);
L_per_m = real(Zc) .* (beta ./ omega);
C_per_m = (beta ./ omega) ./ real(Zc);

% Convert to per-μm and trim range
idx   = f >= 100e6 & f <= 10e9;
f     = f(idx);
R     = R_per_m(idx)*scale;
L     = L_per_m(idx)*scale;
C     = C_per_m(idx)*scale;
G     = G_per_m(idx)*scale;

f_GHz   = f/1e9;
xlimits = [0.1 10];

% Figure setup
fig = figure('Color','w', ...
             'Units','normalized', ...
             'Position',[0.1 0.1 0.6 0.7], ...
             'Renderer','painters');
t = tiledlayout(2,2, 'TileSpacing','compact', 'Padding','compact');

fs = 14;
lw = 1.5;

% Plot
nexttile
plot(f_GHz, R, 'LineWidth',lw)
xlabel('Frequency (GHz)', 'FontSize',fs)
ylabel('R (Ω/μm)',         'FontSize',fs)
title('Resistance per μm', 'FontSize',fs+2)
xlim(xlimits)
grid on
set(gca,'FontSize',fs)

nexttile
plot(f_GHz, L, 'LineWidth',lw)
xlabel('Frequency (GHz)', 'FontSize',fs)
ylabel('L (H/μm)',         'FontSize',fs)
title('Inductance per μm','FontSize',fs+2)
xlim(xlimits)
grid on
set(gca,'FontSize',fs)

nexttile
plot(f_GHz, C, 'LineWidth',lw)
xlabel('Frequency (GHz)', 'FontSize',fs)
ylabel('C (F/μm)',         'FontSize',fs)
title('Capacitance per μm','FontSize',fs+2)
xlim(xlimits)
grid on
set(gca,'FontSize',fs)

nexttile
plot(f_GHz, G, 'LineWidth',lw)
xlabel('Frequency (GHz)', 'FontSize',fs)
ylabel('G (S/μm)',         'FontSize',fs)
title('Conductance per μm','FontSize',fs+2)
xlim(xlimits)
grid on
set(gca,'FontSize',fs)

title(t, 'Distributed R, L, C, G per μm (100 MHz – 10 GHz)', ...
      'FontSize', fs+4, 'FontWeight','bold')

set(fig, 'Units','Inches');
figPos = get(fig, 'Position');
set(fig, 'PaperUnits','Inches', ...
         'PaperSize', [figPos(3) figPos(4)], ...
         'PaperPosition', [0 0 figPos(3) figPos(4)]);
print(fig, 'RLCG_per_um', '-dpdf', '-r0');
