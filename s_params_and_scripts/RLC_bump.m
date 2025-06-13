% Compute and plot distributed R, L, C for a single bump

%% Parameters
filename = 'single_bump.s1p';
Z0       = 50;

%% Load S-parameters
data = load(filename);
f    = data(:,1);
S11  = data(:,2) + 1j*data(:,3);

%% Impedance and R, L, C
Z     = Z0 * (1 + S11) ./ (1 - S11);
omega = 2*pi*f;

R = real(Z);
L = imag(Z) ./ omega;
C = -1 ./ (omega .* imag(Z));

idx10 = find(abs(f-10e6) < 1e-3,1);
if ~isempty(idx10)
    fprintf('Resistance at 10 MHz: %.3f Ω\n', R(idx10));
end

%% Plot
mask   = f >= 10e6;         f_GHz = f(mask)/1e9;
fs_big = 28;
lw     = 1.7;
xlims  = [0.1 10];

fig = figure('Color','w','Units','normalized', ...
             'Position',[0.1 0.1 0.6 0.7],'Renderer','painters');
t = tiledlayout(2,2,'TileSpacing','compact','Padding','compact');

nexttile(1)
plot(f_GHz, R(mask),'LineWidth',lw)
xlabel('Frequency (GHz)','FontSize',fs_big,'FontWeight','bold')
ylabel('R (Ω)',          'FontSize',fs_big,'FontWeight','bold')
title ('Resistance',     'FontSize',fs_big,'FontWeight','bold')
xlim(xlims); grid on; set(gca,'FontSize',fs_big,'FontWeight','bold')

nexttile(2)
plot(f_GHz, L(mask),'LineWidth',lw)
xlabel('Frequency (GHz)','FontSize',fs_big,'FontWeight','bold')
ylabel('L (H)',          'FontSize',fs_big,'FontWeight','bold')
title ('Inductance',     'FontSize',fs_big,'FontWeight','bold')
xlim(xlims); grid on; set(gca,'FontSize',fs_big,'FontWeight','bold')

nexttile(3,[1 2])
plot(f_GHz, C(mask),'LineWidth',lw)
xlabel('Frequency (GHz)','FontSize',fs_big,'FontWeight','bold')
ylabel('C (F)',          'FontSize',fs_big,'FontWeight','bold')
title ('Capacitance',    'FontSize',fs_big,'FontWeight','bold')
xlim(xlims); grid on; set(gca,'FontSize',fs_big,'FontWeight','bold')

title(t,'', ...
      'FontSize',fs_big,'FontWeight','bold')
