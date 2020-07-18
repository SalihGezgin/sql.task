1. Cevap: SELECT InvoiceId, CustomerId, total FROM invoices ORDER BY CustomerId, total DESC;

2. Cevap: SELECT InvoiceId, CustomerId, total FROM invoices ORDER BY total DESC, CustomerId ASC;

3. Cevap: 1.soru da siralama yaparken ilk önce CustomerId yi baz aliyor. Daha sonra Total bölümüne bakiyor ve 
ona göre kendi siralama islemini tamamliyor.

2. soru da ise siralama yaparken ilk önce Total bölümünü baz aliyor. yüksekten düsük olan miktara göre siralama yapiyor.
Daha sonra CustomerId bölümüne bakiyor ve ona göre kendi siralama islemi olan artarak devam eden no.lari tamamliyor.

4. Cevap: SELECT * FROM invoices WHERE total >= 10.0 LIMIT 10;

5. Cevap: SELECT * FROM invoices WHERE total < 10.0 LIMIT 5;

6. Cevap: SELECT * FROM tracks WHERE name LIKE "b%s";

7. Cevap: SELECT * FROM invoices WHERE BillingCountry='USA' or 'Germany' or 'Norway' or 'Canada' ORDER BY InvoiceDate='2010' DESC;

--sql ödevi