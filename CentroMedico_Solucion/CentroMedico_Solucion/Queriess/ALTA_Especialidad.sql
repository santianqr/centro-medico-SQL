

--select * FROM Especialidad 

EXEC ALTA_Especialidad 'ORTOPEDIA'


ALTER PROC ALTA_Especialidad(
			@especialidad VARCHAR(30)
			)

AS

IF NOT EXISTS(SELECT TOP(1)* FROM Especialidad WHERE especialidad = @especialidad)
BEGIN
	INSERT INTO Especialidad(especialidad)
	VALUES (@especialidad)
	PRINT 'La especialidad se agregó correctamente'
	RETURN
END
ELSE
BEGIN
	PRINT 'La especialidad ya existe'
	RETURN
END