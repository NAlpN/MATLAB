% Resim yükle
resim = imread('doga.jpeg');

%Resme gri tonlama uygula
gray = rgb2gray(resim);

%Kenar belirginleştirme
kenarlar = edge(gray, 'Sobel');

%Resmi bulanıklaştır
bulanik_resim = imgaussfilt(resim, 2);

%Resmi tersine çevir
ters_resim = imcomplement(resim);

%Sonuçları göster
subplot(2,3,1), imshow(resim), title('Orijinal Resim');
subplot(2,3,2), imshow(gray), title('Gri Tonlamalı Resim');
subplot(2,3,3), imshow(kenarlar), title('Kenarları Belirginleştirilmiş Resim');
subplot(2,3,4), imshow(bulanik_resim), title('Bulanıklaştırılmış Resim');
subplot(2,3,5), imshow(ters_resim), title('Tersine Çevrilmiş Resim');