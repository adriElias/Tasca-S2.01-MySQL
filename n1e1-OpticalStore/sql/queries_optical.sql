USE optical_store;

SELECT c.name AS customer,
COUNT(s.price) AS total_sales,
SUM(s.price) AS total
FROM SALE s
JOIN CUSTOMER c ON s.id_customer = c.id_customer
WHERE c.id_customer = 1
AND s.sale_date BETWEEN '2023-01-01' AND '2023-12-10'
GROUP BY c.id_customer, c.name;

SELECT DISTINCT
e.name AS employee,
g.id_glasses,
b.name AS brand,
g.frame_type AS type,
g.frame_color AS color,
g.price
FROM SALE s
JOIN EMPLOYEE e ON s.id_employee = e.id_employee
JOIN GLASSES g ON s.id_glasses = g.id_glasses
JOIN BRAND b ON g.id_brand = b.id_brand
WHERE e.id_employee = 2
AND YEAR(s.sale_date)= 2023;

SELECT DISTINCT 
su.name AS supplier,
su.nif,
COUNT(s.id_sale) AS sold_glasses
FROM SALE s
JOIN GLASSES g ON s.id_glasses = g.id_glasses
JOIN BRAND b ON g.id_brand = b.id_brand
JOIN SUPPLIER su ON b.id_supplier = su.id_supplier
GROUP BY su.id_supplier, su.name, su.nif
ORDER BY sold_glasses DESC;