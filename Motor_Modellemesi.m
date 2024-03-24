% DC Motor Parametreleri
Ra = 1;         % Stator direnci
La = 0.5;       % Stator ind�ktans�
K = 0.1;        % Motor sabiti
J = 0.02;       % Rotor momenti
B = 0.1;        % S�rt�nme katsay�s�

i0 = 0;        % Ba�lang�� stator ak�m
o0 = 0;     % Ba�lang�� a��sal h�z�

t_aralik = 0:0.01:10;  % Sim�lasyon zaman aral���
b_kosul = [i0; o0]; % Ba�lang�� ko�ullar� vekt�r�

% Denklem sistemi
f = @(t, x) [
    (1 / La) * (u(t) - Ra * x(1) - K * x(2)); % Stator ak�m�
    (1 / J) * (K * x(1) - B * x(2))           % A��sal h�z
];

% Giri� Sinyali
u = @(t) 10 * (t >= 1);

% Denklemleri ��z
[t, X] = ode45(f, t_aralik, b_kosul);

% Sonu�lar
figure;
subplot(2,1,1);
plot(t, X(:,1), 'b', 'LineWidth', 2);
xlabel('Zaman (s)');
ylabel('Stator Ak�m� (A)');
title('Stator Ak�m� Zaman Grafi�i');

subplot(2,1,2);
plot(t, X(:,2), 'r', 'LineWidth', 2);
xlabel('Zaman (s)');
ylabel('A��sal H�z (rad/s)');
title('A��sal H�z Zaman Grafi�i');
