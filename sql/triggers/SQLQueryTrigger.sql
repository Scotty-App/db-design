use ScottyApp

-- TRIGGER
-- Actualiza el estado del canje según la decisión del administrador

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