USE pizzeria;

SELECT 
t.name AS town,
p.name AS products,
SUM(op.quantity) AS total_sold
FROM ORDER_PRODUCT op
JOIN `ORDER` o ON op.id_order = o.id_order
JOIN CLIENT c ON o.id_client = c.id_client
JOIN ADDRESS a ON c.id_address = a.id_address
JOIN TOWN t ON a.id_town = t.id_town
JOIN PRODUCT p ON op.id_product = p.id_product
WHERE p.type_product = 'DRINK' AND t.id_town = 4
GROUP BY t.name, p.name
ORDER BY total_sold DESC;

SELECT 
e.name AS employee,
e.surname,
e.role,
COUNT(o.id_order) AS total_orders
FROM `ORDER` o
JOIN EMPLOYEE e ON o.id_delivery_driver = e.id_employee
WHERE e.id_employee = 2
GROUP BY e.id_employee, e.name, e.surname, e.role;