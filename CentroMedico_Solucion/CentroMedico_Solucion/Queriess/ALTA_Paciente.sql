/*
SELECT * FROM Paciente
EXEC ALTA_Paciente '1234', 'Eisen', 'Hower', '20180515', 'calle 1', 'MEX', '', 'eisen@gmail.com', ''
*/
ALTER PROC ALTA_Paciente(
			@dni VARCHAR(20),
			@nombre VARCHAR(50),
			@apellido VARCHAR(50),
			@fNacimiento VARCHAR(8),
			@domicilio VARCHAR(50),
			@idPais CHAR(3),
			@tel VARCHAR(20) = '',
			@email VARCHAR(3),
			@observacion observacion = ''
			)

AS

IF NOT EXISTS(SELECT * FROM Paciente WHERE dni = @dni)
BEGIN
	INSERT INTO Paciente (dni, nombre, apellido, fNacimiento, domicilio, idPais,telefono,email,observacion)
	VALUES (@dni, @nombre, @apellido, @fNacimiento, @domicilio, @idPais, @tel, @email, @observacion)
	PRINT 'El paciente se agregó correctamente'
	RETURN
END
ELSE
BEGIN
	PRINT 'El paciente ya existe'
	RETURN
END