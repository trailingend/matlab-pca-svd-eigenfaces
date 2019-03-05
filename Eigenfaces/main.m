clc;
clear;
close all;

load('faces.mat');
% images: size=[200,300,250], containing 200 images [250x300]

images = images/255;
face_1 = squeeze(images(1,:,:));
% imshow(face_1);

%--------TODO--------
%PCA the faces and show the eigenfaces.
faces = reshape(200, 300 * 250);
faces_mean = mean(faces, 1);
[u, w, v] = svd(face_1, 'econ');

%Select the first 100 eigenfaces
%Load an image and project it to the "face space" to get a vector representing this image
%Reconstruct the image by the vector and eigenfaces
%Compute PSNR 
w(11:end, 11:end) = 0;
tgt = u * w * v';