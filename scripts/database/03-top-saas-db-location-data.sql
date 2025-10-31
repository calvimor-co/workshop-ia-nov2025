-- Script de inserción de datos para la tabla location (PostgreSQL/Supabase)

INSERT INTO location (id, city, state, country, created_at, created_by, updated_at, updated_by) VALUES 
(1, 'Redmond', 'WA', 'USA', NOW(), null, NOW(), null), 
(2, 'San Francisco', 'CA', 'USA', NOW(), null, NOW(), null), 
(3, 'San Jose', 'CA', 'USA', NOW(), null, NOW(), null), 
(4, 'Austin', 'TX', 'USA', NOW(), null, NOW(), null), 
(5, 'Walldorf', null, 'Germany', NOW(), null, NOW(), null), 
(6, 'Mountain View', 'CA', 'USA', NOW(), null, NOW(), null), 
(7, 'Santa Clara', 'CA', 'USA', NOW(), null, NOW(), null), 
(8, 'Pleasanton', 'CA', 'USA', NOW(), null, NOW(), null), 
(9, 'Ottawa', null, 'Canada', NOW(), null, NOW(), null), 
(10, 'Sydney', null, 'Australia', NOW(), null, NOW(), null), 
(11, 'Bozeman', 'MT', 'USA', NOW(), null, NOW(), null), 
(12, 'Cambridge', 'MA', 'USA', NOW(), null, NOW(), null), 
(13, 'New York', 'NY', 'USA', NOW(), null, NOW(), null), 
(14, 'Denver', 'CO', 'USA', NOW(), null, NOW(), null), 
(15, 'Tel Aviv', null, 'Israel', NOW(), null, NOW(), null), 
(16, 'Redwood City', 'CA', 'USA', NOW(), null, NOW(), null), 
(17, 'San Mateo', 'CA', 'USA', NOW(), null, NOW(), null), 
(18, 'Boston', 'MA', 'USA', NOW(), null, NOW(), null), 
(19, 'Atlanta', 'GA', 'USA', NOW(), null, NOW(), null), 
(20, 'Bellevue', 'WA', 'USA', NOW(), null, NOW(), null), 
(21, 'Santa Cruz', 'CA', 'USA', NOW(), null, NOW(), null), 
(22, 'Belmont', 'CA', 'USA', NOW(), null, NOW(), null), 
(23, 'San Ramon', 'CA', 'USA', NOW(), null, NOW(), null), 
(24, 'Vancouver', 'WA', 'USA', NOW(), null, NOW(), null), 
(25, 'Provo', 'UT', 'USA', NOW(), null, NOW(), null), 
(26, 'Seattle', 'WA', 'USA', NOW(), null, NOW(), null), 
(27, 'Oakland', 'CA', 'USA', NOW(), null, NOW(), null), 
(28, 'Palo Alto', 'CA', 'USA', NOW(), null, NOW(), null), 
(29, 'Munich', null, 'Germany', NOW(), null, NOW(), null), 
(30, 'Sunnyvale', 'CA', 'USA', NOW(), null, NOW(), null), 
(31, 'Kirkland', 'WA', 'USA', NOW(), null, NOW(), null), 
(32, 'Glendale', 'CA', 'USA', NOW(), null, NOW(), null), 
(33, 'Carpinteria', 'CA', 'USA', NOW(), null, NOW(), null);

-- Actualizar la secuencia para que continúe desde el último ID insertado
SELECT setval('location_id_seq', (SELECT MAX(id) FROM location));