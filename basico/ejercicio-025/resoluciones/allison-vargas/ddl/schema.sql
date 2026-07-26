CREATE DATABASE IF NOT EXISTS lab_formulas_basico_db;
USE lab_formulas_basico_db;

DROP TABLE IF EXISTS ensayos_quimicos;

CREATE TABLE ensayos_quimicos (
    id_ensayo INT AUTO_INCREMENT PRIMARY KEY,
    codigo_formula VARCHAR(30) NOT NULL UNIQUE,
    nombre_formula VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    volumen_ml DECIMAL(8,2) NOT NULL CHECK (volumen_ml > 0),
    costo_insumos DECIMAL(10,2) NOT NULL CHECK (costo_insumos >= 0),
    estado ENUM('Pendiente', 'Aprobado', 'Rechazado') DEFAULT 'Pendiente',
    fecha_registro DATE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
