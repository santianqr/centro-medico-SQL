
/*
SELECT * FROM Turno
SELECT * FROM TurnoPaciente
*/

--EXEC DEL_Turno 6

CREATE PROC DEL_Turno (
			@idTurno turno)

AS
SET NOCOUNT ON

IF EXISTS (SELECT * FROM Turno 
			WHERE idTurno = @idTurno)
BEGIN
	DELETE FROM Turno WHERE idTurno = @idTurno
	DELETE FROM TurnoPaciente WHERE idTurno = @idTurno
END
ELSE
	SELECT 0 AS resultado
