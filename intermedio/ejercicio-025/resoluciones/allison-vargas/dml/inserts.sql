USE lab_formulas_intermedio_db;

-- Insercion en Tabla Padre (Investigadores con restricciones UNIQUE)
INSERT INTO investigadores (codigo_investigador, nombre_investigador, especialidad, email_institucional) VALUES
('INV-101', 'Dra. Elena Vargas', 'Quimica Analitica', 'evargas@labformulas.com'),
('INV-102', 'Dr. Carlos Mendoza', 'Polimeros y Materiales', 'cmendoza@labformulas.com'),
('INV-103', 'Lic. Sofia Ramirez', 'Bioquimica', 'sramirez@labformulas.com'),
('INV-104', 'Ing. Javier Castro', 'Catalisis Quimica', 'jcastro@labformulas.com');

-- Insercion en Tabla Hija (Ensayos Avanzados con codigos de formula UNIQUE)
INSERT INTO ensayos_avanzados (id_investigador, codigo_formula, nombre_formula, categoria, volumen_ml, costo_insumos, estado, fecha_registro) VALUES
(1, 'FOR-ADV-001', 'Solucion Reguladora de pH Alta Precision', 'Buffer', 500.00, 120.50, 'Validado', '2026-06-01'),
(2, 'FOR-ADV-002', 'Polimero Biodegradable Nanoreforzado', 'Polimero', 1000.00, 350.00, 'Validado', '2026-06-03'),
(3, 'FOR-ADV-003', 'Enzima Modificada de Activacion Rapida', 'Catalizador', 250.00, 210.80, 'En Proceso', '2026-06-05'),
(1, 'FOR-ADV-004', 'Reactivo Especial para Cromatografia', 'Reactivo', 300.00, 85.00, 'Validado', '2026-06-10'),
(4, 'FOR-ADV-005', 'Catalizador Organometalico de Transicion', 'Catalizador', 150.00, 420.00, 'Rechazado', '2026-06-12'),
(2, 'FOR-ADV-006', 'Hidrogel Superabsorbente de Poliacrilamida', 'Polimero', 750.00, 175.25, 'Validado', '2026-06-15'),
(3, 'FOR-ADV-007', 'Solucion Salina Tamponada Estéril', 'Buffer', 1000.00, 45.00, 'Validado', '2026-06-18'),
(4, 'FOR-ADV-008', 'Complejo Quelante de Metales Pesados', 'Quelante', 400.00, 290.00, 'En Proceso', '2026-06-20');
