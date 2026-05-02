# DDL — Script de creación de tablas

Este directorio contiene el script SQL completo para crear toda la estructura de la base de datos de Scotty App en SQL Server.

---

## Cómo ejecutar

1. Abre SQL Server Management Studio (SSMS)
2. Conéctate a tu instancia de SQL Server
3. Abre el archivo `SQLScotty.sql`
4. Ejecuta el script completo (`F5` o botón Execute)

> ⚠️ Asegúrate de crear primero la base de datos y seleccionarla antes de ejecutar el script.

---

## Qué crea este script

| Tabla | Descripción |
|---|---|
| `USER` | Tabla base de todos los usuarios del sistema |
| `STUDENT` | Especialización de USER para alumnos (XP y tokens) |
| `ADMINISTRATION` | Especialización de USER para administradores |
| `GAMES` | Juegos/lenguajes de programación disponibles |
| `LEVEL` | Niveles de cada juego (entidad débil) |
| `STUD_LEVEL_PLAY` | Progreso individual de cada alumno por nivel |
| `CANJE` | Solicitudes de canje de tokens por recompensas |
| `ADMIN_CANJE_VALID` | Validaciones de canjes realizadas por administradores |

---

## Archivos

| Archivo | Descripción |
|---|---|
| `SQLScotty.sql` | Script DDL completo de creación de tablas |

---

⬅️ [Diagrama SQL](../../docs/sql-diagram/README.md) · ➡️ [Triggers](../triggers/README.md)
