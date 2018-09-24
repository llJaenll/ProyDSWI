USE MASTER
GO

DROP DATABASE IF EXISTS proyDSWI
GO

CREATE DATABASE proyDSWI
GO

USE proyDSWI
GO

/*CREACION DE TABLAS*/
--UBIGEO
-- --------------------------------------------------------
/*tbDepartamento*/
DROP TABLE IF EXISTS tbDepartamento
CREATE TABLE tbDepartamento (
 idDep int PRIMARY KEY IDENTITY(1,1),
 desDepartamento nvarchar(50) NOT NULL,
)
GO
--
/*tbProvincia*/
--
DROP TABLE IF EXISTS tbProvincia
CREATE TABLE tbProvincia (
 idProv int PRIMARY KEY,
 desProvincia nvarchar(50) NOT NULL,
 idDep int NOT NULL FOREIGN KEY REFERENCES tbDepartamento(idDep) ,
)
GO
--
/*tbDistrito*/
--
DROP TABLE IF EXISTS tbDistrito
CREATE TABLE tbDistrito (
 idDist int PRIMARY KEY,
 desDistrito nvarchar(50) NOT NULL,
 idProv int NOT NULL FOREIGN KEY REFERENCES tbProvincia(idProv) ,
)
GO
--/////////////////////////////////////////////////////////////////////
--/////////////////////////////////////////////////////////////////////
--/////////////////////////////////////////////////////////////////////
--/////////////////////////////////////////////////////////////////////
/*PADRES*/
DROP TABLE IF EXISTS tbCategoriaPersona
CREATE TABLE tbCategoriaPersona(
	catPersona int PRIMARY KEY IDENTITY(1,1),
	descripPersona varchar(30) NOT NULL UNIQUE
)
GO

DROP TABLE IF EXISTS tbCategoria
CREATE TABLE tbCategoria(
	idCategoria int PRIMARY KEY IDENTITY(1,1),
	descripCategoria varchar(30) NOT NULL UNIQUE
)
GO

DROP TABLE IF EXISTS tbEstadoSubasta
CREATE TABLE tbEstadoSubasta(
	idEstadoSubasta int PRIMARY KEY IDENTITY(1,1),
	descripSubasta varchar(30) NOT NULL UNIQUE
)
GO



/*HIJOS*/
DROP TABLE IF EXISTS tbPersona
CREATE TABLE tbPersona(
	idPersona int PRIMARY KEY IDENTITY(1,1),
	nomPersona varchar(30) NOT NULL,
	apepPersona varchar(30) NOT NULL,
	apemPersona varchar(30) NOT NULL,
	dniPersona char(8) NOT NULL UNIQUE,
	telPersona char(9) NOT NULL UNIQUE,
	dirPersona varchar(60) NOT NULL,
	edadPersona int NOT NULL,
	fecNacPersona date NOT NULL,
	catPersona int  NOT NULL FOREIGN KEY REFERENCES tbCategoriaPersona(catPersona),
	idDep int NOT NULL FOREIGN KEY REFERENCES tbDepartamento(idDep),
	idProv int NOT NULL FOREIGN KEY REFERENCES tbProvincia(idProv),
	idDist int NOT NULL FOREIGN KEY REFERENCES tbDistrito(idDist)
)
GO

DROP TABLE IF EXISTS tbSubasta
CREATE TABLE tbSubasta(
	idSubasta int PRIMARY KEY IDENTITY(1,1),
	idComprador int FOREIGN KEY REFERENCES tbPersona(idPersona),
	idCategoria int NOT NULL FOREIGN KEY REFERENCES tbCategoria(idCategoria),
	idEstadoSubasta int NOT NULL FOREIGN KEY REFERENCES tbEstadoSubasta(idEstadoSubasta),
	preBase money NOT NULL,
	descripSubasta varchar(50) NOT NULL,
	fecIni date NOT NULL,
	horIni time NOT NULL,
	fecFin date NOT NULL,
	horFin time NOT NULL
)
GO

DROP TABLE IF EXISTS tbMovimiento
CREATE TABLE tbMovimiento(
	idMovimiento int PRIMARY KEY IDENTITY(1,1),
	idVendedor int NOT NULL FOREIGN KEY REFERENCES tbPersona(idPersona),
	idSubasta int NOT NULL FOREIGN KEY REFERENCES tbSubasta(idSubasta),
	preVenta money NOT NULL,
	preEnvio money NOT NULL,
	totalMovimiento money NOT NULL
)
GO

DROP TABLE IF EXISTS tbReclamo
CREATE TABLE tbReclamo(
	idReclamo int PRIMARY KEY IDENTITY(1,1),
	idComprador int FOREIGN KEY REFERENCES tbPersona(idPersona),
	idVendedor int FOREIGN KEY REFERENCES tbPersona(idPersona)
)
GO

DROP TABLE IF EXISTS tbDetalleReclamo
CREATE TABLE tbDetalleReclamo(
	idDetalleReclamo int PRIMARY KEY IDENTITY(1,1),
	idReclamo int FOREIGN KEY REFERENCES tbReclamo(idReclamo),
	descripReclamo varchar(500),
	imagenReclamo image
)
GO

DROP TABLE IF EXISTS tbComentario
CREATE TABLE tbComentario(
	idComentario int PRIMARY KEY IDENTITY(1,1),
	idComprador int FOREIGN KEY REFERENCES tbPersona(idPersona),
	idVendedor int FOREIGN KEY REFERENCES tbPersona(idPersona)
)
GO

DROP TABLE IF EXISTS tbDetalleComentario
CREATE TABLE tbDetalleComentario(
	idDetalleComentario int PRIMARY KEY IDENTITY(1,1),
	idComentario int FOREIGN KEY REFERENCES tbComentario(idComentario),
	pregunta varchar(500),
	respuesta varchar(500)
)
GO



