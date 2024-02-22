
CREATE PROC S_paciente (
	@idPaciente INT
)
AS 

SELECT * FROM Paciente WHERE idPaciente = @idPaciente

GO