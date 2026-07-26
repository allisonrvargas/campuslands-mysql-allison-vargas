USE lab_formulas_basico_db;

INSERT INTO ensayos_quimicos (codigo_formula, nombre_formula, categoria, volumen_ml, costo_insumos, estado, fecha_registro) VALUES
('FOR-001', 'Solucion Amortiguadora pH 7', 'Buffer', 250.00, 45.50, 'Aprobado', '2026-05-10'),
('FOR-002', 'Catalizador Enzimatico A-2', 'Catalizador', 100.00, 120.00, 'Aprobado', '2026-05-12'),
('FOR-003', 'Reactivo de Identificacion X', 'Reactivo', 500.00, 85.20, 'Pendiente', '2026-05-15'),
('FOR-004', 'Solucion Salina Fisiologica', 'Buffer', 1000.00, 15.00, 'Aprobado', '2026-06-01'),
('FOR-005', 'Inhibidor de Oxidacion R-9', 'Inhibidor', 150.00, 210.50, 'Rechazado', '2026-06-03'),
('FOR-006', 'Polimero Superabsorbente Gel', 'Polimero', 300.00, 95.00, 'Aprobado', '2026-06-10'),
('FOR-007', 'Solucion Indicadora Fenolftaleina', 'Indicador', 200.00, 30.00, 'Aprobado', '2026-06-12'),
('FOR-008', 'Complejo Quelante Metalico', 'Quelante', 400.00, 175.80, 'Pendiente', '2026-06-20');
