% Ses dosyas�n� y�kleme
[soundData, sampleRate] = audioread('Kapali_Kapilar.wav');

% Ses dosyas�n�n uzunlu�unu hesaplama
soundLength = length(soundData);

% Zaman alan�nda ses dosyas�n�n temsili
time = (0:soundLength-1) / sampleRate;
subplot(2,1,1);
plot(time, soundData);
xlabel('Zaman (s)');
ylabel('Genlik');
title('Ses Dosyas�n�n Zaman Alan�nda Temsili');

% Fourier d�n���m�
fourierTransform = fft(soundData);

% Frekans bile�enlerini hesaplama
frequencies = (0:soundLength-1) * sampleRate / soundLength;
amplitudes = abs(fourierTransform) / soundLength;

% Frekans alan�nda ses dosyas�n�n temsili
subplot(2,1,2);
plot(frequencies, amplitudes);
xlabel('Frekans (Hz)');
ylabel('Genlik');
title('Ses Dosyas�n�n Frekans Alan�nda Temsili');
xlim([0, sampleRate/2]); % Nyquist frekans�n� ge�meyi �nlemek i�in s�n�rlar� ayarlama
