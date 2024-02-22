
EXEC SEL_EspecialidadesMedica

CREATE PROC SEL_EspecialidadesMedica

AS 
SET NOCOUNT ON

IF EXISTS (SELECT * FROM Especialidad)
	SELECT * FROM Especialidad
ELSE
	SELECT 0 AS resultado