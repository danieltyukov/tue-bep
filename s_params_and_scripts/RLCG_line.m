% Compute and plot distributed R, L, C, G per mum

%% Parameters
Z0    = 50;
l     = 1.15e-3;
scale = 1e-6;

%% Load S-parameters
op = sparameters('open_line.s1p');
sh = sparameters('short_line.s1p');

f      = op.Frequencies;
S11_op = squeeze(op.Parameters(1,1,:));
S11_sh = squeeze(sh.Parameters(1,1,:));

%% Line parameters
Zin_op = Z0*(1 + S11_op)./(1 - S11_op);
Zin_sh = Z0*(1 + S11_sh)./(1 - S11_sh);

Zc      = sqrt(Zin_op .* Zin_sh);
gamma_l = atanh(Zin_sh ./ Zc);
gamma   = gamma_l ./ l;

alpha = real(gamma);
beta  = imag(gamma);
omega = 2*pi*f;

R_per_m = 2*alpha .* real(Zc);
G_per_m = 2*alpha ./ real(Zc);
L_per_m = real(Zc) .* (beta ./ omega);
C_per_m = (beta ./ omega) ./ real(Zc);

%% Convert to per-μm and select 10 MHz–10 GHz
idx   = (f >= 10e6) & (f <= 10e9);
f     = f(idx);                 f_GHz = f/1e9;
R = R_per_m(idx)*scale;
L = L_per_m(idx)*scale;
C = C_per_m(idx)*scale;
G = G_per_m(idx)*scale;

%% Plot
fs_big = 28;
lw     = 1.7;
xlims  = [0.1 10];

fig = figure('Color','w','Units','normalized', ...
             'Position',[0.1 0.1 0.6 0.7],'Renderer','painters');
t = tiledlayout(2,2,'TileSpacing','compact','Padding','compact');

nexttile
plot(f_GHz, R,'LineWidth',lw)
xlabel('Frequency (GHz)','FontSize',fs_big,'FontWeight','bold')
ylabel('R (Ω/μm)',      'FontSize',fs_big,'FontWeight','bold')
title ('Resistance per μm','FontSize',fs_big,'FontWeight','bold')
xlim(xlims); grid on; set(gca,'FontSize',fs_big,'FontWeight','bold')

nexttile
plot(f_GHz, L,'LineWidth',lw)
xlabel('Frequency (GHz)','FontSize',fs_big,'FontWeight','bold')
ylabel('L (H/μm)',      'FontSize',fs_big,'FontWeight','bold')
title ('Inductance per μm','FontSize',fs_big,'FontWeight','bold')
xlim(xlims); grid on; set(gca,'FontSize',fs_big,'FontWeight','bold')

nexttile
plot(f_GHz, C,'LineWidth',lw)
xlabel('Frequency (GHz)','FontSize',fs_big,'FontWeight','bold')
ylabel('C (F/μm)',      'FontSize',fs_big,'FontWeight','bold')
title ('Capacitance per μm','FontSize',fs_big,'FontWeight','bold')
xlim(xlims); grid on; set(gca,'FontSize',fs_big,'FontWeight','bold')

nexttile
plot(f_GHz, G,'LineWidth',lw)
xlabel('Frequency (GHz)','FontSize',fs_big,'FontWeight','bold')
ylabel('G (S/μm)',      'FontSize',fs_big,'FontWeight','bold')
title ('Conductance per μm','FontSize',fs_big,'FontWeight','bold')
xlim(xlims); grid on; set(gca,'FontSize',fs_big,'FontWeight','bold')
