% Resim yükle
resim = imread('doga.jpeg');

%Resme gri tonlama uygula
gray = rgb2gray(resim);

%Kenar belirginleþtirme
kenarlar = edge(gray, 'Sobel');

%Resmi bulanýklaþtýr
bulanik_resim = imgaussfilt(resim, 2);

%Resmi tersine çevir
ters_resim = imcomplement(resim);

%Sonuçlarý göster
subplot(2,3,1), imshow(resim), title('Orijinal Resim');
subplot(2,3,2), imshow(gray), title('Gri Tonlamalý Resim');
subplot(2,3,3), imshow(kenarlar), title('Kenarlarý Belirginleþtirilmiþ Resim');
subplot(2,3,4), imshow(bulanik_resim), title('Bulanýklaþtýrýlmýþ Resim');
subplot(2,3,5), imshow(ters_resim), title('Tersine Çevrilmiþ Resim');