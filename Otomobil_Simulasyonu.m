mass = 1000; % Arac�n A��rl���
Cd = 0.24; % Arac�n S�rt�nme Katsay�s�
A = 2.2; % Arac�n Alan�
Fg = 9.81 * mass; % A��rl�k kuvveti

v0 = 0; % Arac�n Ba�lang�� h�z�
x0 = 0; % Arac�n Ba�lang�� konumu

dt = 0.1; % Zaman
t_end = 100; % Sim�lasyon s�resi

acceleration = @(F) F / mass; % Kuvvet

t = 0;
x = x0;
v = v0;

while t < t_end
    % Hava direnci kuvveti
    Fd = 0.5 * Cd * A * v^2;
    
    % Toplam kuvvet
    F_total = Fg - Fd;
    
    % �vme
    a = acceleration(F_total);
    
    % H�z ve konum
    v = v + a * dt;
    x = x + v * dt;
    
    % Zaman
    t = t + dt;
    
    % Sonu�lar
    plot(t, x, 'b.');
    xlabel('Zaman (s)');
    ylabel('Konum (m)');
    title('Otomobil Sim�lasyonu');
    xlim([0, t_end]);
    ylim([0, x0 + v0 * t_end + 0.5 * a * t_end^2]); % Dinamik olarak konum aral���n� ayarlay�n
    grid on;
    drawnow;
end
