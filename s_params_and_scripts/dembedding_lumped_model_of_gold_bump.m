%% deembed_bumps.m
%  Complete 1-port open/short de-embedding with cumulative plots
%  Author: <your-name>, 07-Jun-2025
%  -------------------------------------------------------------------------

clear, clc, close all
addpath(genpath(pwd));                    % make sure rfwrite is visible
Z0 = 50;                                  % reference impedance [Ω]

% -------------------------------------------------------------------------
% 1.  Load raw S-parameter files
% -------------------------------------------------------------------------
fnOpen  = 'open_line.s1p';
fnShort = 'short_line.s1p';
fnDUT   = 'dut_die_bumps_line.s1p';                     % line + die + 3 bumps
fnDie   = '20250604_die_direct_measurement_after_calibration.s1p'; % die only

sOpen  = sparameters(fnOpen);
sShort = sparameters(fnShort);
sDUT   = sparameters(fnDUT);
sDie   = sparameters(fnDie);

% -------------------------------------------------------------------------
% 2.  Common frequency grid (10 MHz – 10 GHz, 10 MHz step)
% -------------------------------------------------------------------------
f = (10e6 : 10e6 : 10e9).';                            % 1×1000 points (column)

interpS11 = @(sobj, ftarget) ...
      interp1(sobj.Frequencies, real(rfparam(sobj,1,1)), ftarget,'linear','extrap') ...
  + 1i*interp1(sobj.Frequencies, imag(rfparam(sobj,1,1)), ftarget,'linear','extrap');

G.open   = interpS11(sOpen ,f);   Gname.open   = "Open";
G.short  = interpS11(sShort,f);   Gname.short  = "Short";
G.dut    = interpS11(sDUT  ,f);   Gname.dut    = "DUT (die+bumps+line)";
G.die    = interpS11(sDie  ,f);   Gname.die    = "Die (direct)";

% convenient handles
StoZ = @(S) Z0.*(1+S)./(1-S);
ZtoS = @(Z)        (Z-Z0)./(Z+Z0);

% colour palette (MATLAB default)
clr = lines(8);

% small utility that draws a Smith+Magnitude combo ------------------------
plotCombo = @(figId, Gcell, names, fvec) ...
    local_plotCombo(figId, Gcell, names, fvec, clr);   %#ok<NASGU>
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
% 3.  FIRST PLOT – raw data (four traces)
% -------------------------------------------------------------------------
Glist   = {G.open, G.short, G.dut, G.die};
namelist = [Gname.open, Gname.short, Gname.dut, Gname.die];
plotCombo(1, Glist, namelist, f);

% -------------------------------------------------------------------------
% 4.  Corrected open–short de-embedding  →  die + bumps
% -------------------------------------------------------------------------
Zopen   = StoZ(G.open);
Zshort  = StoZ(G.short);
Zdut    = StoZ(G.dut);

Zdeb    = Zopen .* (Zdut - Zshort) ./ (Zopen - Zdut);  % eq. (9) in the paper
G.deb   = ZtoS(Zdeb);
Gname.deb = "Die + bumps (de-embedded)";

% SECOND PLOT – add de-embedded curve
Glist   = [Glist, {G.deb}];
namelist = [namelist, Gname.deb];
plotCombo(2, Glist, namelist, f);

% -------------------------------------------------------------------------
% 5.  Remove the die itself  →  3-bump network
% -------------------------------------------------------------------------
Zdie  = StoZ(G.die);
Z3b   = Zdeb - Zdie;                 % series subtraction
G.b3  = ZtoS(Z3b);
Gname.b3 = "3 bumps";

% THIRD PLOT – add 3-bump curve
Glist   = [Glist, {G.b3}];
namelist = [namelist, Gname.b3];
plotCombo(3, Glist, namelist, f);

% -------------------------------------------------------------------------
% 6.  From 3 bumps  →  single bump
% -------------------------------------------------------------------------
Z1b    = (2/3)*Z3b;                  % current sharing via two grounds
G.b1   = ZtoS(Z1b);
Gname.b1 = "Single bump";

% FOURTH PLOT – add single-bump curve
Glist   = [Glist, {G.b1}];
namelist = [namelist, Gname.b1];
plotCombo(4, Glist, namelist, f);

% -------------------------------------------------------------------------
% 7.  Export single-bump Touchstone file
% -------------------------------------------------------------------------
Smat     = reshape(G.b1,1,1,[]);         % 1×1×N
sSingle  = sparameters(Smat,f,Z0);
rfwrite(sSingle,'single_gold_bump.s1p');
fprintf('single_gold_bump.s1p written (%d points)\n',numel(f));

% =========================================================================
%  LOCAL FUNCTION – combo plot
% =========================================================================
function local_plotCombo(fignum, Gcell, names, f, clr)
% Draws a Smith chart (top) and |S11| dB vs f (bottom) in the same figure.
% Inputs:
%   fignum   – figure handle number
%   Gcell    – cell array of S11 vectors (same length as f)
%   names    – string array with legend entries
%   f        – frequency vector (Hz)
%   clr      – N×3 colour matrix

n = numel(Gcell);
figure(fignum);  clf;
tl = tiledlayout(2,1,'TileSpacing','Compact','Padding','Compact');

% ---- Smith chart --------------------------------------------------------
axSmith = nexttile(tl,1);
sp = smithplot(axSmith, real(Gcell{1}) + 1i*imag(Gcell{1}), ...
               'Color', clr(1,:), 'LineWidth',1.2);  hold(sp,'on');
for k = 2:n
    smithplot(axSmith, Gcell{k}, 'Color', clr(k,:), 'LineWidth',1.2);
end
title(axSmith, 'Smith chart');
legend(axSmith, names,'Location','southoutside','Orientation','horizontal');

% ---- Magnitude ----------------------------------------------------------
axMag = nexttile(tl,2);  hold(axMag,'on');  grid(axMag,'on');
for k = 1:n
    plot(axMag, f/1e9, 20*log10(abs(Gcell{k})), ...
         'Color',clr(k,:), 'LineWidth',1.2);
end
xlabel(axMag,'Frequency (GHz)');
ylabel(axMag,'|S_{11}| (dB)');
title(axMag,'Magnitude vs Frequency');
legend(axMag, names,'Location','southoutside','Orientation','horizontal');
end
