-- ============================================================
-- SCOTTY APP — Script de creación de base de datos
-- Autor: José Ramón Castillo Amat
-- Proyecto Intermodular 1º DAW — IES Mutxamel 2025/2026
-- ============================================================

--CREATE DATABASE ScottyApp
GO
USE ScottyApp
GO

-- ============================================================
-- BLOQUE 1: USUARIOS Y PERFILES
-- ============================================================

CREATE TABLE Usuarios (
    id_usuario    INT           IDENTITY(1,1) PRIMARY KEY NOT NULL,
    nombre        VARCHAR(100)  NOT NULL,
    email         VARCHAR(150)  NOT NULL UNIQUE,
    contrasena    VARCHAR(255)  NOT NULL,
    tipo_usuario  VARCHAR(15)   NOT NULL
        CHECK (tipo_usuario IN ('invitado', 'alumno', 'profesor', 'administrador')),
    fecha_registro DATETIME     NOT NULL DEFAULT GETDATE()
)

-- Perfil gamificado del alumno (XP, tokens, nivel de rango)
CREATE TABLE Perfil_Alumno (
    id_perfil       INT           IDENTITY(1,1) PRIMARY KEY NOT NULL,
    id_usuario      INT           NOT NULL UNIQUE,
    xp_total        INT           NOT NULL DEFAULT 0,
    nivel_rango     INT           NOT NULL DEFAULT 1,
    tokens_totales  INT           NOT NULL DEFAULT 0,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios (id_usuario)
)

-- ============================================================
-- BLOQUE 2: CONTENIDO EDUCATIVO
-- ============================================================

CREATE TABLE Juegos (
    id_juego      INT           IDENTITY(1,1) PRIMARY KEY NOT NULL,
    titulo        VARCHAR(150)  NOT NULL,
    descripcion   VARCHAR(MAX)  NULL,
    lenguaje      VARCHAR(50)   NOT NULL,
    dificultad    NVARCHAR(15)  NOT NULL
        CHECK (dificultad IN ('principiante', 'intermedio', 'avanzado')),
    activo        BIT           NOT NULL DEFAULT 1
)

CREATE TABLE Niveles (
    id_nivel        INT           IDENTITY(1,1) PRIMARY KEY NOT NULL,
    id_juego        INT           NOT NULL,
    titulo          VARCHAR(150)  NOT NULL,
    descripcion     VARCHAR(MAX)  NULL,
    orden           INT           NOT NULL,
    xp_recompensa   INT           NOT NULL DEFAULT 10,
    FOREIGN KEY (id_juego) REFERENCES Juegos (id_juego)
)

CREATE TABLE Retos (
    id_reto       INT           IDENTITY(1,1) PRIMARY KEY NOT NULL,
    id_nivel      INT           NOT NULL,
    enunciado     VARCHAR(MAX)  NOT NULL,
    tipo          VARCHAR(10)   NOT NULL
        CHECK (tipo IN ('bloques', 'codigo', 'test')),
    solucion      VARCHAR(MAX)  NULL,
    FOREIGN KEY (id_nivel) REFERENCES Niveles (id_nivel)
)

-- ============================================================
-- BLOQUE 3: PROGRESO Y GAMIFICACIÓN
-- ============================================================

CREATE TABLE Progreso_Nivel (
    id_progreso     INT           IDENTITY(1,1) PRIMARY KEY NOT NULL,
    id_usuario      INT           NOT NULL,
    id_nivel        INT           NOT NULL,
    estado          VARCHAR(15)   NOT NULL
        CHECK (estado IN ('bloqueado', 'en_progreso', 'completado')),
    fecha_completado DATETIME     NULL,
    UNIQUE (id_usuario, id_nivel),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios (id_usuario),
    FOREIGN KEY (id_nivel)   REFERENCES Niveles (id_nivel)
)

CREATE TABLE Intentos_Reto (
    id_intento    INT           IDENTITY(1,1) PRIMARY KEY NOT NULL,
    id_usuario    INT           NOT NULL,
    id_reto       INT           NOT NULL,
    respuesta     VARCHAR(MAX)  NULL,
    correcto      BIT           NOT NULL,
    xp_obtenido   INT           NOT NULL DEFAULT 0,
    fecha         DATETIME      NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios (id_usuario),
    FOREIGN KEY (id_reto)    REFERENCES Retos (id_reto)
)

-- ============================================================
-- BLOQUE 4: TIENDA Y RECOMPENSAS
-- ============================================================

CREATE TABLE Recompensas (
    id_recompensa   INT           IDENTITY(1,1) PRIMARY KEY NOT NULL,
    nombre          VARCHAR(100)  NOT NULL,
    descripcion     VARCHAR(MAX)  NULL,
    coste_tokens    INT           NOT NULL,
    tipo            VARCHAR(20)   NOT NULL
        CHECK (tipo IN ('insignia', 'avatar', 'beneficio_academico', 'otro')),
    activo          BIT           NOT NULL DEFAULT 1
)

CREATE TABLE Canjes (
    id_canje        INT           IDENTITY(1,1) PRIMARY KEY NOT NULL,
    id_usuario      INT           NOT NULL,
    id_recompensa   INT           NOT NULL,
    fecha_solicitud DATETIME      NOT NULL DEFAULT GETDATE(),
    estado          VARCHAR(15)   NOT NULL DEFAULT 'pendiente'
        CHECK (estado IN ('pendiente', 'validado', 'rechazado')),
    id_admin_validador INT        NULL,
    FOREIGN KEY (id_usuario)         REFERENCES Usuarios (id_usuario),
    FOREIGN KEY (id_recompensa)      REFERENCES Recompensas (id_recompensa),
    FOREIGN KEY (id_admin_validador) REFERENCES Usuarios (id_usuario)
)

-- ============================================================
-- BLOQUE 5: GESTIÓN DE CLASE (PROFESOR)
-- ============================================================

CREATE TABLE Equipos (
    id_equipo     INT           IDENTITY(1,1) PRIMARY KEY NOT NULL,
    nombre        VARCHAR(100)  NOT NULL,
    id_profesor   INT           NOT NULL,
    fecha_creacion DATETIME     NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (id_profesor) REFERENCES Usuarios (id_usuario)
)

CREATE TABLE Equipos_Alumnos (
    id_equipo   INT NOT NULL,
    id_alumno   INT NOT NULL,
    PRIMARY KEY (id_equipo, id_alumno),
    FOREIGN KEY (id_equipo) REFERENCES Equipos (id_equipo),
    FOREIGN KEY (id_alumno) REFERENCES Usuarios (id_usuario)
)

CREATE TABLE Retos_Asignados (
    id_asignacion   INT           IDENTITY(1,1) PRIMARY KEY NOT NULL,
    id_equipo       INT           NOT NULL,
    id_reto         INT           NOT NULL,
    id_profesor     INT           NOT NULL,
    fecha_asignacion DATETIME     NOT NULL DEFAULT GETDATE(),
    fecha_limite    DATETIME      NULL,
    FOREIGN KEY (id_equipo)   REFERENCES Equipos (id_equipo),
    FOREIGN KEY (id_reto)     REFERENCES Retos (id_reto),
    FOREIGN KEY (id_profesor) REFERENCES Usuarios (id_usuario)
)
GO