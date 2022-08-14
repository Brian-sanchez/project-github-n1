CREATE DATABASE peluqueria_canina_veterimaria;
USE peluqueria_canina_veterinaria;

-- TABLAS

CREATE TABLE Dueno(
	DNI INT,
    Nombre VARCHAR(25),
    Apellido VARCHAR(25),
    Telefono INT,
    Direccion VARCHAR(50),
    PRIMARY KEY (DNI)
);

-- Actividad 1 - Realice la consulta correspondiente para crear la tabla Perro, teniendo en cuenta sus claves foráneas y primarias.

CREATE TABLE Perro(
	ID_Perro INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(25),
    Fecha_nac DATE,
    Sexo VARCHAR(25),
    DNI_Dueno INT,
    PRIMARY KEY (ID_Perro),
    FOREIGN KEY (DNI_Dueno) REFERENCES Dueno(DNI)
);

CREATE TABLE Historial(
	ID_Historial INT NOT NULL AUTO_INCREMENT,
    Fecha DATE,
    Perro INT,
    Descripcion VARCHAR(255),
    Monto FLOAT,
    PRIMARY KEY (ID_Historial),
    FOREIGN KEY(Perro) REFERENCES Perro(ID_Perro)
);


-- DATOS

INSERT INTO Dueno (DNI, Nombre, Apellido, Telefono, Direccion)
VALUES
	(28957346, 'Juan', 'Perez', 4789689, 'Belgrano 101'),
    (23546987, 'Maria', 'Perez', 4789689, 'Pueyrredon  811'),
    (35687892, 'José', 'Diaz', 4782647, 'Gongora 305');

INSERT INTO Perro (Nombre, Fecha_nac, Sexo, DNI_Dueno)
VALUES
	('Puppy', '2012-12-12', 'Macho', 28957346),
    ('Fido', '2015-05-23', 'Macho', 23546987),
    ('Luna', '2020-08-02', 'Hembra', 35687892);

INSERT INTO Historial (Fecha, Perro, Descripcion, Monto)
VALUES
	('2021-10-25', 1, 'Examen', 8900),
    ('2022-05-08', 2, 'Corte de Pelo', 2200),
    ('2022-08-05', 3, 'Corte de Pelo', 2200);
    
SELECT * FROM Dueno;
SELECT * FROM Perro;
SELECT * FROM Historial;

-- Actividad 2 - Inserte en la tabla correspondiente un nuevo animal (perro) como paciente y el dueño asociado a ese animal.
INSERT INTO Dueno (DNI, Nombre, Apellido, Telefono, Direccion)
VALUES
	(27727222, 'John', 'Perez', 3547237215, 'Salta 74'),
	
INSERT INTO Perro (Nombre, Fecha_nac, Sexo, DNI_Dueno)
VALUES
	('Python', '2013-10-12', 'Macho', 25937321),
	
	INSERT INTO Historial (Fecha, Perro, Descripcion, Monto)
VALUES
	('2022-02-25', 4, 'Examen', 8900),
	
-- Actividad 4 - Actualice la fecha de nacimiento de algún animal (perro) que usted considere.
UPDATE Perro SET Fecha_nac = 2012/11/12  WHERE dni = 28957346

