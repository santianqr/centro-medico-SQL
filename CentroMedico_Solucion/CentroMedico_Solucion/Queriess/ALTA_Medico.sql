/*
SELECT * FROM Medico
SELECT * FROM MedicoEspecialidad
*/

--EXEC ALTA_Medico 'Santiago', 'Quintero', '2', 'Medico cirujano'

ALTER PROC ALTA_Medico(
			@nombre VARCHAR(50),
			@apellido VARCHAR(20),
			@idEspecialidad INT,
			@descripcion VARCHAR(50)
			)

AS
SET NOCOUNT ON

IF NOT EXISTS(SELECT TOP (1) idMedico FROM Medico WHERE nombre = @nombre AND apellido = @apellido)
BEGIN
	INSERT INTO Medico (nombre, apellido)
	VALUES (@nombre, @apellido)	

	DECLARE @auxidMedico INT
	SET @auxidMedico = @@IDENTITY

	INSERT INTO MedicoEspecialidad(idMedico, idEspecialidad, descripcion)
	VALUES (@auxidMedico, @idEspecialidad, @descripcion)

	PRINT 'El médico se agregó correctamente'
	RETURN
END
ELSE
BEGIN
	PRINT 'El médico ya existe'
	RETURN
END