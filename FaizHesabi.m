tutar = input("Ana tutarı giriniz: ");
faiz = input("Yıllık faiz oranını giriniz: ");
yil = input("Zaman dönemini yıl olarak giriniz: ");

faiz_hesabi = double(tutar * faiz * yil);
miktar = double(tutar) + faiz_hesabi;

fprintf("Faiz %.2f ve toplam tutar %.2f", faiz_hesabi, miktar);