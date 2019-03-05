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
faces = reshape(images, [200, 300 * 250]);
faces_mean = mean(faces, 1);
means_200 = ones(200, 1) * faces_mean;
faces = faces - means_200;

[u, w, v] = svd(faces', 'econ');
size(faces_mean')

face_100 = u(:, 1:100);
% face_example = reshape(face_example, [300, 250]);
% imshow(face_example)

%Select the first 100 eigenfaces
%Load an image and project it to the "face space" to get a vector representing this image
%Reconstruct the image by the vector and eigenfaces
%Compute PSNR 
img1 = double(imread('1.png'))/255;
img1 = reshape(img1,[1, 300*250]);
recon = (img1 - faces_mean) * face_100 * face_100' + faces_mean;
recon = reshape(recon, [300, 250]);
figure();
imshow(recon);
