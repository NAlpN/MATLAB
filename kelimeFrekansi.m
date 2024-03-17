function kelimeFrekansi()
    % Kullan�c�dan metin dosyas� ad�n� al
    dosyaAdi = input('Metin dosyas�n�n ad�n� girin: ', 's');

    % Dosyay� a�
    dosya = fopen(dosyaAdi, 'r');

    % Dosya a��lamazsa hata mesaj� g�ster ve ��k
    if dosya == -1
        error('Dosya bulunamad� veya a��lamad�.');
    end

    % Dosyay� sat�r sat�r oku
    satir = fgets(dosya);
    kelimeSayac = containers.Map(); % Kelime frekanslar�n� depolamak i�in bir s�zl�k olu�tur

    while ischar(satir)
        % Sat�rdaki kelimeleri ay�r
        kelimeler = strsplit(satir);

        % Her kelimenin frekans�n� g�ncelle
        for i = 1:length(kelimeler)
            kelime = lower(kelimeler{i}); % K���k harfe �evir
            if isKey(kelimeSayac, kelime)
                kelimeSayac(kelime) = kelimeSayac(kelime) + 1;
            else
                kelimeSayac(kelime) = 1;
            end
        end

        % Bir sonraki sat�r� oku
        satir = fgets(dosya);
    end

    % Dosyay� kapat
    fclose(dosya);

    % Sonu�lar� ekrana yazd�r
    fprintf('Metindeki kelime frekanslar�:\n');
    keys = kelimeSayac.keys;
    values = kelimeSayac.values;
    for i = 1:length(keys)
        fprintf('%s: %d\n', keys{i}, values{i});
    end
end
