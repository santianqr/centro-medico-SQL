select * from PacienteLog


CREATE TRIGGER PacientesCreado ON Paciente
AFTER INSERT 
AS

IF (SELECT idPais FROM inserted) = 'MEX'
	INSERT INTO PacienteLog (idPaciente, idPais, fechaAlta)
		SELECT i.idPaciente, i.idPais, GETDATE() FROM Inserted i