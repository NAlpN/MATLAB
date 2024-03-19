% Resim y�kle
resim = imread('doga.jpeg');

%Resme gri tonlama uygula
gray = rgb2gray(resim);

%Kenar belirginle�tirme
kenarlar = edge(gray, 'Sobel');

%Resmi bulan�kla�t�r
bulanik_resim = imgaussfilt(resim, 2);

%Resmi tersine �evir
ters_resim = imcomplement(resim);

%Sonu�lar� g�ster
subplot(2,3,1), imshow(resim), title('Orijinal Resim');
subplot(2,3,2), imshow(gray), title('Gri Tonlamal� Resim');
subplot(2,3,3), imshow(kenarlar), title('Kenarlar� Belirginle�tirilmi� Resim');
subplot(2,3,4), imshow(bulanik_resim), title('Bulan�kla�t�r�lm�� Resim');
subplot(2,3,5), imshow(ters_resim), title('Tersine �evrilmi� Resim');