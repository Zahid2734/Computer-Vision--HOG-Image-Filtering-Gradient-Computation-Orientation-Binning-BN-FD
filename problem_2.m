import face_detector.*

template = imread("template.png");
template = im2double(template);

target = imread("target2.jpg");
if ndims(target) == 3
    target =  rgb2gray(target);
else
    target = target;
end
target = im2double(target);



boundingboxes = face_detector(target,template);

 Empty_box = [];
    while (size(boundingboxes,1)>0)
        boundingboxes = sortrows(boundingboxes,3);
        temp = boundingboxes(1,:);
        Empty_box = [Empty_box; temp];
        boundingboxes(1,:) = [];
        temp_box = [];
        for i=1:size(boundingboxes)
            temp1 = box(temp, boundingboxes(i,:));
            if (temp1<0.50)
                temp_box =[temp_box;boundingboxes(i,:)];
            end
        end
        boundingboxes = temp_box;
    end

x  = figure;
figure(x)
imshow(target)
hold on
for i =1:size(Empty_box,1)
 figure(x)
 rectangle('Position',[Empty_box(i,2),Empty_box(i,1),50,50],'EdgeColor','red');
 end
    hold off;
    
    
function [bla] =  box(box1,box2)
    area = 50*50;
    b1 = [box1(1), box1(2), 50, 50];
    b2 = [box2(1), box2(2), 50, 50];
    intersec = rectint(b1,b2);
    bla = intersec/(area*2-intersec);
end
