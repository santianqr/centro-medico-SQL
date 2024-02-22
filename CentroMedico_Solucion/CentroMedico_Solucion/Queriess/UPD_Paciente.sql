
/*
SELECT * FROM Paciente
*/

EXEC UPD_Paciente 3, 1019142707, 'Nestor', 'Lasso', '1998-06-13', 'las palmas', 'COL', 1234, 'doguitor@gmail.com', 'Paciente creado'

ALTER PROC UPD_Paciente(@idPaciente paciente,
			@dni VARCHAR(20),
			 @nombre VARCHAR(50),
			 @apellido VARCHAR(50),
			 @fNacimiento DATE,
			 @domicilio VARCHAR(50),
			 @idPais CHAR(3),
			 @telefono INT,
			 @email VARCHAR(30),
			 @observacion observacion
			)

AS
SET NOCOUNT ON

IF EXISTS (SELECT * FROM Paciente
			WHERE idPaciente = @idPaciente)
	UPDATE Paciente SET dni = @dni,
						nombre = @nombre,
						apellido = @apellido,
						fNacimiento = @fNacimiento,
						domicilio = @domicilio,
						idPais = @idPais,
						telefono = @telefono,
						email = @email,
						observacion = @observacion
	WHERE idPaciente = @idPaciente
ELSE
	SELECT 0 AS resultado
