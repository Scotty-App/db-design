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
| `USER` | Usuarios registrados en el sistema (alumnos y administradores) |
| `PRODUCT` | Catálogo de productos de la tienda con stock y categoría |
| `ORDER` | Pedidos realizados por los usuarios |
| `ORDER_DETAILS` | Detalle de productos incluidos en cada pedido |

---

## Automatizaciones incluidas

| Elemento | Descripción |
|---|---|
| Trigger `trg_UpdateStock` | Reduce el stock de cada producto al procesar un pedido |
| Procedure `sp_CalcularTotal` | Recalcula el total del pedido al añadir líneas de detalle |

---

## Archivos

| Archivo | Descripción |
|---|---|
| `SQLScotty.sql` | Script DDL completo de creación de tablas |

---

⬅️ [Diagrama SQL](../../docs/sql-diagram/README.md) · ➡️ [Triggers](../triggers/README.md)
