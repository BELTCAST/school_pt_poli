
-- Crear tabla Municipio
CREATE TABLE Municipio (
    municipio_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Crear tabla Acudiente
CREATE TABLE Acudiente (
    acudiente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    edad INT,
    correo VARCHAR(100),
    ocupacion VARCHAR(100),
    direccion VARCHAR(100),
    municipio_id INT,
    vive_con_el_joven TINYINT(1),
    FOREIGN KEY (municipio_id) REFERENCES Municipio(municipio_id)
);

-- Crear tabla Estudiante
CREATE TABLE Estudiante (
    estudiante_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    fecha_nacimiento DATETIME,
    acudiente_id INT,
    direccion VARCHAR(100),
    telefono VARCHAR(20),
    grado VARCHAR(50),
    jornada VARCHAR(50),
    municipio_id INT,
    FOREIGN KEY (acudiente_id) REFERENCES Acudiente(acudiente_id),
    FOREIGN KEY (municipio_id) REFERENCES Municipio(municipio_id)
);

-- Crear tabla Solicitud (sin Postulante)
CREATE TABLE Solicitud (
    solicitud_id INT AUTO_INCREMENT PRIMARY KEY,
    renueva TINYINT(1),
    fecha_solicitud DATETIME,
    grado_que_solicita VARCHAR(50),
    estudiante_id INT,
    FOREIGN KEY (estudiante_id) REFERENCES Estudiante(estudiante_id)
);

-- Crear tabla Institucion
CREATE TABLE Institucion (
    institucion_id INT AUTO_INCREMENT PRIMARY KEY,
    direccion VARCHAR(100),
    telefono VARCHAR(20),
    correo VARCHAR(100),
    cupos_disponibles INT,
    tipo_institucion VARCHAR(50),
    municipio_id INT,
    solicitud_id INT,
    FOREIGN KEY (municipio_id) REFERENCES Municipio(municipio_id),
    FOREIGN KEY (solicitud_id) REFERENCES Solicitud(solicitud_id)
);

-- Crear tabla Grado
CREATE TABLE Grado (
    grado_id INT AUTO_INCREMENT PRIMARY KEY,
    cupos_disponibles INT,
    director_de_grado VARCHAR(100),
    jornada VARCHAR(50),
    salon VARCHAR(50),
    institucion_id INT,
    FOREIGN KEY (institucion_id) REFERENCES Institucion(institucion_id)
);

-- Crear tabla Docente
CREATE TABLE Docente (
    docente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    especialidad VARCHAR(100)
);

-- Crear tabla Asignatura
CREATE TABLE Asignatura (
    asignatura_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    intensidad_horaria INT
);

-- Relación muchos a muchos entre Grado y Docente
CREATE TABLE Grado_Docente (
    grado_id INT,
    docente_id INT,
    PRIMARY KEY (grado_id, docente_id),
    FOREIGN KEY (grado_id) REFERENCES Grado(grado_id),
    FOREIGN KEY (docente_id) REFERENCES Docente(docente_id)
);

-- Relación muchos a muchos entre Grado y Asignatura
CREATE TABLE Grado_Asignatura (
    grado_id INT,
    asignatura_id INT,
    PRIMARY KEY (grado_id, asignatura_id),
    FOREIGN KEY (grado_id) REFERENCES Grado(grado_id),
    FOREIGN KEY (asignatura_id) REFERENCES Asignatura(asignatura_id)
);
