mass = 1000; % Aracýn Aðýrlýðý
Cd = 0.24; % Aracýn Sürtünme Katsayýsý
A = 2.2; % Aracýn Alaný
Fg = 9.81 * mass; % Aðýrlýk kuvveti

v0 = 0; % Aracýn Baþlangýç hýzý
x0 = 0; % Aracýn Baþlangýç konumu

dt = 0.1; % Zaman
t_end = 100; % Simülasyon süresi

acceleration = @(F) F / mass; % Kuvvet

t = 0;
x = x0;
v = v0;

while t < t_end
    % Hava direnci kuvveti
    Fd = 0.5 * Cd * A * v^2;
    
    % Toplam kuvvet
    F_total = Fg - Fd;
    
    % Ývme
    a = acceleration(F_total);
    
    % Hýz ve konum
    v = v + a * dt;
    x = x + v * dt;
    
    % Zaman
    t = t + dt;
    
    % Sonuçlar
    plot(t, x, 'b.');
    xlabel('Zaman (s)');
    ylabel('Konum (m)');
    title('Otomobil Simülasyonu');
    xlim([0, t_end]);
    ylim([0, x0 + v0 * t_end + 0.5 * a * t_end^2]); % Dinamik olarak konum aralýðýný ayarlayýn
    grid on;
    drawnow;
end
