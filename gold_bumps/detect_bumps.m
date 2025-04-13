% Example MATLAB script for detecting and highlighting gold bumps.

%% 1) Read image
I = imread('evaporated_sample.png');  % <-- change filename as needed

%% 2) Convert to HSV (often useful for color segmentation)
%    Gold tends to have a hue in the yellow/orange range, but exact values 
%    will vary depending on lighting and camera settings.
hsvI = rgb2hsv(I);
H = hsvI(:,:,1);  % Hue channel
S = hsvI(:,:,2);  % Saturation channel
V = hsvI(:,:,3);  % Value (brightness) channel

%% 3) Define color thresholds for "gold"
%    You may have to adjust these ranges (especially hue) until the gold bumps 
%    are clearly captured and not too many background pixels are included.
goldHueMin = 0.07;  % lower bound of hue (approx)
goldHueMax = 0.17;  % upper bound of hue (approx)
satMin      = 0.25; % minimum saturation
valMin      = 0.2;  % minimum brightness

% Create a binary mask where pixels meet the gold-like criteria
goldMask = (H >= goldHueMin & H <= goldHueMax) & ...
           (S >= satMin) & ...
           (V >= valMin);

%% 4) Clean up the mask with morphological operations
%    These steps help remove small noise and fill holes in the detected bumps.
se = strel('disk', 3);            % structuring element
goldMask = imopen(goldMask, se);  % remove small noise
goldMask = imclose(goldMask, se); % close small gaps
goldMask = imfill(goldMask, 'holes');

%% 5) Label connected components and measure properties
CC = bwconncomp(goldMask);
stats = regionprops(CC, 'Centroid', 'Area', 'BoundingBox');

% Optional: you might want to filter out extremely small or large areas
% to exclude spurious detections. Example:
minArea = 5;  % set a threshold (adjust as needed)
validIdx = find([stats.Area] >= minArea);
stats    = stats(validIdx);

%% 6) Visualize: overlay circles or markers on the detected bumps
figure;
imshow(I);  % show original
hold on;

for k = 1:length(stats)
    c = stats(k).Centroid;  % (x, y)
    % A quick way to draw a circular marker is simply a plot:
    plot(c(1), c(2), 'ro', 'MarkerSize', 10, 'LineWidth', 1.5);
    
    % If you want a circular boundary around the bounding box:
    box = stats(k).BoundingBox;
    radius = max(box(3), box(4))/2;  % approximate radius
    viscircles(c, radius, 'Color','r');
end

hold off;
title('Detected Gold Bumps');
