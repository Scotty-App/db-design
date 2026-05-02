## Trigger
Hemos implementado el trigger trg_UpdateCanjeStatus que se dispara automáticamente tras cada inserción en ADMIN_CANJE_VALID. Cuando el administrador registra su decisión, el trigger actualiza el Status de CANJE a 'accepted' o 'rejected' según el valor de Approved, manteniendo ambos campos siempre sincronizados sin necesidad de intervención manual.
