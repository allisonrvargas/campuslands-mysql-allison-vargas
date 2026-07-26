USE lab_formulas_intermedio_db;

-- Consulta 1: Relacion detallada de ensayos avanzados cruzados con sus investigadores responsables
SELECT 
    e.codigo_formula AS 'Codigo Formula',
    e.nombre_formula AS 'Nombre Formula',
    inv.nombre_investigador AS 'Investigador Responsable',
    e.categoria AS 'Categoria',
    e.estado AS 'Estado Actual',
    e.costo_insumos AS 'Costo Insumos (USD)'
FROM ensayos_avanzados e
JOIN investigadores inv ON e.id_investigador = inv.id_investigador
ORDER BY e.fecha_registro DESC;

-- Consulta 2: Costo total y cantidad de ensayos agrupados por categoria
SELECT 
    categoria AS 'Categoria de Formula',
    COUNT(*) AS 'Total Ensayos',
    SUM(costo_insumos) AS 'Inversion Total (USD)',
    ROUND(AVG(costo_insumos), 2) AS 'Costo Promedio (USD)'
FROM ensayos_avanzados
GROUP BY categoria
ORDER BY 'Inversion Total (USD)' DESC;

-- Consulta 3: Investigadores y el monto total gestionado en sus ensayos validados
SELECT 
    inv.nombre_investigador AS 'Investigador',
    inv.especialidad AS 'Especialidad',
    COUNT(e.id_ensayo) AS 'Ensayos Validados',
    SUM(e.costo_insumos) AS 'Presupuesto Validado (USD)'
FROM investigadores inv
JOIN ensayos_avanzados e ON inv.id_investigador = e.id_investigador
WHERE e.estado = 'Validado'
GROUP BY inv.id_investigador, inv.nombre_investigador, inv.especialidad
ORDER BY 'Presupuesto Validado (USD)' DESC;

-- Consulta 4: Ensayos avanzados cuyo costo de insumos supera el promedio general
SELECT 
    codigo_formula AS 'Codigo',
    nombre_formula AS 'Formula',
    categoria AS 'Categoria',
    costo_insumos AS 'Costo (USD)'
FROM ensayos_avanzados
WHERE costo_insumos > (SELECT AVG(costo_insumos) FROM ensayos_avanzados)
ORDER BY costo_insumos DESC;

-- Consulta 5: Top 3 de formulas con mayor volumen y aprobadas (Validadas)
SELECT 
    codigo_formula AS 'Formula Estrella',
    nombre_formula AS 'Descripcion',
    volumen_ml AS 'Volumen (mL)',
    costo_insumos AS 'Costo (USD)'
FROM ensayos_avanzados
WHERE estado = 'Validado'
ORDER BY volumen_ml DESC, costo_insumos DESC
LIMIT 3;
