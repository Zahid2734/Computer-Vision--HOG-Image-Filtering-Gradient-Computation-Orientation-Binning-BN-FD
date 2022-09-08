function create_HOG_features_image(image , ori_histo)

f = figure();
colorbar('off');
imshow(image)
zx = f.CurrentAxes;
colormap(f,gray);
hold on;
row = 4; 

ang = [0,45,75,105,135,165];
for m= 1: size(ori_histo,1)
    col = 4;
    for n= 1: size(ori_histo,2)
         for k = 1:6
              a = ori_histo(m,n,k) * cos(ang(k));
              b = ori_histo(m,n,k) * sin(ang(k));
              x = [col (col+a)];
              y = [row (row+b)];
              line(zx,x,y,'Color','red');
              hold on;
         end
        col = col +8;
    end  
   row = row +8;
end
end