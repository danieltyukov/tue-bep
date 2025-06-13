% De-embedding and single-bump extraction
clear; close all; clc;

%% 1) Parameters & files
Z0 = 50;
f  = (10e6:10e6:10e9).';            % Common frequency vector (10 MHz – 10 GHz)

files = { ...
  'open_line.s1p', ...
  'short_line.s1p', ...
  'dut_die_bumps_line.s1p', ...
  'die_direct_measurement_after_calibration.s1p' ...
};
labels_raw = {'Open','Short','DUT','Direct die'};

fs_big = 28;
lw     = 2;

%% 2) Load & interpolate S11
S11 = nan(numel(f), numel(files));

for k = 1:numel(files)
    if ~isfile(files{k})
        error(['Required Touchstone file not found:\n   %s\n\n' ...
               '-> Check the path or remove it from the "files" cell array.'], files{k});
    end

    sp   = sparameters(files{k});
    f_in = sp.Frequencies;
    S_in = squeeze(sp.Parameters(1,1,:));

    S11(:,k) = interp1(f_in, real(S_in), f, 'linear', 'extrap') + ...
               1j*interp1(f_in, imag(S_in), f, 'linear', 'extrap');
end

phase_deg = @(S) unwrap(angle(S)) * 180/pi;
Zf        = @(S) Z0 * (1 + S) ./ (1 - S);

%% 3) Open–short de-embedding
Zoc  = Zf(S11(:,1)); % open
Zsc  = Zf(S11(:,2)); % short
Zm   = Zf(S11(:,3)); % DUT (line + die + bumps)
Zde  = Zoc .* (Zm - Zsc) ./ (Zoc - Zm); % de-embedded Z

%% 4) Extract 3 bumps
Zdie = Zf(S11(:,4)); % direct die
Z3b  = Zde - Zdie; % impedance of three bumps

% Single-bump extraction
Z1b  = (2/3) * Z3b; % assume bumps identical & symmetric

% convert back to S-parameters
StoS = @(Z) (Z - Z0) ./ (Z + Z0);
Sde  = StoS(Zde);
S3b  = StoS(Z3b);
S1b  = StoS(Z1b);

%% 5) Smith Chart
figure(1); clf
set(gcf,'Renderer','painters','Position',[100 100 800 700]);
smithplot(f/1e9, [S11, Sde, S3b, S1b]);
title('Smith Chart: Single Gold Bump Extraction', ...
      'Interpreter','none','FontSize',fs_big,'FontWeight','bold');
legend([labels_raw, {'De-embedded','3 bumps','1 bump'}], ...
       'Location','southwest','FontSize',fs_big,'FontWeight','bold');
set(gca,'FontSize',fs_big,'FontWeight','bold');
xlabel('Frequency (GHz)','FontSize',fs_big,'FontWeight','bold');
grid on; axis equal;

idx = find(f == 10e6);
Zvals     = { Zoc(idx), Zsc(idx), Zm(idx), Zdie(idx), Zde(idx), Z3b(idx), Z1b(idx) };
allLabels = [labels_raw, {'De-embedded','3 bumps','1 bump'}];

txt = '';
for n = 1:numel(Zvals)
    zc  = Zvals{n};
    txt = sprintf('%s%s: %.1f %s j%.1f Ω\n', txt, ...
                  allLabels{n}, real(zc), char(177), imag(zc));
end
annotation('textbox',[0.63 0.12 0.33 0.75], 'String',txt, ...
           'FitBoxToText','on','BackgroundColor','white', ...
           'FontSize',fs_big,'FontWeight','bold');

%% 6a) Magnitude plot
figure(2); clf
set(gcf,'Position',[950 100 800 600]);
plot(f/1e9, 20*log10(abs([S11, Sde, S3b, S1b])), 'LineWidth',lw);
grid on;
xlabel('Frequency (GHz)','FontSize',fs_big,'FontWeight','bold');
ylabel('|S_{11}| (dB)','FontSize',fs_big,'FontWeight','bold');
title('Magnitude Response','FontSize',fs_big,'FontWeight','bold');
legend([labels_raw, {'De-embedded','3 bumps','1 bump'}], ...
       'Location','southwest','FontSize',fs_big,'FontWeight','bold');
set(gca,'FontSize',fs_big,'FontWeight','bold');

%% 6b) Phase plot
figure(3); clf
set(gcf,'Position',[950 750 800 600]);
plot(f/1e9, phase_deg([S11, Sde, S3b, S1b]), 'LineWidth',lw);
grid on;

yl = ylim;
ylim([-800 yl(2)]);

xlabel('Frequency (GHz)','FontSize',fs_big,'FontWeight','bold');
ylabel('Phase (°)','FontSize',fs_big,'FontWeight','bold');
title('Phase Response','FontSize',fs_big,'FontWeight','bold');
legend([labels_raw, {'De-embedded','3 bumps','1 bump'}], ...
       'Location','southwest','FontSize',fs_big,'FontWeight','bold');
set(gca,'FontSize',fs_big,'FontWeight','bold');

%% 7) Export single-bump S-parameters
fname = 'single_bump.s1p';
fid   = fopen(fname,'w');
if fid < 0
    error('Could not open %s for writing.', fname);
end
for ii = 1:numel(f)
    S1 = StoS(Z1b(ii));
    fprintf(fid,'%e %e %e\n', f(ii), real(S1), imag(S1));
end
fclose(fid);
fprintf('Wrote single-bump S-parameter file: %s\n', fname);
