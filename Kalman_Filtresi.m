% Sistem Matrisleri
A = 1; % Sistem matrisi
B = 0; % Etki matrisi
C = 1; % G�zlem matrisi

% S�rekli S�re� G�r�lt�s� Kovaryans�
Q = 0.1;

% G�zlem G�r�lt�s� Kovanaryans�
R = 1;

% Ba�lang�� Durumu
x0 = 0;
P0 = 1;

% Sim�lasyon Parametreleri
T = 50; % Zaman ad�m�
N = 100; % Sim�lasyon uzunlu�u

% G�r�lt� olu�turulmas�
Q_noise = Q*randn(1,N);
R_noise = R*randn(1,N);

% �zlenecek Ger�ek Durum
x_true = zeros(1,N);
x_true(1) = x0;

% Ger�ek G�zlemler
y_true = zeros(1,N);

% G�zlemler (Ger�ek + G�r�lt�)
y_observed = zeros(1,N);

% Filtrelenmi� Tahminler
x_filtered = zeros(1,N);

% Ba�lang�� Durumu
x_filtered(1) = x0;
P = P0;

% Kalman Filtresi
for k=2:N
    % Ger�ek Durumun G�ncellenmesi
    x_true(k) = A*x_true(k-1) + B*0; % Sistem g�ncellemesi, etki yok
    
    % Ger�ek G�zlemlerin olu�turulmas�
    y_true(k) = C*x_true(k);
    
    % G�zlemlerin G�r�lt�yle Olu�turulmas�
    y_observed(k) = y_true(k) + R_noise(k);
    
    % Tahmin
    x_pred = A*x_filtered(k-1) + B*0; % Sistemin g�ncellenmesi, etki yok
    P_pred = A*P*A' + Q_noise(k); % S�rekli s�re� g�r�lt�s�n�n eklenmesi
    
    % G�zlem-Durum Residual
    e = y_observed(k) - C*x_pred;
    
    % G�ncelleme
    K = P_pred*C'/(C*P_pred*C' + R); % Kalman Kazanc�
    x_filtered(k) = x_pred + K*e; % Durumu g�ncelle
    P = (eye(1) - K*C)*P_pred; % G�ncellenmi� hata kovaryans�
end

% Sonu�lar�n G�rselle�tirmesi
figure;
hold on;
plot(1:N, x_true, 'g'); % Ger�ek Durum
plot(1:N, y_observed, 'b'); % G�zlemler
plot(1:N, x_filtered, 'r'); % Filtrelenmi� Durum
legend('Ger�ek Durum', 'G�zlemler', 'Filtrelenmi� Durum');
xlabel('Zaman');
ylabel('De�er');
title('Kalman Filtre Uygulamas�');
hold off;
