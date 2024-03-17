function kelimeFrekansi()
    % Kullanýcýdan metin dosyasý adýný al
    dosyaAdi = input('Metin dosyasýnýn adýný girin: ', 's');

    % Dosyayý aç
    dosya = fopen(dosyaAdi, 'r');

    % Dosya açýlamazsa hata mesajý göster ve çýk
    if dosya == -1
        error('Dosya bulunamadý veya açýlamadý.');
    end

    % Dosyayý satýr satýr oku
    satir = fgets(dosya);
    kelimeSayac = containers.Map(); % Kelime frekanslarýný depolamak için bir sözlük oluþtur

    while ischar(satir)
        % Satýrdaki kelimeleri ayýr
        kelimeler = strsplit(satir);

        % Her kelimenin frekansýný güncelle
        for i = 1:length(kelimeler)
            kelime = lower(kelimeler{i}); % Küçük harfe çevir
            if isKey(kelimeSayac, kelime)
                kelimeSayac(kelime) = kelimeSayac(kelime) + 1;
            else
                kelimeSayac(kelime) = 1;
            end
        end

        % Bir sonraki satýrý oku
        satir = fgets(dosya);
    end

    % Dosyayý kapat
    fclose(dosya);

    % Sonuçlarý ekrana yazdýr
    fprintf('Metindeki kelime frekanslarý:\n');
    keys = kelimeSayac.keys;
    values = kelimeSayac.values;
    for i = 1:length(keys)
        fprintf('%s: %d\n', keys{i}, values{i});
    end
end
