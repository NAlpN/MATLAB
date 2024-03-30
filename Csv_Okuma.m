dosya_yolu = 'scraped_data.csv';

veri_tablosu = readtable(dosya_yolu);

disp('CSV dosyasýndan okunan veriler:');
disp(veri_tablosu);

sutun_isimleri = veri_tablosu.Properties.VariableNames;
