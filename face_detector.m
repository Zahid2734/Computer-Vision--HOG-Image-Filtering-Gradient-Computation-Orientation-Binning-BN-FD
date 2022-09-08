function bounding_boxes = face_detector(im_target,im_template)

m = size(im_template,1);
n = size(im_template,2);

p=size(im_target,1);
q=size(im_target,2);

M = ceil(p/m) * m;
N = ceil(q/n)* n;

[featureVector,hogVisualization] = extractHOGFeatures(im_template);
mean1 = mean(featureVector);
featureVector1 = featureVector - mean1 ;

figure();
imshow(im_target);
hold on;
          
bounding_boxes = [];
for i = 1:size(im_target,1) -m
    for j = 1:size(im_target,2) -n
        p1 = [i,j];
        p2 = [i+(m-1), j+(n-1)];
        
         cropIm = im_target(i:i+50 , j:j+50 );
            
            
        [featureVector2,hogVisualization2] = extractHOGFeatures(cropIm);
        
        mean2  =  mean(featureVector2);
        featureVector2 = featureVector2 - mean2;
        
        do = dot(featureVector1,featureVector2);
        l1 = norm(featureVector1,2);
        l2 = norm(featureVector2,2);
        acc = do/(l1*l2);
        
        if acc > 0.4
             a = [i j acc] ;
             bounding_boxes = [ bounding_boxes; a ];
             rectangle('Position',[j i 50 50 ],'EdgeColor','r')
             hold on;
        end
  

    end
end
hold off;
hold off;
end