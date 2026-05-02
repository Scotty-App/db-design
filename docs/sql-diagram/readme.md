## 4.4.3 Script SQL de creación de tablas
 
Con el modelo relacional definido, hemos trasladado toda la estructura a SQL Server. Hay algunas decisiones que tomamos durante la implementación que merece la pena comentar:
 
Para garantizar la integridad de los datos desde la propia base de datos, hemos aplicado constraints CHECK en todos los campos que solo admiten valores concretos: el formato del email, el estado de sesión, los lenguajes disponibles, el estado del canje y el estado del nivel. Así no dependemos únicamente de las validaciones del backend.
 
Para los campos con valores predecibles hemos definido valores por defecto directamente en la tabla: State_Session arranca como 'disabled', el Status del canje como 'pending', el State del nivel como 'BLOQUEADO' y todas las fechas toman el valor del momento de inserción con GETDATE().
 
La tabla STUD_LEVEL_PLAY tiene una clave primaria compuesta por tres campos: IdUser, IdGames y Num_Level, ya que necesitamos identificar de forma única cada combinación de estudiante y nivel para registrar correctamente su progreso individual.

 
---
 
Hemos implementado el trigger trg_UpdateCanjeStatus que se dispara automáticamente tras cada inserción en ADMIN_CANJE_VALID. Cuando el administrador registra su decisión, el trigger actualiza el Status de CANJE a 'accepted' o 'rejected' según el valor de Approved, manteniendo ambos campos siempre sincronizados sin necesidad de intervención manual.
 
```sql
CREATE OR ALTER TRIGGER trg_UpdateCanjeStatus
ON ADMIN_CANJE_VALID
AFTER INSERT
AS
BEGIN
    DECLARE @idcanje int = (SELECT IdCanje FROM inserted)
    DECLARE @approved bit = (SELECT Approved FROM inserted)
 
    IF @approved = 1
        BEGIN
            UPDATE CANJE
            SET Status = 'accepted'
            WHERE IdCanje = @idcanje
        END
    ELSE
        BEGIN
            UPDATE CANJE
            SET Status = 'rejected'
            WHERE IdCanje = @idcanje
        END
END
```
 
