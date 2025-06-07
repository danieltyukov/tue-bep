% corrected_open_short_demo.m
clear; close all; clc;

%--- 1) Parameters & files --------------------------------------------
Z0 = 50;                                 % reference impedance
f  = (10e6:10e6:10e9).';                % 10 MHz:10 MHz:10 GHz

files = { ...
  'open_line.s1p', ...
  'short_line.s1p', ...
  'dut_die_bumps_line.s1p', ...
  '20250604_die_direct_measurement_after_calibration.s1p' ...
};
labels_raw = {'Open','Short','DUT (line+die+bumps)','Direct die'};

%--- 2) Load & interpolate S11 -------------------------------------
S11 = nan(numel(f), numel(files));
for k = 1:numel(files)
  sp = sparameters(files{k});                     % load file
  f_in = sp.Frequencies;                          % native freq vector
  S_in = squeeze(sp.Parameters(1,1,:));
  % interp real/imag onto uniform grid
  S11(:,k) = interp1(f_in, real(S_in), f, 'linear', 'extrap') ...
           + 1j*interp1(f_in, imag(S_in), f, 'linear', 'extrap');
end

%--- 3) Fig1: raw S11 ---------------------------------------------
figure(1); clf;
subplot(1,2,1)
smithplot(f, S11)
title('Fig 1: Raw S_{11} on Smith Plot')
legend(labels_raw,'Location','southwest')

subplot(1,2,2)
plot(f/1e9, 20*log10(abs(S11)),'LineWidth',1.5)
grid on
xlabel('Frequency (GHz)'), ylabel('|S_{11}| (dB)')
title('Fig 1: |S_{11}| vs Frequency')
legend(labels_raw,'Location','southwest')

%--- 4) Open-short de-embedding -------------------------------
Z = @(S) Z0*(1+S)./(1-S);
Zoc = Z(S11(:,1));    % open
Zsc = Z(S11(:,2));    % short
Zm  = Z(S11(:,3));    % DUT(line+die+bumps)

Zde = Zoc .* (Zm - Zsc) ./ (Zoc - Zm);
Sde = (Zde - Z0)./(Zde + Z0);

%--- 5) Fig2: + Die+bumps ----------------------------------------
figure(2); clf;
subplot(1,2,1)
smithplot(f, [S11, Sde])
title('Fig 2: + De-embedded Die+bumps')
legend([labels_raw,{'Die+bumps'}],'Location','southwest')

subplot(1,2,2)
plot(f/1e9, 20*log10(abs([S11, Sde])),'LineWidth',1.5)
grid on
xlabel('Frequency (GHz)'), ylabel('|S_{11}| (dB)')
title('Fig 2: |S_{11}|')
legend([labels_raw,{'Die+bumps'}],'Location','southwest')

%--- 6) Extract 3 bumps ------------------------------------------
Zdie   = Z(S11(:,4));       % direct‐measured die
Z3b    = Zde - Zdie;        % series subtraction → 3 bumps
S3b    = (Z3b - Z0)./(Z3b + Z0);

%--- 7) Fig3: + 3 bumps -----------------------------------------
figure(3); clf;
subplot(1,2,1)
smithplot(f, [S11, Sde, S3b])
title('Fig 3: + 3 Gold Bumps')
legend([labels_raw,{'Die+bumps','3 bumps'}],'Location','southwest')

subplot(1,2,2)
plot(f/1e9, 20*log10(abs([S11, Sde, S3b])),'LineWidth',1.5)
grid on
xlabel('Frequency (GHz)'), ylabel('|S_{11}| (dB)')
title('Fig 3: |S_{11}|')
legend([labels_raw,{'Die+bumps','3 bumps'}],'Location','southwest')

%--- 8) Compute single gold bump impedance ----------------
% Topology: series signal bump + two identical ground bumps in parallel
% => Z3b_total = Zb + (Zb||Zb) = Zb + Zb/2 = 3/2·Zb  ==> Zb = (2/3)·Z3b
Z1b = (2/3) * Z3b;               % elementwise on your freq vector
S1b = (Z1b - Z0) ./ (Z1b + Z0);  % back to S11

%--- 9) Fig4: + single bump ------------------------------------
figure(4); clf;
subplot(1,2,1)
smithplot(f, [S11, Sde, S3b, S1b])
title('Fig 4: + Single Gold Bump')
legend([labels_raw,{'Die+bumps','3 bumps','1 bump'}],'Location','southwest')

subplot(1,2,2)
plot(f/1e9, 20*log10(abs([S11, Sde, S3b, S1b])),'LineWidth',1.5)
grid on
xlabel('Frequency (GHz)'), ylabel('|S_{11}| (dB)')
title('Fig 4: |S_{11}|')
legend([labels_raw,{'Die+bumps','3 bumps','1 bump'}],'Location','southwest')