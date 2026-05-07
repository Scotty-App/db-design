# 🗄️ Scotty App — Base de Datos

> Diseño, documentación e implementación completa de la base de datos de **Scotty App**, plataforma gamificada para repasar y afianzar lenguajes de programación.

---

## 📁 Estructura del repositorio

```
database/
├── docs/
│   ├── er/              → Diagrama Entidad-Relación
│   ├── relational/      → Modelo Relacional
│   └── sql-diagram/     → Diagrama visual de tablas SQL
│
└── sql/
    ├── ddl/             → Script de creación de tablas
    ├── triggers/        → Triggers de automatización
    └── procedures/      → Stored Procedures
```

## 📚 Índice de documentación

### Diseño conceptual y lógico

| Sección | Descripción | Enlace |
|---|---|---|
| 4.4.1 | Diagrama Entidad-Relación (E-R) | [docs/er/](https://github.com/Scotty-App/Scotty-App-Backend/tree/main/docs/er) |
| 4.4.2 | Modelo Relacional | [docs/relational/](https://github.com/Scotty-App/Scotty-App-Backend/tree/main/docs/relational) |
| 4.4.3 | Diagrama visual de tablas | [docs/sql-diagram/](https://github.com/Scotty-App/Scotty-App-Backend/tree/main/docs/sql-diagram) |

### Implementación SQL

| Sección | Descripción | Enlace |
|---|---|---|
| DDL | Script completo de creación de tablas | [sql/ddl/](https://github.com/Scotty-App/Scotty-App-Backend/tree/main/sql/ddl) |
| Triggers | Automatización de stock al procesar pedidos | [sql/triggers/](https://github.com/Scotty-App/Scotty-App-Backend/tree/main/sql/triggers) |
| Procedures | Cálculo automático del total del pedido | [sql/procedures/](https://github.com/Scotty-App/Scotty-App-Backend/tree/main/sql/procedures) |

---

## 🔄 Flujo de lectura recomendado

E-R → Modelo Relacional → Diagrama SQL → DDL → Triggers → Procedures

Empieza por el diagrama E-R para entender las entidades y relaciones, continúa con el modelo relacional para ver cómo se traducen a tablas, y termina con los scripts SQL para ver la implementación real en SQL Server.

---

## 🛠️ Tecnologías

- **Motor:** SQL Server
- **Diagramas:** diagrams.net + exportación PNG
- **Notación E-R:** Notación de Chen

---

*Proyecto Scotty App · IES Mutxamel · DAW 1º · 2025–2026*
