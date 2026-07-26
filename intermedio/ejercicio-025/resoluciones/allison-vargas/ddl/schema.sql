-- Creacion de la base de datos si no existe
CREATE DATABASE IF NOT EXISTS lab_formulas_intermedio_db;
USE lab_formulas_intermedio_db;

-- Limpieza preventiva
DROP TABLE IF EXISTS ensayos_avanzados;
DROP TABLE IF EXISTS investigadores;

-- Tabla Padre: Investigadores Responsables (Entidad Principal con UNIQUE en correo y codigo)
CREATE TABLE investigadores (
    id_investigador INT AUTO_INCREMENT PRIMARY KEY,
    codigo_investigador VARCHAR(20) UNIQUE NOT NULL,
    nombre_investigador VARCHAR(100) NOT NULL,
    especialidad VARCHAR(50) NOT NULL,
    email_institucional VARCHAR(100) UNIQUE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla Hija: Ensayos Avanzados (Uso de UNIQUE en codigo_formula y FOREIGN KEY)
CREATE TABLE ensayos_avanzados (
    id_ensayo INT AUTO_INCREMENT PRIMARY KEY,
    id_investigador INT NOT NULL,
    codigo_formula VARCHAR(30) UNIQUE NOT NULL,
    nombre_formula VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    volumen_ml DECIMAL(8,2) NOT NULL CHECK (volumen_ml > 0),
    costo_insumos DECIMAL(10,2) NOT NULL CHECK (costo_insumos >= 0),
    estado ENUM('En Proceso', 'Validado', 'Rechazado') DEFAULT 'En Proceso',
    fecha_registro DATE NOT NULL,
    CONSTRAINT fk_investigador_ensayo FOREIGN KEY (id_investigador) REFERENCES investigadores(id_investigador) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
