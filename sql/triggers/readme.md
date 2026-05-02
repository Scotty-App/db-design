## Trigger
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
