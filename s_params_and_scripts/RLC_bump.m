% Paramaters
filename = 'single_bump.s1p';  
Z0       = 50;                
data     = load(filename);        
f        = data(:,1);           
S11      = data(:,2) + 1j*data(:,3);

% Compure Z, R, L, C
Z        = Z0 * (1 + S11) ./ (1 - S11);
omega    = 2*pi*f;
R        = real(Z);
L        = imag(Z) ./ omega;
C        = -1 ./ (omega .* imag(Z));

idx10 = find(abs(f - 10e6) < 1e-6, 1);
if ~isempty(idx10)
    fprintf('Resistance at 10 MHz: %.3f Ω\n', R(idx10));
end

% Plot
mask   = f >= 100e6;
f_GHz  = f(mask) / 1e9;
xlimits = [0.1 10];

fig = figure('Color','w', ...
             'Units','normalized', ...
             'Position',[0.1 0.1 0.8 0.4], ...
             'Renderer','painters');
t = tiledlayout(1,3, 'TileSpacing','compact', 'Padding','compact');

fs = 14;
lw = 1.5;

% Resistance
nexttile
plot(f_GHz, R(mask), 'LineWidth', lw)
xlabel('Frequency (GHz)', 'FontSize', fs)
ylabel('R (Ω)',           'FontSize', fs)
title('Series Resistance', 'FontSize', fs+2)
xlim(xlimits)
grid on
set(gca,'FontSize', fs)

% Inductance
nexttile
plot(f_GHz, L(mask), 'LineWidth', lw)
xlabel('Frequency (GHz)', 'FontSize', fs)
ylabel('L (H)',           'FontSize', fs)
title('Series Inductance', 'FontSize', fs+2)
xlim(xlimits)
grid on
set(gca,'FontSize', fs)

% Capacitance
nexttile
plot(f_GHz, C(mask), 'LineWidth', lw)
xlabel('Frequency (GHz)', 'FontSize', fs)
ylabel('C (F)',           'FontSize', fs)
title('Series Capacitance', 'FontSize', fs+2)
xlim(xlimits)
grid on
set(gca,'FontSize', fs)

% Overall Title
title(t, 'Distributed R, L, C (100 MHz – 10 GHz)', ...
      'FontSize', fs+4, 'FontWeight', 'bold')

% Save as PDF (paper size matches figure size)
set(fig, 'Units','Inches');
figPos = get(fig, 'Position');
set(fig, 'PaperUnits','Inches', ...
         'PaperSize', [figPos(3) figPos(4)], ...
         'PaperPosition',[0 0 figPos(3) figPos(4)]);
print(fig, 'RLC_series_plot', '-dpdf', '-r0');
