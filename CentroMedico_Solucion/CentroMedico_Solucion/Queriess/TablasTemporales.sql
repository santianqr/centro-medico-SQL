
--TABLA TEMPORAL EN MEMORIA
DECLARE @mitabla TABLE (id INT IDENTITY (1,1), pais VARCHAR(50))

INSERT INTO @mitabla VALUES('MEXICO')
INSERT INTO @mitabla VALUES('PERU')
INSERT INTO @mitabla VALUES('ARGENTINA')
INSERT INTO @mitabla VALUES('ECUADOR')
INSERT INTO @mitabla VALUES('COLOMBIA')

SELECT * FROM @mitabla

--TABLA TEMPORAL FISICA

CREATE TABLE #mitabla (id INT IDENTITY (1,1), nombre VARCHAR(50), apellido VARCHAR(50))

INSERT INTO #mitabla VALUES('Alejandro', 'Lopez')
INSERT INTO #mitabla VALUES('Rafael', 'Castillo')
INSERT INTO #mitabla VALUES('Fernando', 'Gonzalez')

SELECT * FROM #mitabla
DROP TABLE #mitabla

--SCRIPT
SELECT * FROM Paciente
SELECT * FROM Turno
SELECT * FROM TurnoPaciente

DECLARE @turnos TABLE (id INT IDENTITY (1,1), idTurno turno, idPaciente paciente)
DECLARE @idPaciente paciente
SET @idPaciente = 8

INSERT INTO @turnos (idTurno, idPaciente)
SELECT TP.idTurno, TP.idPaciente FROM Paciente P 
INNER JOIN TurnoPaciente TP
ON TP.idPaciente = P.idPaciente

DECLARE @i INT, @total INT 
SET @i = 1
SET @total = (SELECT COUNT(*) FROM @turnos)

WHILE @i <= @total
BEGIN
	IF (SELECT idPaciente FROM @turnos WHERE id = @i) <> 8
		DELETE FROM @turnos WHERE id = @i
	
	SET @i = @i + 1
END
SELECT * FROM Paciente P
INNER JOIN @turnos T
ON T.idPaciente = P.idPaciente
