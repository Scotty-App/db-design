## 4.4.2 Modelo Relacional

A partir del diagrama E-R hemos derivado el modelo relacional. Cada entidad se convierte en una tabla con sus atributos, claves primarias (PK) y claves foráneas (FK):
 
```
USER (IdUser, Name, Alias, Email, Password, Date_Conexion, State_Session)
 
STUDENT (IdUser → USER, Token, XPPoint)
 
ADMINISTRATION (IdUser → USER)
 
CANJE (IdCanje, Name, Type, Status, Date_Canje, Cost_Toke, IdUser → USER)
 
ADMIN_CANJE_VALID (IdUser → USER, IdCanje → CANJE, Rejection_Reason, Date_Validation, Approved)
 
GAMES (IdGames, Tittel, Lenguaje, Created_Date, State, Description, Num_Level)
 
LEVEL (IdGames → GAMES, Num_Level, Tittel, XPLevel, Solution)
 
STUD_LEVEL_PLAY (IdUser → USER, (IdGames, Num_Level) → LEVEL, XP, State, Date)
```
 
Hay algunos detalles del modelo que nos gustaría aclarar:
 
Tanto STUDENT como ADMINISTRATION heredan todos los atributos de USER, utilizando IdUser como clave primaria propia y al mismo tiempo como referencia hacia la tabla padre, siguiendo el patrón de especialización estudiado en clase.
 
Un nivel (LEVEL) no puede existir sin su juego, por lo que su clave primaria es compuesta: (IdGames, Num_Level). El campo Num_Level no es único por sí solo, sino que numera los niveles dentro de cada juego empezando siempre desde 1. Es decir, el nivel 1 de Java y el nivel 1 de JavaScript son registros distintos porque pertenecen a juegos diferentes.
 
Hemos creado esta la tabla STUD_LEVEL_PLAY para registrar el progreso individual de cada estudiante por nivel. Al apuntar tanto a STUDENT como a LEVEL, su clave primaria está formada por tres campos: IdUser, IdGames y Num_Level, heredando las claves de ambas tablas. Los campos State, XP y Date son propios de esta relación, ya que su valor varía para cada combinación estudiante-nivel.
 
Hemos creado esta la tabla ADMIN_CANJE_VALID para registrar la decisión del administrador sobre cada solicitud de canje. El campo Approved es un booleano: si es false, se rellena automáticamente Rejection_Reason con el motivo del rechazo. Para mantener la coherencia con el campo Status de CANJE, implementaremos un trigger en la base de datos que actualice ese estado automáticamente cada vez que el administrador registre una validación.
 
No hemos creído necesario crear una tabla adicional para el ranking, ya que se obtiene directamente ordenando la tabla STUDENT por XPPoint de forma descendente.
