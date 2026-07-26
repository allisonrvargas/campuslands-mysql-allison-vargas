USE lab_formulas_basico_db;

SELECT COUNT(*) AS 'Total Ensayos Registrados' FROM ensayos_quimicos;

SELECT categoria AS 'Categoria', COUNT(*) AS 'Total Formulas', SUM(costo_insumos) AS 'Inversion Total (USD)'
FROM ensayos_quimicos GROUP BY categoria;

SELECT estado AS 'Estado', COUNT(*) AS 'Cantidad' FROM ensayos_quimicos GROUP BY estado;

SELECT SUM(costo_insumos) AS 'Costo Total Aprobados', SUM(volumen_ml) AS 'Volumen Total ML'
FROM ensayos_quimicos WHERE estado = 'Aprobado';

SELECT categoria AS 'Categoria', COUNT(*) AS 'Total Aprobados', SUM(costo_insumos) AS 'Costo Acumulado'
FROM ensayos_quimicos WHERE estado = 'Aprobado' GROUP BY categoria ORDER BY 'Costo Acumulado' DESC;
