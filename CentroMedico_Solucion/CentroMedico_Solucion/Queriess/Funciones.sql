

-- FUNCIONES ESCALARES
--SELECT dbo.nombrefun (256)
--SELECT dbo.concatenar('Lopez', 'Roberto')
SELECT dbo.obtenerPais(8)

SELECT * FROM Paciente

ALTER FUNCTION nombrefun (@var INT)
RETURNS INT

AS

BEGIN
	SET @var = @var * 5
	RETURN @var
END

CREATE FUNCTION concatenar (@apellido VARCHAR(50),
							@nombre VARCHAR(50)
							)
RETURNS VARCHAR(100)

AS
BEGIN
	DECLARE @resultado VARCHAR(100)
	SET @resultado = @apellido + ', ' + @nombre
	RETURN @resultado
END

CREATE FUNCTION obtenerPais(
							@idPaciente paciente)
RETURNS VARCHAR(50)

AS
BEGIN
	DECLARE @pais VARCHAR(50)
	SET @pais = (SELECT PA.pais FROM Paciente P
					INNER JOIN Pais PA
					ON PA.idPais = P.idPais
					WHERE idPaciente = @idPaciente)
	RETURN @pais
END

-- FUNCIONES TIPO TABLA

SELECT * FROM listaPaises()

CREATE FUNCTION listaPaises ()
RETURNS @paises TABLE(idpais CHAR(3), pais VARCHAR(50))
AS
BEGIN
	INSERT INTO @paises VALUES('ESP', 'España')
	INSERT INTO @paises VALUES('MEX', 'Mexico')
	INSERT INTO @paises VALUES('CHI', 'Chile')
	INSERT INTO @paises VALUES('PER', 'Peru')
	INSERT INTO @paises VALUES('ARG', 'Argentina')

	RETURN 
END