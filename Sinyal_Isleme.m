% Ses dosyasýný yükleme
[soundData, sampleRate] = audioread('Kapali_Kapilar.wav');

% Ses dosyasýnýn uzunluðunu hesaplama
soundLength = length(soundData);

% Zaman alanýnda ses dosyasýnýn temsili
time = (0:soundLength-1) / sampleRate;
subplot(2,1,1);
plot(time, soundData);
xlabel('Zaman (s)');
ylabel('Genlik');
title('Ses Dosyasýnýn Zaman Alanýnda Temsili');

% Fourier dönüþümü
fourierTransform = fft(soundData);

% Frekans bileþenlerini hesaplama
frequencies = (0:soundLength-1) * sampleRate / soundLength;
amplitudes = abs(fourierTransform) / soundLength;

% Frekans alanýnda ses dosyasýnýn temsili
subplot(2,1,2);
plot(frequencies, amplitudes);
xlabel('Frekans (Hz)');
ylabel('Genlik');
title('Ses Dosyasýnýn Frekans Alanýnda Temsili');
xlim([0, sampleRate/2]); % Nyquist frekansýný geçmeyi önlemek için sýnýrlarý ayarlama
