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
mask    = f >= 100e6;
f_GHz   = f(mask) / 1e9;
xlimits = [0.1 10];

fig = figure('Color','w', ...
             'Units','normalized', ...
             'Position',[0.1 0.1 0.6 0.7], ...
             'Renderer','painters');
t = tiledlayout(2,2, 'TileSpacing','compact', 'Padding','compact');

fs = 14;
lw = 1.5;

% 1) Resistance (top-left)
nexttile(1)
plot(f_GHz, R(mask), 'LineWidth', lw)
xlabel('Frequency (GHz)', 'FontSize', fs)
ylabel('R (Ω)',             'FontSize', fs)
title('Resistance',  'FontSize', fs+2)
xlim(xlimits); grid on
set(gca,'FontSize', fs)

% 2) Inductance (top-right)
nexttile(2)
plot(f_GHz, L_eq(mask), 'LineWidth', lw)
xlabel('Frequency (GHz)', 'FontSize', fs)
ylabel('L (H)',           'FontSize', fs)
title('Inductance','FontSize', fs+2)
xlim(xlimits); grid on
set(gca,'FontSize', fs)

% 3) Capacitance (span full width on bottom row)
nexttile(3, [1 2])
plot(f_GHz, C_eq(mask), 'LineWidth', lw)
xlabel('Frequency (GHz)',  'FontSize', fs)
ylabel('C (F)',            'FontSize', fs)
title('Capacitance','FontSize', fs+2)
xlim(xlimits); grid on
set(gca,'FontSize', fs)

% Overall title
title(t, 'Distributed R, L, C (100 MHz – 10 GHz)', ...
      'FontSize', fs+4, 'FontWeight', 'bold')

% Adjust paper size and save as PDF
set(fig, 'Units','Inches');
figPos = get(fig, 'Position');
set(fig, 'PaperUnits','Inches', ...
         'PaperSize', [figPos(3) figPos(4)], ...
         'PaperPosition', [0 0 figPos(3) figPos(4)]);
print(fig, 'RLC_bump', '-dpdf', '-r0');
