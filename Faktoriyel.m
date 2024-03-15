x = input("Faktöriyeli hesaplanacak sayýyý girin: ");

faktoriyel = 1;

for index = (1:x)
faktoriyel = faktoriyel * index;
end
fprintf("%i sayýsýnýn faktöriyeli: %i",x,faktoriyel);