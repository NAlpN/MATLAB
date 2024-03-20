% Sistem Matrisleri
A = 1; % Sistem matrisi
B = 0; % Etki matrisi
C = 1; % Gözlem matrisi

% Sürekli Süreç Gürültüsü Kovaryansý
Q = 0.1;

% Gözlem Gürültüsü Kovanaryansý
R = 1;

% Baþlangýç Durumu
x0 = 0;
P0 = 1;

% Simülasyon Parametreleri
T = 50; % Zaman adýmý
N = 100; % Simülasyon uzunluðu

% Gürültü oluþturulmasý
Q_noise = Q*randn(1,N);
R_noise = R*randn(1,N);

% Ýzlenecek Gerçek Durum
x_true = zeros(1,N);
x_true(1) = x0;

% Gerçek Gözlemler
y_true = zeros(1,N);

% Gözlemler (Gerçek + Gürültü)
y_observed = zeros(1,N);

% Filtrelenmiþ Tahminler
x_filtered = zeros(1,N);

% Baþlangýç Durumu
x_filtered(1) = x0;
P = P0;

% Kalman Filtresi
for k=2:N
    % Gerçek Durumun Güncellenmesi
    x_true(k) = A*x_true(k-1) + B*0; % Sistem güncellemesi, etki yok
    
    % Gerçek Gözlemlerin oluþturulmasý
    y_true(k) = C*x_true(k);
    
    % Gözlemlerin Gürültüyle Oluþturulmasý
    y_observed(k) = y_true(k) + R_noise(k);
    
    % Tahmin
    x_pred = A*x_filtered(k-1) + B*0; % Sistemin güncellenmesi, etki yok
    P_pred = A*P*A' + Q_noise(k); % Sürekli süreç gürültüsünün eklenmesi
    
    % Gözlem-Durum Residual
    e = y_observed(k) - C*x_pred;
    
    % Güncelleme
    K = P_pred*C'/(C*P_pred*C' + R); % Kalman Kazancý
    x_filtered(k) = x_pred + K*e; % Durumu güncelle
    P = (eye(1) - K*C)*P_pred; % Güncellenmiþ hata kovaryansý
end

% Sonuçlarýn Görselleþtirmesi
figure;
hold on;
plot(1:N, x_true, 'g'); % Gerçek Durum
plot(1:N, y_observed, 'b'); % Gözlemler
plot(1:N, x_filtered, 'r'); % Filtrelenmiþ Durum
legend('Gerçek Durum', 'Gözlemler', 'Filtrelenmiþ Durum');
xlabel('Zaman');
ylabel('Deðer');
title('Kalman Filtre Uygulamasý');
hold off;
