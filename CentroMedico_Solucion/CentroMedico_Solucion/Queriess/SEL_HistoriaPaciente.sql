
EXEC SEL_HistoriaPaciente 2

ALTER PROC SEL_HistoriaPaciente (
			@idPaciente paciente
			)
AS
SET NOCOUNT ON

/*
SELECT * FROM Historia
SELECT * FROM HistoriaPaciente
SELECT * FROM Paciente
SELECT * FROM MedicoEspecialidad
*/

IF EXISTS(
		SELECT * FROM Paciente P
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
	INNER JOIN HistoriaPaciente HP
	ON HP.idPaciente = P.idPaciente
	INNER JOIN Historia H
	ON H.idHistoria = HP.idHistoria
	INNER JOIN MedicoEspecialidad ME
	ON ME.idMedico = HP.idMedico
	INNER JOIN Medico M
	ON M.idMedico = ME.idMedico
	WHERE P.idPaciente = @idPaciente
ELSE
	--PRINT 'No existen historias clinicas para el paciente'
	SELECT 0 AS resultado