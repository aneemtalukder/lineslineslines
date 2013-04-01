I = imread('hough_simple_1.pgm');
edges = edge_detection(I);
[threshed_edges hough] = hough_transform(edges, 50);
figure, imagesc(threshed_edges);
line_image_out = line_drawer(I, hough, 40);
