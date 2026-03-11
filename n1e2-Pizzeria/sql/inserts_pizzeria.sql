USE pizzeria;

-- ---------------------------------------------------------
-- PROVINCE
-- ---------------------------------------------------------
INSERT INTO PROVINCE (name) VALUES
('Barcelona'),
('Madrid'),
('Valencia'),
('Sevilla'),
('Zaragoza');

-- ---------------------------------------------------------
-- TOWN
-- ---------------------------------------------------------
INSERT INTO TOWN (name, id_province) VALUES
('Barcelona',   1),
('Badalona',    1),
('Sabadell',    1),
('Madrid',      2),
('Alcalá de Henares', 2),
('Valencia',    3),
('Gandía',      3),
('Sevilla',     4),
('Dos Hermanas',4),
('Zaragoza',    5);

-- ---------------------------------------------------------
-- ADDRESS
-- ---------------------------------------------------------
INSERT INTO ADDRESS (street, number, floor, door, city, zip_code, country, id_town) VALUES
('Carrer de Balmes',     '42', '3',  'A', 'Barcelona',         '08007', 'España', 1),
('Carrer de Sants',      '10', '1',  'B', 'Barcelona',         '08014', 'España', 1),
('Avinguda del Maresme', '55', NULL, NULL,'Badalona',           '08911', 'España', 2),
('Carrer de Gràcia',     '18', '2',  'C', 'Sabadell',          '08201', 'España', 3),
('Calle Gran Vía',       '15', '4',  'A', 'Madrid',            '28013', 'España', 4),
('Calle Alcalá',         '30', '2',  'B', 'Madrid',            '28009', 'España', 4),
('Calle Mayor',          '7',  NULL, NULL,'Alcalá de Henares',  '28801', 'España', 5),
('Carrer de Colom',      '5',  '1',  'A', 'Valencia',          '46001', 'España', 6),
('Avinguda del Port',    '22', '3',  'D', 'Valencia',          '46023', 'España', 6),
('Carrer de la Mar',     '11', NULL, NULL,'Gandía',             '46700', 'España', 7),
('Calle Sierpes',        '23', '2',  'B', 'Sevilla',           '41004', 'España', 8),
('Calle Betis',          '8',  NULL, NULL,'Sevilla',            '41010', 'España', 8),
('Calle San Fernando',   '14', '1',  'C', 'Dos Hermanas',      '41700', 'España', 9),
('Calle Alfonso I',      '31', '2',  'A', 'Zaragoza',          '50003', 'España', 10),
('Paseo de la Independencia', '3', '4', 'B', 'Zaragoza',       '50004', 'España', 10);

-- ---------------------------------------------------------
-- CLIENT
-- ---------------------------------------------------------
INSERT INTO CLIENT (name, surname, phone_number, id_address) VALUES
('Carlos',    'Sánchez Pérez',     '654321987', 1),
('Ana',       'Martínez Torres',   '612345678', 2),
('Luis',      'González Mora',     '698765432', 5),
('Elena',     'López Navarro',     '677123456', 8),
('Pablo',     'Rodríguez Castillo','645678901', 11),
('Sofía',     'Fernández Gil',     '633456789', 4),
('Miguel',    'Jiménez Vega',      '621987654', 6),
('Isabel',    'Ruiz Moreno',       '659234567', 9),
('David',     'Torres Blanco',     '676543210', 14),
('Lucía',     'Gómez Serrano',     '688901234', 3);

-- ---------------------------------------------------------
-- STORE
-- ---------------------------------------------------------
INSERT INTO STORE (name, id_address) VALUES
('Pizzeria Barcelona Centre', 2),
('Pizzeria Madrid Gran Vía',  6),
('Pizzeria Valencia Port',    9),
('Pizzeria Sevilla Centro',   12),
('Pizzeria Zaragoza',         15);

-- ---------------------------------------------------------
-- EMPLOYEE
-- ---------------------------------------------------------
INSERT INTO EMPLOYEE (name, surname, nif, phone_number, role, id_store, id_address) VALUES
('Marta',     'García López',    '12345678A', '931001122', 'COOK',           1, 1),
('Jordi',     'Puig Mas',        '23456789B', '931002233', 'DELIVERY_DRIVER', 1, 2),
('Carmen',    'Fernández Ruiz',  '34567890C', '911003344', 'COOK',           2, 5),
('Alejandro', 'Martínez Sanz',   '45678901D', '911004455', 'DELIVERY_DRIVER', 2, 6),
('Laura',     'Romero Vidal',    '56789012E', '963005566', 'COOK',           3, 8),
('Sergio',    'Navarro Gil',     '67890123F', '963006677', 'DELIVERY_DRIVER', 3, 9),
('Patricia',  'Molina Castro',   '78901234G', '954007788', 'COOK',           4, 11),
('Roberto',   'Herrera Díaz',    '89012345H', '954008899', 'DELIVERY_DRIVER', 4, 12),
('Cristina',  'Vega Moreno',     '90123456I', '976009900', 'COOK',           5, 14),
('Antonio',   'Blanco Serrano',  '01234567J', '976010011', 'DELIVERY_DRIVER', 5, 15);

-- ---------------------------------------------------------
-- CATEGORY
-- ---------------------------------------------------------
INSERT INTO CATEGORY (name) VALUES
('Clásica'),
('Especial'),
('Vegana'),
('Sin Gluten'),
('Temporada');

-- ---------------------------------------------------------
-- PRODUCT
-- ---------------------------------------------------------
INSERT INTO PRODUCT (name, description, image, price, type_product) VALUES
('Margarita',        'Tomate, mozzarella y albahaca',              'margarita.jpg',   8.99,  'PIZZA'),
('Cuatro Quesos',    'Mozzarella, cheddar, gouda y parmesano',     'cuatroquesos.jpg',10.99, 'PIZZA'),
('Barbacoa',         'Tomate, pollo, cebolla y salsa barbacoa',    'barbacoa.jpg',    11.99, 'PIZZA'),
('Vegana Deluxe',    'Verduras de temporada sin lácteos',          'vegana.jpg',       9.99, 'PIZZA'),
('Sin Gluten Mixta', 'Base sin gluten con jamón y champiñones',    'singluten.jpg',   12.99, 'PIZZA'),
('Hamburguesa Clásica','Ternera, lechuga, tomate y cheddar',       'hambclasica.jpg',  7.99, 'BURGUER'),
('Hamburguesa BBQ',  'Ternera, bacon, cebolla caramelizada y BBQ', 'hambbbq.jpg',      9.49, 'BURGUER'),
('Hamburguesa Vegana','Burger vegetal, aguacate y tomate',         'hambvegana.jpg',   8.49, 'BURGUER'),
('Coca-Cola 33cl',   'Refresco de cola',                           'cocacola.jpg',     1.99, 'DRINK'),
('Agua 50cl',        'Agua mineral natural',                       'agua.jpg',         1.29, 'DRINK'),
('Cerveza 33cl',     'Cerveza rubia nacional',                     'cerveza.jpg',      2.49, 'DRINK'),
('Zumo de Naranja',  'Zumo natural de naranja',                    'zumo.jpg',         2.99, 'DRINK');

-- ---------------------------------------------------------
-- IS_PIZZA  (herència: quines pizzes pertanyen a quina categoria)
-- ---------------------------------------------------------
INSERT INTO IS_PIZZA (id_ispizza, id_product, id_category) VALUES
(1, 1, 1),  -- Margarita       → Clásica
(2, 2, 2),  -- Cuatro Quesos   → Especial
(3, 3, 2),  -- Barbacoa        → Especial
(4, 4, 3),  -- Vegana Deluxe   → Vegana
(5, 5, 4);  -- Sin Gluten      → Sin Gluten

-- ---------------------------------------------------------
-- ORDER
-- ---------------------------------------------------------
INSERT INTO `ORDER` (date_time, order_type, total_price, id_client, id_store, id_delivery_driver, delivery_time) VALUES
('2024-01-15 12:30:00', 'DELIVERY', 22.97, 1, 1, 2,    '2024-01-15 13:05:00'),
('2024-02-20 14:00:00', 'PICKUP',   18.98, 2, 1, NULL,  NULL),
('2024-03-10 19:45:00', 'DELIVERY', 15.97, 3, 2, 4,    '2024-03-10 20:20:00'),
('2024-04-05 21:00:00', 'PICKUP',   10.99, 4, 3, NULL,  NULL),
('2024-05-18 13:15:00', 'DELIVERY', 27.46, 5, 4, 8,    '2024-05-18 13:55:00'),
('2024-06-22 20:30:00', 'DELIVERY', 19.97, 6, 1, 2,    '2024-06-22 21:10:00'),
('2024-07-11 12:00:00', 'PICKUP',   12.28, 7, 2, NULL,  NULL),
('2024-08-30 18:45:00', 'DELIVERY', 24.46, 8, 3, 6,    '2024-08-30 19:25:00'),
('2024-09-14 21:30:00', 'PICKUP',   8.99,  9, 5, NULL,  NULL),
('2024-10-25 13:00:00', 'DELIVERY', 31.45, 10, 4, 8,   '2024-10-25 13:40:00');

-- ---------------------------------------------------------
-- ORDER_PRODUCT
-- ---------------------------------------------------------
INSERT INTO ORDER_PRODUCT (id_order, id_product, quantity) VALUES
(1,  1, 2),   -- Pedido 1: 2x Margarita
(1,  9, 2),   -- Pedido 1: 2x Coca-Cola
(2,  2, 1),   -- Pedido 2: 1x Cuatro Quesos
(2,  6, 1),   -- Pedido 2: 1x Hamburguesa Clásica
(3,  3, 1),   -- Pedido 3: 1x Barbacoa
(3, 11, 2),   -- Pedido 3: 2x Cerveza
(4,  2, 1),   -- Pedido 4: 1x Cuatro Quesos
(5,  5, 2),   -- Pedido 5: 2x Sin Gluten Mixta
(5,  7, 1),   -- Pedido 5: 1x Hamburguesa BBQ
(6,  1, 1),   -- Pedido 6: 1x Margarita
(6,  3, 1),   -- Pedido 6: 1x Barbacoa
(6, 10, 1),   -- Pedido 6: 1x Agua
(7,  6, 1),   -- Pedido 7: 1x Hamburguesa Clásica
(7,  9, 1),   -- Pedido 7: 1x Coca-Cola
(8,  4, 2),   -- Pedido 8: 2x Vegana Deluxe
(8, 12, 2),   -- Pedido 8: 2x Zumo de Naranja
(9,  1, 1),   -- Pedido 9: 1x Margarita
(10, 3, 2),   -- Pedido 10: 2x Barbacoa
(10, 7, 1),   -- Pedido 10: 1x Hamburguesa BBQ
(10, 11,2);   -- Pedido 10: 2x Cerveza