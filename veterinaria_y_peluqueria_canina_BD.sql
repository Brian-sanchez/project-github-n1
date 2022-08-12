CREATE DATABASE veterinaria_y_peluqueria_canina;

use veterinaria_y_peluqueria_canina;

-- TABLAS

CREATE TABLE Dueno (
    DNI int,
    Nombre varchar(25),
    Apellido varchar(25),
    Telefono int,
    Direccion varchar(50),
    PRIMARY KEY (DNI)
);

CREATE TABLE Perro (
    ID_Perro int NOT NULL AUTO_INCREMENT,
    Nombre varchar(25),
    Fecha_nac date,
    Sexo varchar(25),
    DNI_Dueno int,
    PRIMARY KEY (ID_Perro),
    FOREIGN KEY (DNI_Dueno) REFERENCES Dueno (DNI)
);

CREATE TABLE Historial (
    ID_Historial int NOT NULL AUTO_INCREMENT,
    Fecha date,
    Perro int,
    Descripcion varchar(255),
    Monto int,
    PRIMARY KEY (ID_Historial),
    FOREIGN KEY (Perro) REFERENCES Perro (ID_Perro)
);

-- DATOS

INSERT INTO Dueno (DNI, Nombre, Apellido, Telefono, Direccion)
        VALUES (28957346, 'Juan', 'Perez', 4789689, 'Belgrano 101'), (23546987, 'Maria', 'Perez', 4789689, 'Pueyrredon  811'), (35687892, 'José', 'Diaz', 4782647, 'Gongora 305');
INSERT INTO Perro (Nombre, Fecha_nac, Sexo, DNI_Dueno)
        VALUES ('Puppy', '2012-12-12', 'Macho', 28957346), ('Fido', '2015-05-23', 'Macho', 23546987), ('Luna', '2020-08-02', 'Hembra', 35687892);
INSERT INTO Historial (Fecha, Perro, Descripcion, Monto)
        VALUES ('2021-10-25', 4, 'Examen', 8900), ('2022-05-08', 5, 'Corte de Pelo', 2200), ('2022-08-05', 6, 'Corte de Pelo', 1800);
SELECT
    *
FROM
    Dueno;

SELECT
    *
FROM
    Perro;

SELECT
    *
FROM
    Historial;

-- Actividad 9

UPDATE
    Dueno
SET
    Direccion = 'Libertad 123'
WHERE
    dni = 28957346;

-- ACTIVIDAD 12

SELECT
    *
FROM
    Perro
WHERE
    sexo = 'Macho'
    AND Fecha_nac > '2020/01/01';

-- Actividad 11

SELECT
    p.DNI_Dueno,
    p.ID_Perro,
    h.Fecha
FROM
    Perro p
    LEFT JOIN Historial h ON p.ID_Perro = h.Perro
WHERE
    p.Fecha_nac > '2017-01-01'
    AND h.Fecha < '2022-01-01';
