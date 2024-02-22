
DECLARE @var1 VARCHAR(20)
DECLARE @var2 VARCHAR(20)
SET @var1 = 'Ramiro'
SET @var2 = 'Gonzalez'
/*PRINT LEFT(@var1, 2)
PRINT RIGHT(@var1, 2)*/
PRINT LEFT(@var1,1) + LEFT(@var2,1)
PRINT LEN(@var2)

SELECT * FROM Paciente

ALTER TABLE Paciente ADD estado SMALLINT
ALTER TABLE Paciente ALTER COLUMN estado BIT
ALTER TABLE Paciente DROP COLUMN estado

CREATE TABLE ejemplo (campo0 INT IDENTITY (1,1),campo1 INT, campo2 INT)
SELECT * FROM ejemplo
INSERT INTO ejemplo VALUES(2,3)

TRUNCATE TABLE ejemplo

DROP TABLE ejemplo

CREATE TYPE pais FROM CHAR(3)

sp_help Pais
sp_helptext ALTA_Turno


EXEC S_paciente 3

-- SELECT
SELECT * FROM Paciente WHERE nombre='Claudio' AND apellido = 'Lopez' 
-- INSERT INTO
INSERT INTO Paciente (nombre, apellido, fNacimiento, domicilio,idPais,telefono,email,observacion) 
VALUES ('Claudio','Lopez','2017-02-18','piedra buena 21','ESP', '','','')
--DELETE
DELETE FROM Paciente WHERE nombre='Claudio' AND apellido = 'Lopez'
--UPDATE
UPDATE Paciente SET observacion='Observación modificada' WHERE idPaciente = 4