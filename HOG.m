function [hog] = HOG(im)

%Converting Image to Grayscale
if ndims(im) == 3
    IM =  rgb2gray(im);
else
    IM = im;
end
%computing the differential images using filter image
[im_dx, im_dy] = filter_image(IM);
figure();
imagesc(im_dx);
colorbar();
figure();
imagesc(im_dy);
colorbar();

%computing the gradients using get gradients
[grad_mag, grad_ang] = get_gradients(im_dx, im_dy);
figure();
imagesc(grad_mag);
colorbar();
figure();
colormap(jet);
imagesc(grad_ang);colorbar();


%Building the histogram of oriented gradients and visualizing it.
ori_histo = build_histogram(grad_mag, grad_ang, 8);
create_HOG_features_image(IM,ori_histo);

%Building the normalized descriptors for all blocks 
ori_histo_normalized = get_block_descriptor(ori_histo,2);

%Returning a long vector (HOG) by concatenating all the block descriptors
hog = ori_histo_normalized;

end