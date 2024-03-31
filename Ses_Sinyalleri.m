[sound_data, fs] = audioread('Kapali_Kapilar.wav');

time = (0:length(sound_data)-1)/fs;
plot(time, sound_data);
title('Ses Sinyali');
xlabel('Zaman (s)');
ylabel('Amplit�d');

ortalama = mean(sound_data);
disp(['Sesin ortalama de�eri: ' num2str(ortalama)]);

genlik = max(sound_data) - min(sound_data);
[s, f, t] = spectrogram(sound_data, 256, [], [], fs);
frekans = sum(sum(abs(s)>0.5))/length(t);
disp(['Sesin genli�i: ' num2str(genlik)]);
disp(['Sesin frekans�: ' num2str(frekans)]);