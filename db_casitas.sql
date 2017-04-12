-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.19-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para dbcasitas
CREATE DATABASE IF NOT EXISTS `dbcasitas` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dbcasitas`;

-- Volcando estructura para tabla dbcasitas.alumno
CREATE TABLE IF NOT EXISTS `alumno` (
  `idAlumno` int(11) NOT NULL AUTO_INCREMENT,
  `Grado` varchar(45) DEFAULT NULL,
  `Usuario` varchar(45) DEFAULT NULL,
  `User` varchar(45) DEFAULT NULL,
  `Pass` varchar(45) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  `idPersona` int(11) NOT NULL,
  `idEncargado` int(11) NOT NULL,
  `idGrado` int(11) NOT NULL,
  PRIMARY KEY (`idAlumno`,`idPersona`,`idEncargado`,`idGrado`),
  UNIQUE KEY `idAlumno_UNIQUE` (`idAlumno`),
  KEY `fk_Alumno_Persona1_idx` (`idPersona`),
  KEY `fk_Alumno_Encargado1_idx` (`idEncargado`),
  KEY `fk_Alumno_Grado1_idx` (`idGrado`),
  CONSTRAINT `fk_Alumno_Encargado1` FOREIGN KEY (`idEncargado`) REFERENCES `encargado` (`idEncargado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumno_Grado1` FOREIGN KEY (`idGrado`) REFERENCES `grado` (`idGrado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumno_Persona1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dbcasitas.alumno: ~0 rows (aproximadamente)
DELETE FROM `alumno`;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;

-- Volcando estructura para tabla dbcasitas.encargado
CREATE TABLE IF NOT EXISTS `encargado` (
  `idEncargado` int(11) NOT NULL AUTO_INCREMENT,
  `Parentesco` varchar(45) DEFAULT NULL,
  `Teledono` varchar(45) DEFAULT NULL,
  `idPersona` int(11) NOT NULL,
  PRIMARY KEY (`idEncargado`,`idPersona`),
  UNIQUE KEY `idEncargado_UNIQUE` (`idEncargado`),
  KEY `fk_Encargado_Persona1_idx` (`idPersona`),
  CONSTRAINT `fk_Encargado_Persona1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dbcasitas.encargado: ~0 rows (aproximadamente)
DELETE FROM `encargado`;
/*!40000 ALTER TABLE `encargado` DISABLE KEYS */;
/*!40000 ALTER TABLE `encargado` ENABLE KEYS */;

-- Volcando estructura para tabla dbcasitas.grado
CREATE TABLE IF NOT EXISTS `grado` (
  `idGrado` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_grado` varchar(45) DEFAULT NULL,
  `Anio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idGrado`),
  UNIQUE KEY `idGrado_UNIQUE` (`idGrado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dbcasitas.grado: ~0 rows (aproximadamente)
DELETE FROM `grado`;
/*!40000 ALTER TABLE `grado` DISABLE KEYS */;
/*!40000 ALTER TABLE `grado` ENABLE KEYS */;

-- Volcando estructura para tabla dbcasitas.materia
CREATE TABLE IF NOT EXISTS `materia` (
  `idMateria` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Materia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMateria`),
  UNIQUE KEY `idMateria_UNIQUE` (`idMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dbcasitas.materia: ~0 rows (aproximadamente)
DELETE FROM `materia`;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;

-- Volcando estructura para tabla dbcasitas.materia_por_grado
CREATE TABLE IF NOT EXISTS `materia_por_grado` (
  `idMateria_Por_Grado` int(11) NOT NULL AUTO_INCREMENT,
  `idMateria` int(11) NOT NULL,
  `idGrado` int(11) NOT NULL,
  `idProfesor` int(11) NOT NULL,
  PRIMARY KEY (`idMateria_Por_Grado`,`idMateria`,`idGrado`,`idProfesor`),
  UNIQUE KEY `idMateria_Por_Gradol_UNIQUE` (`idMateria_Por_Grado`),
  KEY `fk_Materia_has_Grado_Grado1_idx` (`idGrado`),
  KEY `fk_Materia_has_Grado_Materia1_idx` (`idMateria`),
  KEY `fk_Materia_Por_Grado_Profesor1_idx` (`idProfesor`),
  CONSTRAINT `fk_Materia_Por_Grado_Profesor1` FOREIGN KEY (`idProfesor`) REFERENCES `profesor` (`idProfesor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Materia_has_Grado_Grado1` FOREIGN KEY (`idGrado`) REFERENCES `grado` (`idGrado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Materia_has_Grado_Materia1` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dbcasitas.materia_por_grado: ~0 rows (aproximadamente)
DELETE FROM `materia_por_grado`;
/*!40000 ALTER TABLE `materia_por_grado` DISABLE KEYS */;
/*!40000 ALTER TABLE `materia_por_grado` ENABLE KEYS */;

-- Volcando estructura para tabla dbcasitas.notas
CREATE TABLE IF NOT EXISTS `notas` (
  `idNotas` int(11) NOT NULL AUTO_INCREMENT,
  `idMateria_Por_Grado` int(11) NOT NULL,
  `idAlumno` int(11) NOT NULL,
  `N1` double DEFAULT NULL,
  `N2` double DEFAULT NULL,
  `N3` double DEFAULT NULL,
  `N4` double DEFAULT NULL,
  `N5` double DEFAULT NULL,
  `P1` double DEFAULT NULL,
  `N6` double DEFAULT NULL,
  `N7` double DEFAULT NULL,
  `N8` double DEFAULT NULL,
  `N9` double DEFAULT NULL,
  `N10` double DEFAULT NULL,
  `P2` double DEFAULT NULL,
  `N11` double DEFAULT NULL,
  `N12` double DEFAULT NULL,
  `N13` double DEFAULT NULL,
  `N14` double DEFAULT NULL,
  `N15` double DEFAULT NULL,
  `P3` double DEFAULT NULL,
  `N16` double DEFAULT NULL,
  `N17` double DEFAULT NULL,
  `N18` double DEFAULT NULL,
  `N19` double DEFAULT NULL,
  `N20` double DEFAULT NULL,
  `P4` double DEFAULT NULL,
  `NF` double DEFAULT NULL,
  `Notascol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idNotas`,`idMateria_Por_Grado`,`idAlumno`),
  UNIQUE KEY `idNotas_UNIQUE` (`idNotas`),
  KEY `fk_Notas_Materia_Por_Grado1_idx` (`idMateria_Por_Grado`),
  KEY `fk_Notas_Alumno1_idx` (`idAlumno`),
  CONSTRAINT `fk_Notas_Alumno1` FOREIGN KEY (`idAlumno`) REFERENCES `alumno` (`idAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Notas_Materia_Por_Grado1` FOREIGN KEY (`idMateria_Por_Grado`) REFERENCES `materia_por_grado` (`idMateria_Por_Grado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dbcasitas.notas: ~0 rows (aproximadamente)
DELETE FROM `notas`;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;

-- Volcando estructura para tabla dbcasitas.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `idPersona` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `Genero` varchar(45) DEFAULT NULL,
  `Edad` date DEFAULT NULL,
  `Documento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPersona`),
  UNIQUE KEY `idPersona_UNIQUE` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dbcasitas.persona: ~2 rows (aproximadamente)
DELETE FROM `persona`;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` (`idPersona`, `Nombre`, `Apellido`, `Genero`, `Edad`, `Documento`) VALUES
	(1, 'Wilber', 'Mendez', 'M', '1994-06-30', '05017330-8'),
	(2, 'Rebeca', 'Diaz', 'f', '1994-09-27', '01024789-1');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;

-- Volcando estructura para tabla dbcasitas.profesor
CREATE TABLE IF NOT EXISTS `profesor` (
  `idProfesor` int(11) NOT NULL AUTO_INCREMENT,
  `Especialidad` varchar(45) DEFAULT NULL,
  `User` varchar(45) DEFAULT NULL,
  `Pass` varchar(45) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  `idPersona` int(11) NOT NULL,
  PRIMARY KEY (`idProfesor`,`idPersona`),
  UNIQUE KEY `idProfesor_UNIQUE` (`idProfesor`),
  KEY `fk_Profesor_Persona_idx` (`idPersona`),
  CONSTRAINT `fk_Profesor_Persona` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dbcasitas.profesor: ~2 rows (aproximadamente)
DELETE FROM `profesor`;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` (`idProfesor`, `Especialidad`, `User`, `Pass`, `Estado`, `idPersona`) VALUES
	(2, 'Informatica', 'tmsh', '10203040', '1', 1),
	(3, 'Analisis Numericos', 'rbk', '123456', '1', 2);
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
