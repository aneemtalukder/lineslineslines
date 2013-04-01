function edge_image_out = edge_detection(image_in)
%LINE_FINDER

sobelx = fspecial('sobel');
sobely = sobelx';

conv_x = conv2(double(sobelx), double(image_in));
conv_y = conv2(double(sobely), double(image_in));

gradient_mag = sqrt(conv_x.^2 + conv_y.^2);

figure, imagesc(gradient_mag);

edge_image_out = gradient_mag;

end

