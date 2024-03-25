Fs = 1000; % �rnekleme frekans�
f1 = 50; % �lk frekans bile�eni
f2 = 120; % �kinci frekans bile�eni
t = 0:1/Fs:1-1/Fs; % Zaman vekt�r�

 %Sinyal olu�turma
y = sin(2*pi*f1*t) + 0.5*sin(2*pi*f2*t);

% G�rselle�tirme
figure;
subplot(2,1,1);
plot(t,y);
title('Zaman Alan�nda Sinyal');
xlabel('Zaman (s)');
ylabel('Amplitude');

% Sinyal analizi
Y = fft(y); % Fourier d�n���m�
L = length(y);  % Sinyal uzunlu�u
P2 = abs(Y/L); % Tek tarafl� spektrum
P1 = P2(1:L/2+1); % �lk yar�s�
P1(2:end-1) = 2*P1(2:end-1); % �ift tarafl� spektrum i�in d�zenleme
f = Fs*(0:(L/2))/L; % Frekans vekt�r�

% G�rselle�tirme
subplot(2,1,2);
plot(f,P1);
title('Frekans Alan�nda Sinyal');
xlabel('Frekans (Hz)');
ylabel('Amplitude');
