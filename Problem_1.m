import filter_image.*
import get_gradients.*
import build_histogram.*
import create_HOG_features_image.*
import get_block_descriptor.*
import HOG.*

close all;
im = imread('einstein.jpg');
hog1 = HOG(im);

%% Additional Images
im2 = imread('newton.jpg');
hog2 = HOG(im2);

im3 = imread('galileo.jpg');
hog3 = HOG(im3);