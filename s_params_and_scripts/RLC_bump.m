%--- PARAMETERS ------------------------------------------------------------
filename = 'single_bump.s1p';    % your Touchstone file
Z0       = 50;                   % assume 50 Ω reference
f        = (10e6:10e6:10e9).';   % 10 MHz to 10 GHz, 10 MHz step

%--- LOAD S11 ---------------------------------------------------------------
s    = sparameters(filename);        % read .s1p
f    = s.Frequencies;                % overwrite with actual freq vector
S11  = squeeze(s.Parameters(1,1,:)); % reflection coefficient

%--- IMPEDANCE & R,L_eq,C_eq ------------------------------------------------
Z     = Z0 * (1 + S11) ./ (1 - S11);
omega = 2*pi*f;
R     = real(Z);                     % resistance vs f
L_eq  = imag(Z) ./ omega;            % equivalent inductance vs f
C_eq  = -1 ./ (omega .* imag(Z));    % equivalent capacitance vs f

%--- PRINT ONLY R @ 10 MHz -------------------------------------------------
idx10 = find(abs(f - 10e6) < 1e-3, 1);  % index at 10 MHz
fprintf('Resistance at 10 MHz: %.3f Ω\n', R(idx10));

%--- PLOT ALL 3 CURVES IN ONE FIGURE (start at 100 MHz) -------------------
mask   = f >= 100e6;
f_plot = f(mask)/1e6;    % in MHz
R_plot = R(mask);
L_plot = L_eq(mask);
C_plot = C_eq(mask);

figure('Name','R, L_{eq}, C_{eq} vs Frequency','NumberTitle','off'); 
subplot(3,1,1);
plot(f_plot, R_plot,   'LineWidth',1.2);
ylabel('R (Ω)');       title('Resistance');             grid on;

subplot(3,1,2);
plot(f_plot, L_plot,   'LineWidth',1.2);
ylabel('L_{eq} (H)');  title('Equivalent Inductance');  grid on;

subplot(3,1,3);
plot(f_plot, C_plot,   'LineWidth',1.2);
xlabel('Frequency (MHz)'); ylabel('C_{eq} (F)');
title('Equivalent Capacitance'); grid on;
