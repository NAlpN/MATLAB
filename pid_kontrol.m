Kp = 0.5;
Ki = 0.1;
Kd = 0.2;

hedef_hiz = 100;
baslangic_hiz = 50;
onundeki_araba_hizi = 80;
takip_suresi = 30;     
delta_t = 0.1;          
t_max = 600;            

hata_integral = 0;
hata_prev = 0;

t = 0:delta_t:t_max;
hiz = zeros(size(t));
hiz(1) = baslangic_hiz;

for i = 2:length(t)
    hata = onundeki_araba_hizi - hiz(i-1);
    
    hata_integral = hata_integral + hata * delta_t;
    
    hata_derivative = (hata - hata_prev) / delta_t;
    
    kontrol_sinyali = Kp * hata + Ki * hata_integral + Kd * hata_derivative;
    
    hiz(i) = hiz(i-1) + kontrol_sinyali * delta_t;
    
    if t(i) >= takip_suresi
        onundeki_araba_hizi = 0;
    end
    
    if hiz(i) < 0
        hiz(i) = 0;
    end
    
    if hiz(i) > 120
        hiz(i) = 120;
    end
    
    hata_prev = hata;
end

figure;
plot(t, hiz);
xlabel('Zaman (saniye)');
ylable('Hýz (km/h)');
title('Araba hýzý ve zaman');
grid on;