USE optical_store;

-- ---------------------------------------------------------
-- ADDRESS
-- ---------------------------------------------------------
INSERT INTO ADDRESS (street, number, floor, door, city, zip_code, country) VALUES
('Carrer de Balmes',       '42',  '3',  'A', 'Barcelona',  '08007', 'España'),
('Calle Gran Vía',         '15',  '2',  'B', 'Madrid',     '28013', 'España'),
('Carrer de la Pau',       '8',   '1',  'C', 'Valencia',   '46001', 'España'),
('Calle Sierpes',          '23',  NULL, NULL,'Sevilla',     '41004', 'España'),
('Rúa do Vilar',           '10',  '4',  'D', 'Santiago de Compostela', '15705', 'España'),
('Calle Alfonso I',        '31',  '2',  'A', 'Zaragoza',   '50003', 'España'),
('Carrer de Colom',        '5',   NULL, NULL,'Palma',       '07001', 'España'),
('Calle Larios',           '7',   '3',  'B', 'Málaga',     '29005', 'España'),
('Calle San Francisco',    '18',  '1',  'A', 'Bilbao',     '48001', 'España'),
('Rambla Nova',            '55',  '2',  'C', 'Tarragona',  '43001', 'España');

-- ---------------------------------------------------------
-- SUPPLIER
-- ---------------------------------------------------------
INSERT INTO SUPPLIER (name, phone_number, fax, nif, id_address) VALUES
('Òptica Distribuïdors SL',  '932001122', '932001133', 'B12345678', 1),
('VisionPro España SA',      '915443322', '915443300', 'A87654321', 2),
('LenteMed Distribució SL',  '963112233', NULL,        'B11223344', 3);

-- ---------------------------------------------------------
-- BRAND
-- ---------------------------------------------------------
INSERT INTO BRAND (name, id_supplier) VALUES
('Ray-Ban',     1),
('Oakley',      1),
('Multiópticas',2),
('Alain Afflelou', 2),
('Indo',        3),
('Visionlab',   3);

-- ---------------------------------------------------------
-- EMPLOYEE
-- ---------------------------------------------------------
INSERT INTO EMPLOYEE (name, surname) VALUES
('Marta',   'García López'),
('Jordi',   'Puig Mas'),
('Carmen',  'Fernández Ruiz'),
('Alejandro','Martínez Sanz'),
('Laura',   'Romero Vidal');

-- ---------------------------------------------------------
-- CUSTOMER
-- ---------------------------------------------------------
INSERT INTO CUSTOMER (name, id_address, phone_number, email, registration_date, id_customer_recommended) VALUES
('Carlos Sánchez Pérez',    4, '654321987', 'carlos.sanchez@gmail.com',  '2022-03-15', NULL),
('Ana Martínez Torres',     5, '612345678', 'ana.martinez@hotmail.com',  '2022-07-22', NULL),
('Luis González Mora',      6, '698765432', 'luis.gonzalez@gmail.com',   '2023-01-10', NULL),
('Elena López Navarro',     7, '677123456', 'elena.lopez@outlook.com',   '2023-04-05', NULL),
('Pablo Rodríguez Castillo',8, '645678901', NULL,                        '2023-06-18', NULL);

-- RECOMMENDED
INSERT INTO CUSTOMER (name, id_address, phone_number, email, registration_date, id_customer_recommended) VALUES
('Sofía Fernández Gil',     9,  '633456789', 'sofia.fernandez@gmail.com', '2023-09-01', 1),
('Miguel Jiménez Vega',     10, '621987654', 'miguel.jimenez@yahoo.es',   '2024-01-14', 2),
('Isabel Ruiz Moreno',      1,  '659234567', NULL,                        '2024-03-22', 1),
('David Torres Blanco',     2,  '676543210', 'david.torres@gmail.com',    '2024-05-30', 3),
('Lucía Gómez Serrano',     3,  '688901234', 'lucia.gomez@hotmail.com',   '2024-08-12', 4);

-- ---------------------------------------------------------
-- GLASSES
-- ---------------------------------------------------------
INSERT INTO GLASSES (left_lens_graduation, right_lens_graduation, frame_type, frame_color, left_glass_color, right_glass_color, price, id_brand) VALUES
(-1.50, -1.75, 'ACETATE',  'Negro',      'Gris',        'Gris',        129.99, 1),
(-2.00, -2.25, 'METALLIC', 'Dorado',     'Transparente','Transparente', 89.99, 2),
(-0.75, -1.00, 'RIMLESS',  'Plata',      'Azul',        'Azul',        149.99, 3),
( 1.00,  1.25, 'ACETATE',  'Marrón',     'Marrón',      'Marrón',       99.99, 4),
(-3.00, -3.25, 'METALLIC', 'Negro',      'Verde',       'Verde',       179.99, 1),
(-1.25, -1.50, 'RIMLESS',  'Transparente','Gris',       'Gris',        159.99, 5),
( 0.50,  0.75, 'ACETATE',  'Azul',       'Transparente','Transparente', 79.99, 6),
(-2.50, -2.75, 'METALLIC', 'Plata',      'Marrón',      'Marrón',      139.99, 2),
(-0.50, -0.50, 'ACETATE',  'Rojo',       'Transparente','Transparente', 69.99, 3),
( 1.50,  1.75, 'RIMLESS',  'Dorado',     'Azul',        'Azul',        199.99, 4);

-- ---------------------------------------------------------
-- SALE
-- ---------------------------------------------------------
INSERT INTO SALE (id_glasses, id_customer, id_employee, sale_date, price) VALUES
(1,  1, 1, '2023-03-20', 129.99),
(2,  2, 2, '2023-07-25',  89.99),
(3,  3, 3, '2023-02-14', 149.99),
(4,  4, 1, '2023-05-10',  99.99),
(5,  5, 4, '2023-07-01', 179.99),
(6,  6, 2, '2023-09-15', 159.99),
(7,  7, 5, '2024-01-20',  79.99),
(8,  8, 3, '2024-04-05', 139.99),
(9,  9, 1, '2024-06-18',  69.99),
(10,10, 4, '2024-08-25', 199.99);