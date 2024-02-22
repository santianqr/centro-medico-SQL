
SELECT * FROM PacientesTurnosPendientes
select * from VistaPrueba

CREATE VIEW PacientesTurnosPendientes AS

SELECT P.idPaciente, P.nombre, P.apellido, T.idTurno, T.estado 
FROM Paciente P
INNER JOIN TurnoPaciente TP
ON TP.idPaciente = P.idPaciente
INNER JOIN Turno T
ON T.idTurno = TP.idTurno
WHERE ISNULL(T.estado,0) = 0