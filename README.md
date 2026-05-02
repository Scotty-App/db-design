# 🗄️ Scotty App — Base de Datos

> Diseño, documentación e implementación completa de la base de datos de **Scotty App**, plataforma gamificada para aprender programación.

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
    └── triggers/        → Triggers de automatización
```

---

## 📚 Índice de documentación

### Diseño conceptual y lógico
| Sección | Descripción | Enlace |
|---|---|---|
| 4.4.1 | Diagrama Entidad-Relación (E-R) | [docs/er/README.md]([docs/er/README.md](https://github.com/Scotty-App/db-design/tree/main/docs/er)) |
| 4.4.2 | Modelo Relacional | [docs/relational/README.md]([docs/relational/README.md](https://github.com/Scotty-App/db-design/tree/main/docs/relational)) |
| 4.4.3 | Diagrama visual de tablas | [docs/sql-diagram/README.md]([docs/sql-diagram/README.md](https://github.com/Scotty-App/db-design/tree/main/docs/sql-diagram)) |

### Implementación SQL
| Sección | Descripción | Enlace |
|---|---|---|
| DDL | Script completo de creación de tablas | [sql/ddl/README.md]([sql/ddl/README.md](https://github.com/Scotty-App/db-design/tree/main/sql/ddl)) |
| Triggers | Automatización de estados con triggers | [sql/triggers/README.md](https://github.com/Scotty-App/db-design/tree/main/sql/triggers) |

---

## 🔄 Flujo de lectura recomendado

```
E-R → Modelo Relacional → Diagrama SQL → DDL → Triggers
```

Empieza por el diagrama E-R para entender las entidades y relaciones, continúa con el modelo relacional para ver cómo se traducen a tablas, y termina con los scripts SQL para ver la implementación real en SQL Server.

---

## 🛠️ Tecnologías

- **Motor:** SQL Server
- **Diagramas:** Dia (formato `.dia`) + exportación PNG
- **Notación E-R:** Notación de Chen

---

*Proyecto Scotty App · IES Mutxamel · DAW 1º · 2024–2025*
