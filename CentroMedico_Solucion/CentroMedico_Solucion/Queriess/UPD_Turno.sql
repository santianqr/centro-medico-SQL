

/*
SELECT * FROM Turno
SELECT * FROM TurnoPaciente
*/

--EXEC UPD_Turno 6,2,'El paciente llamó para cancelar el turno'

ALTER PROC UPD_Turno (
			@idTurno turno,
			@estado TINYINT,
			@observacion observacion
			)

AS
SET NOCOUNT ON

IF EXISTS (SELECT * FROM Turno WHERE idTurno = @idTurno)
BEGIN
	UPDATE Turno SET estado = @estado,
					 observacion = @observacion
	WHERE idTurno = @idTurno
END
ELSE
BEGIN
	SELECT 0 AS resultado
END	