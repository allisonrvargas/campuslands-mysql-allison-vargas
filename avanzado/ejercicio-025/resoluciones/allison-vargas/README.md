# Resolucion Ejercicio 025 - Backup Logico para Laboratorio de Formulas Quimicas

**Desarrollado por:** Allison Vargas
**Dificultad:** Avanzado Aplicado
**Entorno:** MySQL 8.0

## Estrategia de Respaldo Logico (mysqldump)
Para garantizar la preservacion y recuperacion ante desastres de las formulas quimicas y ensayos:

### 1. Comando de Respaldo Completo (Estructura y Datos)
```bash
mysqldump -u usuario -p --routines --triggers lab_formulas_backup_db > lab_formulas_backup.sql