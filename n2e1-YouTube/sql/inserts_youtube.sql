USE youtube;

-- ---------------------------------------------------------
-- COUNTRY
-- ---------------------------------------------------------
INSERT INTO COUNTRY (name) VALUES
('España'),
('México'),
('Argentina'),
('Colombia'),
('Estados Unidos'),
('Francia'),
('Alemania'),
('Brasil'),
('Italia'),
('Reino Unido');

-- ---------------------------------------------------------
-- USER
-- ---------------------------------------------------------
INSERT INTO `USER` (email, password, nickname, birthdate, gender, zip_code, id_country) VALUES
('carlos.sanchez@gmail.com',  'hashed_pass_1',  'carlossanchez',  '1990-03-15', 'MASCLE',               '08007', 1),
('ana.martinez@hotmail.com',  'hashed_pass_2',  'anamartinez',    '1995-07-22', 'FEMALE',               '28013', 1),
('luis.gonzalez@gmail.com',   'hashed_pass_3',  'luisgonzalez',   '1988-01-10', 'MASCLE',               '46001', 1),
('sofia.fernandez@gmail.com', 'hashed_pass_4',  'sofiafernandez', '2000-11-05', 'FEMALE',               '41004', 1),
('miguel.jimenez@yahoo.com',  'hashed_pass_5',  'migueljimenez',  '1993-04-18', 'MASCLE',               '50003', 1),
('juan.perez@gmail.com',      'hashed_pass_6',  'juanperez_mx',   '1991-09-30', 'MASCLE',               '06600', 2),
('laura.gomez@gmail.com',     'hashed_pass_7',  'lauragomez',     '1997-02-14', 'FEMALE',               'C1001', 3),
('pedro.rod@gmail.com',       'hashed_pass_8',  'pedrorodriguez', '1985-06-25', 'MASCLE',               '11001', 4),
('emma.wilson@gmail.com',     'hashed_pass_9',  'emmawilson',     '1999-12-01', 'FEMALE',               '10001', 5),
('thomas.mueller@gmail.com',  'hashed_pass_10', 'thomasmueller',  '1987-08-17', 'MASCLE',               '10115', 7);

-- ---------------------------------------------------------
-- VIDEO
-- ---------------------------------------------------------
INSERT INTO VIDEO (tittle, description, size, file_name, duration, thumbnail_url, views_number, likes_number, dislikes_number, status, published_at, id_user) VALUES
('Cómo aprender SQL desde cero',     'Tutorial completo de SQL para principiantes',     1024.50, 'sql_tutorial.mp4',      45.30, 'sql_thumb.jpg',     15420, 980,  23,  'PUBLIC',  '2024-01-10 10:00:00', 1),
('Top 10 lugares de España',         'Los mejores destinos turísticos de España',        856.20, 'spain_top10.mp4',       32.15, 'spain_thumb.jpg',    8750, 640,  12,  'PUBLIC',  '2024-02-15 14:30:00', 2),
('Receta de paella valenciana',      'La auténtica receta de paella valenciana',         512.80, 'paella_recipe.mp4',     18.45, 'paella_thumb.jpg',  22100, 1850, 45,  'PUBLIC',  '2024-02-20 12:00:00', 3),
('Aprende Python en 1 hora',         'Curso intensivo de Python para principiantes',    2048.00, 'python_course.mp4',    60.00, 'python_thumb.jpg',  45600, 3200, 87,  'PUBLIC',  '2024-03-01 09:00:00', 1),
('Música lo-fi para estudiar',       'Mix de música lo-fi perfecta para concentrarse',  320.50, 'lofi_mix.mp4',         99.99, 'lofi_thumb.jpg',    98500, 7800, 120, 'PUBLIC',  '2024-03-10 16:00:00', 4),
('Review iPhone 15 Pro',             'Análisis completo del iPhone 15 Pro',             780.30, 'iphone15_review.mp4',  25.20, 'iphone_thumb.jpg',  33200, 2100, 340, 'PUBLIC',  '2024-03-15 11:00:00', 5),
('Ejercicios para hacer en casa',    'Rutina completa de ejercicios sin equipamiento',  650.00, 'home_workout.mp4',     35.00, 'workout_thumb.jpg', 18900, 1560, 28,  'PUBLIC',  '2024-04-01 08:00:00', 2),
('Cómo invertir en bolsa',           'Guía para principiantes en inversión bursátil',   920.40, 'stock_market.mp4',     42.30, 'stocks_thumb.jpg',  27400, 1980, 210, 'PUBLIC',  '2024-04-10 15:00:00', 6),
('Vlog Buenos Aires',                'Un día en Buenos Aires, Argentina',              1100.60, 'buenos_aires_vlog.mp4',28.45, 'ba_thumb.jpg',       5600,  420, 15,  'PUBLIC',  '2024-04-20 13:00:00', 7),
('Tutorial Adobe Photoshop',         'Aprende Photoshop desde cero',                   1536.20, 'photoshop_tut.mp4',    55.00, 'ps_thumb.jpg',      12300,  890, 34,  'HIDDEN',  '2024-05-01 10:00:00', 3),
('Mi setup de programador 2024',     'Os enseño mi setup completo de programador',      430.00, 'setup_2024.mp4',       15.30, 'setup_thumb.jpg',    8900,  760, 22,  'PUBLIC',  '2024-05-10 17:00:00', 1),
('Documental: Historia de Internet', 'La historia completa de Internet',               2200.00, 'internet_doc.mp4',     99.99, 'doc_thumb.jpg',     41200, 3400, 56,  'PUBLIC',  '2024-05-20 20:00:00', 8);

-- ---------------------------------------------------------
-- HASHTAG
-- ---------------------------------------------------------
INSERT INTO HASHTAG (id_hashtag, name) VALUES
(1,  'sql'),
(2,  'programacion'),
(3,  'tutorial'),
(4,  'españa'),
(5,  'viajes'),
(6,  'cocina'),
(7,  'python'),
(8,  'musica'),
(9,  'lofi'),
(10, 'tecnologia'),
(11, 'review'),
(12, 'fitness'),
(13, 'finanzas'),
(14, 'vlog'),
(15, 'diseño');

-- ---------------------------------------------------------
-- VIDEO_HASHTAG
-- ---------------------------------------------------------
INSERT INTO VIDEO_HASHTAG (id_video, id_hashtag, count) VALUES
(1,  1,  45),
(1,  2,  30),
(1,  3,  60),
(2,  4,  25),
(2,  5,  40),
(3,  6,  80),
(3,  4,  20),
(4,  7,  90),
(4,  2,  55),
(4,  3,  70),
(5,  8,  99),
(5,  9,  99),
(6,  10, 85),
(6,  11, 95),
(7,  12, 60),
(8,  13, 75),
(9,  14, 30),
(9,  5,  25),
(10, 15, 50),
(10, 3,  45),
(11, 10, 40),
(11, 2,  35),
(12, 3,  55),
(12, 10, 65);

-- ---------------------------------------------------------
-- CHANNEL
-- ---------------------------------------------------------
INSERT INTO CHANNEL (name, description, id_user) VALUES
('TechWithCarlos',  'Canal de tutoriales de programación y tecnología', 1),
('AnaViaja',        'Descubriendo el mundo un destino a la vez',        2),
('CocinaConLuis',   'Las mejores recetas de la cocina española',        3),
('SofíaMusic',      'Música para todos los momentos del día',           4),
('MiguelTech',      'Reviews y novedades tecnológicas',                 5),
('JuanFinanzas',    'Aprende a gestionar tu dinero',                    6),
('LauraVlogs',      'Mi vida en Buenos Aires',                          7);

-- ---------------------------------------------------------
-- SUBSCRIPTION
-- ---------------------------------------------------------
INSERT INTO SUBSCRIPTION (id_user, id_channel) VALUES
(2,  1),
(3,  1),
(4,  1),
(5,  1),
(1,  2),
(3,  2),
(6,  2),
(1,  3),
(2,  3),
(7,  3),
(1,  4),
(8,  4),
(9,  4),
(2,  5),
(6,  5),
(10, 5),
(1,  6),
(3,  6),
(2,  7),
(5,  7);

-- ---------------------------------------------------------
-- VIDEO_USER_REACTION
-- ---------------------------------------------------------
INSERT INTO VIDEO_USER_REACTION (id_video, id_user, reaction) VALUES
(1,  2,  'LIKE'),
(1,  3,  'LIKE'),
(1,  4,  'LIKE'),
(1,  5,  'DISLIKE'),
(2,  1,  'LIKE'),
(2,  6,  'LIKE'),
(2,  7,  'LIKE'),
(3,  1,  'LIKE'),
(3,  2,  'LIKE'),
(3,  8,  'DISLIKE'),
(4,  2,  'LIKE'),
(4,  3,  'LIKE'),
(4,  6,  'LIKE'),
(4,  9,  'DISLIKE'),
(5,  1,  'LIKE'),
(5,  3,  'LIKE'),
(5,  7,  'LIKE'),
(5,  10, 'LIKE'),
(6,  2,  'DISLIKE'),
(6,  4,  'LIKE'),
(6,  8,  'LIKE'),
(7,  1,  'LIKE'),
(7,  6,  'LIKE'),
(8,  3,  'LIKE'),
(8,  5,  'DISLIKE'),
(9,  1,  'LIKE'),
(9,  2,  'LIKE'),
(10, 4,  'LIKE'),
(11, 2,  'LIKE'),
(11, 7,  'LIKE'),
(12, 5,  'LIKE'),
(12, 9,  'LIKE');

-- ---------------------------------------------------------
-- PLAYLIST
-- ---------------------------------------------------------
INSERT INTO PLAYLIST (name, status, id_user) VALUES
('Tutoriales programación', 'PUBLIC',  1),
('Música para estudiar',    'PUBLIC',  1),
('Mis recetas favoritas',   'PRIVATE', 2),
('Viajes pendientes',       'PUBLIC',  2),
('Finanzas personales',     'PRIVATE', 3),
('Lo mejor de tecnología',  'PUBLIC',  5),
('Rutinas fitness',         'PUBLIC',  7);

-- ---------------------------------------------------------
-- PLAYLIST_VIDEO
-- ---------------------------------------------------------
INSERT INTO PLAYLIST_VIDEO (id_playlist, id_video) VALUES
(1, 1),
(1, 4),
(1, 10),
(1, 11),
(2, 5),
(3, 3),
(4, 2),
(4, 9),
(5, 8),
(6, 6),
(6, 11),
(6, 12),
(7, 7);

-- ---------------------------------------------------------
-- COMMENT
-- ---------------------------------------------------------
INSERT INTO `COMMENT` (comment, id_user, id_video) VALUES
('Muy buen tutorial, me ha ayudado mucho!',              2,  1),
('Excelente explicación, sigue así!',                    3,  1),
('No entendí la parte de los JOINs',                     5,  1),
('España es increíble, quiero visitarla pronto',         1,  2),
('Falta mencionar San Sebastián!',                       6,  2),
('La mejor paella que he visto hacer en YouTube',        1,  3),
('En Valencia se hace sin pollo, ojo!',                  4,  3),
('Python es el mejor lenguaje para empezar',             2,  4),
('Muy completo el curso, gracias!',                      6,  4),
('Esta música me salva en los exámenes',                 1,  5),
('Llevo 3 horas escuchando esto, increíble',             3,  5),
('El iPhone 15 no vale lo que cuesta',                   2,  6),
('Muy objetivo el análisis, me ha convencido',           7,  6),
('Empecé esta rutina hace un mes y ya noto cambios',     1,  7),
('Cuántos días a la semana recomiendas hacerlo?',        8,  7),
('Acabo de empezar a invertir, muy útil el vídeo',       3,  8),
('Qué broker recomiendas para España?',                  5,  8),
('Buenos Aires es una ciudad increíble',                 2,  9),
('Qué cámara usas para grabar?',                         4,  9),
('El mejor setup que he visto en mucho tiempo',          4,  11),
('Qué monitor es ese?',                                  6,  11);

-- ---------------------------------------------------------
-- REACTION_COMMENT
-- ---------------------------------------------------------
INSERT INTO REACTION_COMMENT (id_user, id_comment, reaction) VALUES
(3,  1,  'LIKE'),
(4,  1,  'LIKE'),
(5,  1,  'DISLIKE'),
(1,  2,  'LIKE'),
(6,  2,  'LIKE'),
(2,  3,  'DISLIKE'),
(1,  4,  'LIKE'),
(7,  4,  'LIKE'),
(3,  5,  'LIKE'),
(2,  6,  'LIKE'),
(5,  6,  'LIKE'),
(1,  7,  'DISLIKE'),
(8,  7,  'LIKE'),
(2,  8,  'LIKE'),
(6,  9,  'LIKE'),
(4,  10, 'LIKE'),
(1,  10, 'LIKE'),
(3,  11, 'LIKE'),
(7,  12, 'LIKE'),
(5,  13, 'LIKE'),
(9,  14, 'LIKE');