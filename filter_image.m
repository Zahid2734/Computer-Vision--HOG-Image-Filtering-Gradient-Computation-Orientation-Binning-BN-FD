function [im_dx, im_dy] = filter_image(im)
im = im2double(im);
n = size(im,1);
m = size(im,2);

new = zeros((n+8) ,(m+8));

new(1:n,1:m) = im;
size(im)
im = new;
size(im)
 for i=1:size(im,1)-2
        for j=1:size(im,2)-2
            Gx = -1*im(i,j)-0+1*im(i,j+2);
            im_dx(i,j)= Gx;
            im_dx(i,j+1)= Gx ;
            im_dx(i,j+2)= Gx ;
            Gy = -1*im(i,j)+0+1*im(i+2,j);
            im_dy(i,j)= Gy;
            im_dy(i+1,j)= Gy;
            im_dy(i+2,j)= Gy;
        end
 end   
end