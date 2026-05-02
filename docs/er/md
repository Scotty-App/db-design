## 4.4.1 Diagrama Entidad-Relación (E-R)
 
Para diseñar la base de datos hemos identificado las entidades principales del sistema y cómo se relacionan entre sí, siguiendo la notación estudiada en el módulo de Bases de Datos.
 
**Usuarios y tipos de acceso**
 
La entidad USER centraliza los datos comunes a todos los usuarios: identificador, nombre, alias, email, contraseña, fecha de última conexión y estado de sesión. A partir de ella aplicamos una especialización IS A que da lugar a dos perfiles: STUDENT y ADMINISTRATION. Un usuario solo puede ser una cosa u otra, nunca las dos a la vez.
 
STUDENT añade dos atributos propios para controlar el progreso del alumno: los XP totales acumulados y el saldo de tokens disponible. ADMINISTRATION no necesita atributos adicionales, ya que su función es puramente de gestión.
 
**Juegos y niveles**
 
GAMES representa cada lenguaje de programación disponible. Para cada juego guardamos título, lenguaje, descripción, número de niveles, fecha de creación y estado activo o inactivo, lo que nos permite activar o desactivar juegos sin eliminarlos de la base de datos.
 
Cada juego se divide en LEVEL, que es una entidad débil: un nivel no puede existir sin su juego. Para cada nivel guardamos su número de orden dentro del juego, el título, la solución correcta del ejercicio y los XP que otorga al superarlo. Esto nos permite controlar el desbloqueo progresivo de niveles y calcular la puntuación obtenida en cada uno.
 
**Progreso del estudiante**
 
La relación play entre STUDENT y LEVEL resuelve el muchos a muchos: un estudiante puede jugar varios niveles y un mismo nivel puede ser jugado por varios estudiantes. Para cada combinación guardamos los XP obtenidos, el estado del nivel (bloqueado, en progreso o completado) y la fecha en que se jugó, lo que nos permite reconstruir el historial completo de cada alumno.
 
**Canjes de tokens**
 
CANJE registra cada solicitud de canje de tokens. Guardamos el nombre y tipo de recompensa, el coste en tokens, la fecha de solicitud y el estado actual. Cada canje debe ser validado por un administrador a través de la relación validate, que registra si fue aprobado, la razón de rechazo si procede y la fecha de validación.
 
Es importante destacar que CANJE tiene un campo status y la relación validate tiene un campo approved. Para evitar inconsistencias entre ambos, el status del canje se actualizará automáticamente mediante un trigger en base de datos cada vez que el administrador registre una validación, garantizando que ambos campos estén siempre sincronizados.
