SELECT * FROM Paciente
SELECT * FROM TurnoPaciente

/*
SELECT * FROM Paciente P
INNER JOIN TurnoPaciente T
ON T.idPaciente = P.idPaciente
*/
/*
SELECT * FROM Paciente P
LEFT JOIN TurnoPaciente T
ON T.idPaciente = P.idPaciente
*/
SELECT * FROM Paciente P
RIGHT JOIN TurnoPaciente T
ON T.idPaciente = P.idPaciente
