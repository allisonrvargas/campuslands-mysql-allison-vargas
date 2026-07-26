USE lab_formulas_backup_db;

-- Insercion de Formulas Quimicas
INSERT INTO formulas_quimicas (codigo_formula, nombre_formula, categoria, nivel_ph, estado) VALUES
('FORM-PHARM-01', 'Analgesico de Liberacion Prolongada', 'farmaceutico', 6.50, 'aprobado'),
('FORM-COSM-02', 'Serum Hidratante de Acido Hialuronico', 'cosmetico', 5.50, 'aprobado'),
('FORM-IND-03', 'Solucion Desengrasante Alcalina', 'industrial', 12.80, 'en_desarrollo'),
('FORM-ALIM-04', 'Conservante Natural Orgánico', 'alimentario', 4.20, 'aprobado'),
('FORM-PHARM-05', 'Jarabe Expectorante Pediátrico', 'farmaceutico', 6.80, 'en_revision');

-- Insercion de Reactivos
INSERT INTO reactivos (nombre_reactivo, pureza_porcentaje, stock_litros, costo_por_litro_usd) VALUES
('Agua Desionizada UV', 99.90, 2500.00, 1.20),
('Acido Salicilico USP', 98.50, 150.00, 45.00),
('Glicerina Vegetal USP', 99.50, 800.00, 12.50),
('Hidroxido de Sodio 1M', 95.00, 300.00, 18.00),
('Alcohol Etilico 96%', 96.00, 1200.00, 8.50);

-- Insercion de Ensayes de Laboratorio
INSERT INTO ensaye_formulas (id_formula, id_reactivo, volumen_utilizado_l, temperatura_celsius, resultado, fecha_ensaye) VALUES
(1, 2, 15.50, 25.00, 'exitoso', '2026-03-01 09:00:00'),
(2, 3, 40.00, 30.50, 'exitoso', '2026-03-01 11:30:00'),
(3, 4, 100.00, 65.00, 'fallido', '2026-03-02 14:00:00'),
(4, 1, 200.00, 22.00, 'exitoso', '2026-03-02 16:15:00'),
(5, 5, 50.00, 18.00, 'inconcluso', '2026-03-03 10:00:00'),
(1, 1, 120.00, 24.00, 'exitoso', '2026-03-03 13:45:00'),
(2, 1, 80.00, 28.00, 'exitoso', '2026-03-04 09:20:00'),
(3, 4, 85.00, 70.00, 'exitoso', '2026-03-04 15:10:00');
