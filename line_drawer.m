function line_image_out = line_drawer(image_in, hough_image_in, hough_thresh)
%P7 line drawing

figure, imshow(image_in), hold on
num_cols = size(image_in, 2);
[numrho numtheta] = size(hough_image_in);

for theta = 1:numtheta
    for rho = 1:numrho
        if hough_image_in(rho, theta) > hough_thresh
            x = 0:num_cols;
            y = (x * sind(theta - 90) + rho) / cosd(theta - 90);
            
            line(x, y, 'Color', [1 0 0]);
        end
    end
end


line_image_out = image_in;

end

