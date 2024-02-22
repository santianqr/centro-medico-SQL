/*
select * from Paciente
select * from Turno
select * from TurnoPaciente
select * from Medico
INSERT INTO Medico VALUES ('Pablo', 'Ramirez')
*/
EXEC ALTA_Turno '20200316 10:30', 14, 1, 'Nada'

ALTER PROC ALTA_Turno(
			@fecha CHAR(14), --20190215 12:00
			@idPaciente paciente,
			@idMedico medico,
			@observacion observacion
			)

AS

/*
ESTADO = 0 (pendiente)
ESTADO = 1 (realizado)
ESTADP = 2 (cancelado)
*/

SET NOCOUNT ON

IF NOT EXISTS(SELECT TOP (1) idTurno FROM Turno WHERE fechaTurno = @fecha)
BEGIN
	INSERT INTO Turno (fechaTurno, estado, observacion)
	VALUES (@fecha, 0, @observacion)

	DECLARE @auxidTurno turno
	SET @auxidTurno = @@IDENTITY

	INSERT INTO TurnoPaciente (idTurno, idPaciente, idMedico)
	VALUES (@auxidTurno, @idPaciente, @idMedico)

	PRINT 'El turno se agregó correctamente'
	RETURN
END
ELSE
BEGIN
	PRINT 'El turno ya existe'
	RETURN
END