function detectGoldBumps(imagePath)
    % Read the image
    img = imread(imagePath);
    
    % Convert to grayscale if it's a color image
    if size(img, 3) == 3
        grayImg = rgb2gray(img);
    else
        grayImg = img;
    end
    
    % Apply contrast enhancement to make gold bumps more visible
    enhancedImg = adapthisteq(grayImg);
    
    % Apply thresholding to isolate bright spots (gold bumps)
    threshold = graythresh(enhancedImg);
    binaryImg = imbinarize(enhancedImg, threshold * 1.2); % Slightly higher threshold to isolate brighter spots
    
    % Remove small objects (noise)
    cleanedImg = bwareaopen(binaryImg, 15);
    
    % Find connected components (potential gold bumps)
    cc = bwconncomp(cleanedImg);
    stats = regionprops(cc, 'Centroid', 'Area', 'Eccentricity', 'BoundingBox');
    
    % Filter components based on properties to identify gold bumps
    goldBumps = [];
    for i = 1:length(stats)
        % Gold bumps are typically small, relatively circular objects
        if stats(i).Area < 200 && stats(i).Area > 20 && stats(i).Eccentricity < 0.7
            goldBumps = [goldBumps; stats(i)];
        end
    end
    
    % Display results
    figure;
    imshow(img);
    hold on;
    
    % Draw circles around detected gold bumps
    for i = 1:length(goldBumps)
        centroid = goldBumps(i).Centroid;
        radius = sqrt(goldBumps(i).Area / pi);
        
        % Draw circle
        theta = 0:0.01:2*pi;
        x = radius * cos(theta) + centroid(1);
        y = radius * sin(theta) + centroid(2);
        plot(x, y, 'r', 'LineWidth', 2);
        
        % Label each bump with a number
        text(centroid(1), centroid(2), num2str(i), 'Color', 'white', 'FontSize', 8, ...
            'HorizontalAlignment', 'center');
    end
    
    title(sprintf('Detected %d Gold Bumps', length(goldBumps)));
    hold off;
    
    % Print the number of detected gold bumps
    fprintf('Detected %d gold bumps in the image.\n', length(goldBumps));
end

detectGoldBumps('evaporated_sample.png')