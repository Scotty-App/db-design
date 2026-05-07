## 4.4.2 Modelo Relacional

A partir del diagrama E-R hemos derivado el modelo relacional. Cada entidad se convierte en una tabla con sus atributos, claves primarias (PK) y claves foráneas (FK):


```
USER (__idUser__, name, email, password, role, address, phone)

PRODUCT (__idProduct__, name, description, price, stock, category)

ORDER (__idOrder__, date, total, status, idUser → USER)

ORDER_DETAILS (__idDetail__, quantity, subtotal, idOrder → ORDER, idProduct → PRODUCT)
```

## Decisiones de diseño

**Tabla USER**
Hemos unificado alumnos y administradores en una sola tabla usando el campo `role` para distinguirlos. Así evitamos duplicar información y la gestión desde JavaFX es más sencilla.

**Tabla ORDER**
Incluye `idUser` como clave foránea que apunta a USER para saber siempre quién realizó cada pedido. Un pedido no puede existir sin un usuario asociado.

**Tabla ORDER_DETAILS**
Es la tabla que más trabajo hace, ya que desglosa el contenido de cada pedido línea a línea. Apunta tanto al pedido al que pertenece como al producto que se compró, lo que permite que un mismo pedido pueda tener tantos productos distintos como necesite sin repetir datos.

**Tabla PRODUCT**
Almacena el catálogo completo de la tienda. El campo `category` solo acepta los valores definidos: Hardware, Peripherals, Gaming, Storage, Accessories y Merchandising.

---

## Archivos

| Archivo | Descripción |
|---|---|
| `mr2.png` | Imagen del modelo relacional |

---

⬅️ [Diagrama E-R](../er/README.md) · ➡️ [Diagrama SQL](../sql-diagram/README.md)
