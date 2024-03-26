originalImage = imread('doga.jpeg'); % Orijinal g�r�nt�
noisyImage = imnoise(originalImage, 'salt & pepper', 0.05); % G�r�lt�l� g�r�nt�

% RGB g�r�nt�y� gri tonlamal�ya d�n��t�rme
grayImage = rgb2gray(noisyImage);

% Medyan Filtresi Uygulama
medianFiltered = medfilt2(grayImage, [3, 3]); % Medyan filtresi

% Gauss Filtresi Uygulama
gaussianFiltered = imgaussfilt(noisyImage, 1); % Gauss filtresi

% G�rselle�tirme
subplot(2, 2, 1), imshow(originalImage), title('Orijinal G�r�nt�');
subplot(2, 2, 2), imshow(noisyImage), title('G�r�lt�l� G�r�nt�');
subplot(2, 2, 3), imshow(medianFiltered), title('Medyan Filtresi Uygulanm�� G�r�nt�');
subplot(2, 2, 4), imshow(gaussianFiltered), title('Gauss Filtresi Uygulanm�� G�r�nt�');
