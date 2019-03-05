img = imread('face.jpeg');
img = imresize(img, 0.25);
img = im2double(img);
[imgh, imgw, c] = size(img);
tgt = [];
for i = 1: c
    src = img(:, :, i);
    [u, w, v] = svd(src);
    w(11:end, 11:end) = 0;
    tgt = cat(3, tgt, u * w * v');
end
imwrite(tgt,'output.png');
figure(), hold off, imshow(tgt);
