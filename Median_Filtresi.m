originalImage = imread('doga.jpeg');

if size(originalImage, 3) == 3
    grayImage = rgb2gray(originalImage);
else
    grayImage = originalImage;
end

filteredImage = medfilt2(grayImage, [3 3]); % 3x3'lük bir kernel kullanýyoruz

subplot(1,2,1);
imshow(grayImage);
title('Orjinal Görüntü');

subplot(1,2,2);
imshow(filteredImage);
title('Median Filtre Uygulanmýþ Görüntü');
