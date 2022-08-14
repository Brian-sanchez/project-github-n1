CREATE DATABASE Valoracion;
USE Valoracion;

CREATE TABLE dueño
(dni INT NOT NULL,
nombre VARCHAR (15) NOT NULL,
apellido VARCHAR (15) NOT NULL,
telefono BIGINT,
direccion VARCHAR (20),
CONSTRAINT dni PRIMARY KEY (dni)
);

CREATE TABLE perro
(id_perro INT NOT NULL AUTO_INCREMENT ,
nombre VARCHAR (10) NOT NULL,
fecha_nac DATE,
sexo VARCHAR (1),
dni_dueño INT NOT NULL,
CONSTRAINT id_perro PRIMARY KEY (id_perro),
CONSTRAINT dni_dueño FOREIGN KEY (dni_dueño) REFERENCES dueño (dni)
);

INSERT INTO dueño (dni,nombre,apellido,telefono,direccion) VALUES
('1','Alejo','Prado','223268640','42-3640');

INSERT INTO perro (id_perro,nombre,fecha_nac,sexo,dni_dueño) VALUES
('1','Thor','2018/09/29','M','1');

CREATE TABLE historial
(id_historial INT NOT NULL AUTO_INCREMENT,
fecha DATE,
perro INT NOT NULL,
descripcion VARCHAR (50),
monto FLOAT,
CONSTRAINT id_historial PRIMARY KEY (id_historial),
CONSTRAINT perro FOREIGN KEY (perro) REFERENCES perro (id_perro)
);


#EJERCICIO 11

SELECT d.dni, p.id_perro, p.fecha_nac, h.id_historial, h.fecha
FROM dueño AS d 
JOIN perro AS P 
ON d.dni = p.id_perro
JOIN historial AS h
ON h.id_historial = p.id_perro
WHERE (SELECT YEAR(p.fecha_nac)) < '2022' - 5	# Obtener todos los dueños que tengan perros de menos de 5 años de edad 
AND (SELECT YEAR(h.fecha)) != '2022';			# y que no hayan visitado la peluquería en el año 2022