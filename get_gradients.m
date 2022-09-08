function [grad_mag, grad_ang] = get_gradients(im_dx, im_dy)

for i=1:size(im_dx,1)-8
    for j=1:size(im_dy,2)-8
        grad_mag(i,j) = sqrt( im_dy(i,j)^2  + im_dx(i,j)^2 );
        grad_ang(i,j) =  round( rad2deg(atan(im_dy(i,j)/im_dx(i,j))) + 90);
    end
end

end