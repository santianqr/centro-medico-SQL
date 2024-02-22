

--EXEC SELECT_TurnosPaciente 8

ALTER PROC SELECT_TurnosPaciente (
			@idPaciente paciente
			)

AS
SET NOCOUNT ON
/*
SELECT * FROM Turno
select * from TurnoPaciente
select * from Paciente
SELECT * FROM MedicoEspecialidad
INSERT INTO MedicoEspecialidad VALUES(1,2,'Medico Clinico')
*/
IF EXISTS (SELECT * FROM Paciente P
			INNER JOIN HistoriaPaciente HP
			ON HP.idPaciente = P.idPaciente
			INNER JOIN Historia H
			ON H.idHistoria = HP.idHistoria
			INNER JOIN MedicoEspecialidad ME
			ON ME.idMedico = HP.idMedico
			INNER JOIN Medico M
			ON M.idMedico = ME.idMedico
			WHERE P.idPaciente = @idPaciente
			)
	SELECT * FROM Paciente P
	INNER JOIN TurnoPaciente TP
	ON TP.idPaciente = P.idPaciente
	INNER JOIN Turno T
	ON T.idTurno = TP.idTurno
	INNER JOIN MedicoEspecialidad M
	ON M.idMedico = TP.idMedico
	WHERE P.idPaciente = @idPaciente
ELSE SELECT 0 AS resultado