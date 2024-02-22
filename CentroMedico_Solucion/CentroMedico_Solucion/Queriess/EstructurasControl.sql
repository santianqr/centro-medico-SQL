/*
DECLARE @idPaciente INT
DECLARE @idTurno INT

SET @idPaciente = 5

IF @idPaciente = 7 
BEGIN
	SET @idTurno = 20
	SELECT * FROM Paciente WHERE idPaciente = @idPaciente
	PRINT @idTurno

	IF EXISTS (SELECT * FROM Paciente WHERE idPaciente=4)
		PRINT 'EXISTE'
END
*/

/*
DECLARE @contador INT = 0

WHILE @contador <= 10
BEGIN
	PRINT @contador
	SET @contador = @contador + 1 
END
*/

/*
DECLARE @valor INT
DECLARE @resultado CHAR(10) = ''
SET @valor = 10

SET @resultado = (CASE WHEN @valor = 10 THEN 'ROJO'
						WHEN @valor = 20 THEN 'VERDE'
						WHEN @valor = 30 THEN 'AZUL'
						ELSE 'GRIS'
				END)
PRINT @resultado

SELECT *,(CASE WHEN estado = 1 THEN 'VERDE'
				WHEN estado = 2 THEN 'ROJO'
				WHEN estado=3 THEN 'AZUL'
				ELSE 'GRIS'
		END) AS colorTurno FROM Turno
*/

DECLARE @contador INT = 0

WHILE @contador <= 10
BEGIN
	PRINT @contador
	SET @contador = @contador + 1 
	IF @contador = 3
		BREAK
END
PRINT 'SIGUE EJECUTANDO'


BEGIN TRY
	SET @contador = 'texto'
END TRY

BEGIN CATCH
	PRINT 'NO ES POSIBLE ASIGNAR UN TEXTO A LA VARIABLE @contador'
END CATCH