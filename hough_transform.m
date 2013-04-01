function [edge_image_thresh_out, hough_image_out] = hough_transform(edge_image_in, edge_thresh)
%P6 hough transform

%create accumulator array:
edge_image_thresh_out = edge_image_in > edge_thresh;

[height width] = size(edge_image_in);
theta_max = 360 + 1; 
rho_max = round(sqrt(height^2 + width^2));
accum = zeros([rho_max theta_max]);
numEdgePixels = sum(sum(edge_image_thresh_out>0));

[i j] = find(edge_image_thresh_out>0);
theta = 0;
rho = 0;

tic
for edgepoint = 1:10:numEdgePixels
    for theta = 1:1:theta_max
        for rho = 1:1:rho_max
            
            radangle = ((theta - 90) * pi / 180);
            eq_res = j(edgepoint) * sin(radangle) - i(edgepoint) * cos(radangle) + rho;
            discrepency = abs(eq_res);
            if discrepency < .6
                accum(rho, theta) = accum(rho, theta) + 1;
            end
            
        end
    end
end
toc

figure, imagesc(accum);

%plot the hough image, scaled accordingly
hough_image_out = accum;

end

