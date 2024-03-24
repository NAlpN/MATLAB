% DC Motor Parametreleri
Ra = 1;         % Stator direnci
La = 0.5;       % Stator indüktansý
K = 0.1;        % Motor sabiti
J = 0.02;       % Rotor momenti
B = 0.1;        % Sürtünme katsayýsý

i0 = 0;        % Baþlangýç stator akým
o0 = 0;     % Baþlangýç açýsal hýzý

t_aralik = 0:0.01:10;  % Simülasyon zaman aralýðý
b_kosul = [i0; o0]; % Baþlangýç koþullarý vektörü

% Denklem sistemi
f = @(t, x) [
    (1 / La) * (u(t) - Ra * x(1) - K * x(2)); % Stator akýmý
    (1 / J) * (K * x(1) - B * x(2))           % Açýsal hýz
];

% Giriþ Sinyali
u = @(t) 10 * (t >= 1);

% Denklemleri çöz
[t, X] = ode45(f, t_aralik, b_kosul);

% Sonuçlar
figure;
subplot(2,1,1);
plot(t, X(:,1), 'b', 'LineWidth', 2);
xlabel('Zaman (s)');
ylabel('Stator Akýmý (A)');
title('Stator Akýmý Zaman Grafiði');

subplot(2,1,2);
plot(t, X(:,2), 'r', 'LineWidth', 2);
xlabel('Zaman (s)');
ylabel('Açýsal Hýz (rad/s)');
title('Açýsal Hýz Zaman Grafiði');
