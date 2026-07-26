-- Creacion de la base de datos si no existe
CREATE DATABASE IF NOT EXISTS lab_formulas_backup_db;
USE lab_formulas_backup_db;

-- Limpieza preventiva
DROP TABLE IF EXISTS ensaye_formulas;
DROP TABLE IF EXISTS reactivos;
DROP TABLE IF EXISTS formulas_quimicas;

-- Tabla 1: Formulas Quimicas Principales
CREATE TABLE formulas_quimicas (
    id_formula INT AUTO_INCREMENT PRIMARY KEY,
    codigo_formula VARCHAR(30) UNIQUE NOT NULL,
    nombre_formula VARCHAR(100) NOT NULL,
    categoria ENUM('farmaceutico', 'cosmetico', 'industrial', 'alimentario') NOT NULL,
    nivel_ph DECIMAL(4,2) CHECK (nivel_ph BETWEEN 0.00 AND 14.00),
    estado ENUM('en_desarrollo', 'aprobado', 'en_revision', 'descontinuado') DEFAULT 'en_desarrollo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla 2: Inventario de Reactivos Base
CREATE TABLE reactivos (
    id_reactivo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_reactivo VARCHAR(100) NOT NULL,
    pureza_porcentaje DECIMAL(5,2) NOT NULL CHECK (pureza_porcentaje BETWEEN 0.00 AND 100.00),
    stock_litros DECIMAL(10,2) NOT NULL CHECK (stock_litros >= 0),
    costo_por_litro_usd DECIMAL(10,2) NOT NULL CHECK (costo_por_litro_usd > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla 3: Ensayes y Pruebas de Laboratorio
CREATE TABLE ensaye_formulas (
    id_ensaye INT AUTO_INCREMENT PRIMARY KEY,
    id_formula INT NOT NULL,
    id_reactivo INT NOT NULL,
    volumen_utilizado_l DECIMAL(8,2) NOT NULL CHECK (volumen_utilizado_l > 0),
    temperatura_celsius DECIMAL(5,2) NOT NULL,
    resultado ENUM('exitoso', 'fallido', 'inconcluso') NOT NULL,
    fecha_ensaye DATETIME NOT NULL,
    FOREIGN KEY (id_formula) REFERENCES formulas_quimicas(id_formula) ON DELETE CASCADE,
    FOREIGN KEY (id_reactivo) REFERENCES reactivos(id_reactivo) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
