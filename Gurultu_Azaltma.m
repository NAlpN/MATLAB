originalImage = imread('doga.jpeg'); % Orijinal görüntü
noisyImage = imnoise(originalImage, 'salt & pepper', 0.05); % Gürültülü görüntü

% RGB görüntüyü gri tonlamalýya dönüþtürme
grayImage = rgb2gray(noisyImage);

% Medyan Filtresi Uygulama
medianFiltered = medfilt2(grayImage, [3, 3]); % Medyan filtresi

% Gauss Filtresi Uygulama
gaussianFiltered = imgaussfilt(noisyImage, 1); % Gauss filtresi

% Görselleþtirme
subplot(2, 2, 1), imshow(originalImage), title('Orijinal Görüntü');
subplot(2, 2, 2), imshow(noisyImage), title('Gürültülü Görüntü');
subplot(2, 2, 3), imshow(medianFiltered), title('Medyan Filtresi Uygulanmýþ Görüntü');
subplot(2, 2, 4), imshow(gaussianFiltered), title('Gauss Filtresi Uygulanmýþ Görüntü');
