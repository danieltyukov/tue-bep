function profile = optimizeBumpParameters(wireDiam_um, padStack, substrate)
% optimizeBumpParameters Suggest optimal TPT HB16 settings for gold ball bump bonding.
% Inputs:
%   wireDiam_um : Gold wire diameter in micrometers (e.g., 25 for 25um wire).
%   padStack : Struct with fields padAu_nm (Au pad thickness nm),
%                        padTi_nm (Ti adhesion layer thickness nm).
%               (If padStack is not provided as struct, it can be given as [Ti_nm, Au_nm].)
%   substrate : Struct with fields substrThick_mm (substrate thickness in mm),
%                        material (string, e.g., 'glass','ceramic','silicon'),
%                        maxTemp_C (optional max safe temperature).
% Outputs:
%   profile : Struct with recommended bonding parameters for HB16.
%
% Example:
%   padStack = struct('padAu_nm',100,'padTi_nm',50);
%   substrate = struct('substrThick_mm',1.0,'material','glass','maxTemp_C',150);
%   profile = optimizeBumpParameters(25, padStack, substrate)

    if nargin < 2 || isempty(padStack)
        padStack = struct('padAu_nm', 100, 'padTi_nm', 50);
    end
    if nargin < 3 || isempty(substrate)
        substrate = struct('substrThick_mm', 1.0, 'material', 'glass', 'maxTemp_C', 150);
    end

    % Default substrate max temperature if not specified
    if ~isfield(substrate, 'maxTemp_C') || isempty(substrate.maxTemp_C)
        % Set conservative max based on material
        switch lower(substrate.material)
            case 'glass'
                substrate.maxTemp_C = 150;
            case 'ceramic'
                substrate.maxTemp_C = 175;
            case 'silicon'
                substrate.maxTemp_C = 150;
            case 'pcb'  % FR4 or similar
                substrate.maxTemp_C = 120;
            otherwise
                substrate.maxTemp_C = 150;
        end
    end

    % Calculate recommended temperature (use max allowable up to 150C)
    T_set = min( max(100, substrate.maxTemp_C), 150 );
    % If substrate allows >150, we cap at 150 (no need to go higher for Au-Au).
    profile.Heater_C = T_set;
    
    % Determine bonding force (mN) based on wire diameter, pad thickness, and substrate hardness.
    % Use ~30g for 25um as baseline. Scale by wire cross-sectional area, but limit 20g to 50g.
    baseForce_g = 30;  % baseline for 25 um
    force_g = baseForce_g * (wireDiam_um / 25)^2;
    force_g = max(20, min(force_g, 50));  % clamp between 20g and 50g
    % If pad Au is very thin (<50 nm) or substrate is extremely fragile (thin glass),
    % we might reduce force a bit to avoid pad shear:
    if padStack.padAu_nm < 50 || strcmpi(substrate.material,'glass') && substrate.substrThick_mm < 0.5
        force_g = max(20, 0.8 * force_g); % reduce force 20% in such case
    end
    profile.Force_mN = round(force_g * 9.81);  % convert g to mN (approx, g*9.81)
    
    % Determine ultrasonic power level (arbitrary units or mW).
    % Baseline: for 25um, let's assume ~100 (units or ~100 mW) is sufficient at 150C, 30g.
    % Scale linearly with wire diam (somewhat between linear and area scaling) and adjust for temperature.
    % We'll express US in two ways: a percentage (of full scale) and an approximate mW (for reference).
    % Assume full scale ~ 1000 units ~ 300 mW (rough guess).
    baseUS_units = 100;  % baseline units for 25um
    US_units = baseUS_units * (wireDiam_um / 25)^(1.5);  % use 1.5 power scaling (between linear and quadratic)
    % Adjust for temperature: if lower than 150C, increase US a bit; if exactly 150C or above, baseline holds.
    if T_set < 150
        US_units = US_units * (1 + 0.002*(150 - T_set));  % 0.2% more per degree below 150
    end
    US_units = min( max(70, US_units), 300 );  % keep within 70 to 300 range for safety
    profile.US_Level = round(US_units);
    % Also provide an estimated mW (assuming 100 units ~ 100 mW for simplicity)
    profile.US_Power_mW = round(US_units);  % this is a rough estimate for conceptual understanding
    
    % Determine bonding time (ms).
    % Baseline: 25um at 120-150C needs ~50ms. Scale inversely with temperature and directly with wire size.
    time_ms = 50 * (wireDiam_um / 25);
    if T_set < 120
        time_ms = time_ms * (1 + 0.5*(120 - T_set)/100);  % increase time if far below 120C
    end
    if T_set >= 140
        time_ms = time_ms * 0.7;  % can shorten time if near 150C
    end
    time_ms = max(10, min(time_ms, 200));
    profile.Time_ms = round(time_ms);
    
    % EFO (electronic flame-off) power (percent).
    % Baseline: ~90% for 25um. Adjust slightly by wireDiam.
    EFO_pct = 90 * (wireDiam_um / 25)^(0.5);
    EFO_pct = min(100, max(70, EFO_pct));
    profile.EFO_Pct = round(EFO_pct);
    % Tail length (wire feed after bond) in HB16 units.
    % Baseline: 400 for 25um. Scale roughly linear with wire diam (to provide enough volume for larger balls).
    tail_len = 400 * (wireDiam_um / 25);
    tail_len = max(300, min(tail_len, 800));
    profile.TailStep = round(tail_len);
    
    % Loop and tear parameters:
    % Use TableTear by default for stud bumps.
    profile.TearMode = 'TableTear';
    % Up movement (Clamp Open) in some internal units.
    % We'll provide an approximate micron value too.
    up_um = 100;  % ~100 um for most cases
    if wireDiam_um > 30
        up_um = 120;  % slightly more lift for thicker wire
    elseif wireDiam_um < 20
        up_um = 80;
    end
    profile.UpCO_units = round(up_um *  (250/80));  % if 250 units ~80um as suspected, scale accordingly
    profile.UpCO_approx_um = up_um;
    % Horizontal (Y-way) movement.
    y_um = 50;
    if wireDiam_um > 30
        y_um = 60;
    elseif wireDiam_um < 20
        y_um = 40;
    end
    profile.YWay_units = round(y_um * (100/50));  % if 100 units ~50um
    profile.YWay_approx_um = y_um;
    
    % Clamp action: ensure clamp stays open during bonding and closes after upward movement.
    profile.ClampDuringBond = 'Open';
    profile.ClampCloseAfter = 'AfterUpMove';
end
