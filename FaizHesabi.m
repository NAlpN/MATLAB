tutar = input("Ana tutar� giriniz: ");
faiz = input("Y�ll�k faiz oran�n� giriniz: ");
yil = input("Zaman d�nemini y�l olarak giriniz: ");

faiz_hesabi = double(tutar * faiz * yil);
miktar = double(tutar) + faiz_hesabi;

fprintf("Faiz %.2f ve toplam tutar %.2f", faiz_hesabi, miktar);