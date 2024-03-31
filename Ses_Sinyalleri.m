[sound_data, fs] = audioread('Kapali_Kapilar.wav');

time = (0:length(sound_data)-1)/fs;
plot(time, sound_data);
title('Ses Sinyali');
xlabel('Zaman (s)');
ylabel('Amplitüd');

ortalama = mean(sound_data);
disp(['Sesin ortalama değeri: ' num2str(ortalama)]);

genlik = max(sound_data) - min(sound_data);
[s, f, t] = spectrogram(sound_data, 256, [], [], fs);
frekans = sum(sum(abs(s)>0.5))/length(t);
disp(['Sesin genliği: ' num2str(genlik)]);
disp(['Sesin frekansı: ' num2str(frekans)]);