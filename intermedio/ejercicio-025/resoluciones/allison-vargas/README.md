# Resolucion Ejercicio 025 - UNIQUE para Laboratorio de Formulas Quimicas

**Desarrollado por:** Allison Vargas  
**Dificultad:** Intermedio Aplicado  
Entorno: MySQL 8.0  

## Aplicacion de Restriccion UNIQUE y Relaciones
Para garantizar la integridad y unicidad de los datos en el modulo de laboratorio avanzado:
1. `investigadores`: Incluye restricciones `UNIQUE` en `codigo_investigador` y `email_institucional` para evitar duplicidad de personal.
2. `ensaysos_avanzados`: Incorpora la restricción `UNIQUE` en `codigo_formula` junto con una clave foránea (`FOREIGN KEY`) conectada a la tabla padre.

## Orden de Ejecucion
1. `ddl/schema.sql`
2. `dml/inserts.sql`
3. `dql/consultas.sql`
