x = input("Fakt�riyeli hesaplanacak say�y� girin: ");

faktoriyel = 1;

for index = (1:x)
faktoriyel = faktoriyel * index;
end
fprintf("%i say�s�n�n fakt�riyeli: %i",x,faktoriyel);