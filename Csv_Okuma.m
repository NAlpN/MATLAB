dosya_yolu = 'scraped_data.csv';

veri_tablosu = readtable(dosya_yolu);

disp('CSV dosyas�ndan okunan veriler:');
disp(veri_tablosu);

sutun_isimleri = veri_tablosu.Properties.VariableNames;
