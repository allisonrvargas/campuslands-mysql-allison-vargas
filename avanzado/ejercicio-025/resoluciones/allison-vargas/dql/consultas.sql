USE lab_formulas_backup_db;

-- Consulta 1: Reporte integral de ensayes asociando formula y reactivo
SELECT 
    f.codigo_formula AS 'Codigo Formula',
    f.nombre_formula AS 'Formula',
    r.nombre_reactivo AS 'Reactivo Usado',
    e.volumen_utilizado_l AS 'Volumen (L)',
    ROUND(e.volumen_utilizado_l * r.costo_por_litro_usd, 2) AS 'Costo Ensaye (USD)',
    e.resultado AS 'Resultado'
FROM ensaye_formulas e
JOIN formulas_quimicas f ON e.id_formula = f.id_formula
JOIN reactivos r ON e.id_reactivo = r.id_reactivo
ORDER BY e.fecha_ensaye DESC;

-- Consulta 2: Valor del inventario de reactivos por nivel de pureza
SELECT 
    nombre_reactivo AS 'Reactivo',
    pureza_porcentaje AS 'Pureza (%)',
    stock_litros AS 'Stock Disponible (L)',
    ROUND(stock_litros * costo_por_litro_usd, 2) AS 'Valor Inventario (USD)'
FROM reactivos
ORDER BY `Valor Inventario (USD)` DESC;

-- Consulta 3: Cantidad de formulas por estado y promedio de pH
SELECT 
    estado AS 'Estado de Desarrollo',
    COUNT(*) AS 'Total Formulas',
    ROUND(AVG(nivel_ph), 2) AS 'pH Promedio'
FROM formulas_quimicas
GROUP BY estado
ORDER BY `Total Formulas` DESC;

-- Consulta 4: Resumen del consumo total de reactivos en ensayes exitosos
SELECT 
    r.nombre_reactivo AS 'Reactivo',
    SUM(e.volumen_utilizado_l) AS 'Total Litros Usados',
    ROUND(SUM(e.volumen_utilizado_l * r.costo_por_litro_usd), 2) AS 'Inversion en Ensayes (USD)'
FROM ensaye_formulas e
JOIN reactivos r ON e.id_reactivo = r.id_reactivo
WHERE e.resultado = 'exitoso'
GROUP BY r.id_reactivo, r.nombre_reactivo
ORDER BY `Inversion en Ensayes (USD)` DESC;

-- Consulta 5: Top 3 de formulas con mayor costo acumulado en pruebas
SELECT 
    f.nombre_formula AS 'Formula',
    f.categoria AS 'Categoria',
    ROUND(SUM(e.volumen_utilizado_l * r.costo_por_litro_usd), 2) AS 'Gasto Acumulado Pruebas (USD)'
FROM ensaye_formulas e
JOIN formulas_quimicas f ON e.id_formula = f.id_formula
JOIN reactivos r ON e.id_reactivo = r.id_reactivo
GROUP BY f.id_formula, f.nombre_formula, f.categoria
ORDER BY `Gasto Acumulado Pruebas (USD)` DESC
LIMIT 3;
