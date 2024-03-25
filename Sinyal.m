Fs = 1000; % Örnekleme frekansý
f1 = 50; % Ýlk frekans bileþeni
f2 = 120; % Ýkinci frekans bileþeni
t = 0:1/Fs:1-1/Fs; % Zaman vektörü

 %Sinyal oluþturma
y = sin(2*pi*f1*t) + 0.5*sin(2*pi*f2*t);

% Görselleþtirme
figure;
subplot(2,1,1);
plot(t,y);
title('Zaman Alanýnda Sinyal');
xlabel('Zaman (s)');
ylabel('Amplitude');

% Sinyal analizi
Y = fft(y); % Fourier dönüþümü
L = length(y);  % Sinyal uzunluðu
P2 = abs(Y/L); % Tek taraflý spektrum
P1 = P2(1:L/2+1); % Ýlk yarýsý
P1(2:end-1) = 2*P1(2:end-1); % Çift taraflý spektrum için düzenleme
f = Fs*(0:(L/2))/L; % Frekans vektörü

% Görselleþtirme
subplot(2,1,2);
plot(f,P1);
title('Frekans Alanýnda Sinyal');
xlabel('Frekans (Hz)');
ylabel('Amplitude');
