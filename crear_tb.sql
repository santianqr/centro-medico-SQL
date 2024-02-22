USE CentroMedico

CREATE TABLE Paciente1(
	idPaciente INT NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NULL,
	fNacimiento DATE NULL,
	domicilio VARCHAR(50) NULL,
	idPais CHAR(3) NULL,
	telefono VARCHAR(20) NULL,
	email VARCHAR(30) NULL,
	observacion VARCHAR(100) NULL,
	fechaAlta DATETIME NOT NULL,
	CONSTRAINT PK_idPaciente PRIMARY KEY (idPaciente)
)