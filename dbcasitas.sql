-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-05-2017 a las 07:27:32
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbcasitas`
CREATE DATABASE dbcasitas;
USE dbcasitas;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `idAlumno` int(11) NOT NULL,
  `NombreAlumno` varchar(45) DEFAULT NULL,
  `ApellidoAlumno` varchar(45) DEFAULT NULL,
  `EdadAlumno` date DEFAULT NULL,
  `GeneroAlumno` varchar(45) DEFAULT NULL,
  `Carnet` varchar(45) DEFAULT NULL,
  `Pass` varchar(300) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  `idEncargado` int(11) NOT NULL,
  `idGrado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`idAlumno`, `NombreAlumno`, `ApellidoAlumno`, `EdadAlumno`, `GeneroAlumno`, `Carnet`, `Pass`, `Estado`, `idEncargado`, `idGrado`) VALUES
(19, 'Goku Fernando', 'Rodríguez Pérez', '2003-04-11', 'Maculino', 'rp13010', 'e05e4eb4fb3579928ae70cdaaae95eb46f1d2831ae3308a89b44ac421adc1c1b3c98fa5e8e02ac408d32b662a065f446f835e4cb326da65de5b07c3f9a88018d', 'activo', 1, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encargado`
--

CREATE TABLE `encargado` (
  `idEncargado` int(11) NOT NULL,
  `NombreEncargado` varchar(45) DEFAULT NULL,
  `ApellidoEncargado` varchar(45) DEFAULT NULL,
  `EdadEncargado` date DEFAULT NULL,
  `GeneroEncargado` varchar(45) DEFAULT NULL,
  `DUIEncargado` varchar(45) DEFAULT NULL,
  `Parentesco` varchar(45) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `encargado`
--

INSERT INTO `encargado` (`idEncargado`, `NombreEncargado`, `ApellidoEncargado`, `EdadEncargado`, `GeneroEncargado`, `DUIEncargado`, `Parentesco`, `Telefono`) VALUES
(1, 'Pedro Antonio', 'Rodriguez Perez', '1990-04-14', 'M', '12345434-0', 'Padre', '77123455'),
(5, 'Maria Antonia', 'Ramirez', '1990-05-08', 'Femenino', '99182813773-9', 'Madre', '7777-7777');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE `grado` (
  `idGrado` int(11) NOT NULL,
  `Nombre_grado` varchar(45) DEFAULT NULL,
  `Anio` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grado`
--

INSERT INTO `grado` (`idGrado`, `Nombre_grado`, `Anio`) VALUES
(1, '1º', '2017'),
(2, '2º', '2017'),
(3, '3º', '2017'),
(4, '4º', '2017'),
(5, '5º', '2017'),
(6, '6º', '2017'),
(7, '7º', '2017'),
(8, '8º', '2017'),
(9, '9º', '2017');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `idMateria` int(11) NOT NULL,
  `Nombre_Materia` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_por_grado`
--

CREATE TABLE `materia_por_grado` (
  `idMateria_Por_Grado` int(11) NOT NULL,
  `idMateria` int(11) NOT NULL,
  `idGrado` int(11) NOT NULL,
  `idProfesor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `idNotas` int(11) NOT NULL,
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
  `Notascol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `idProfesor` int(11) NOT NULL,
  `NombreProfesor` varchar(45) DEFAULT NULL,
  `ApellidoProfesor` varchar(45) DEFAULT NULL,
  `EdadProfesor` date DEFAULT NULL,
  `GeneroProfesor` varchar(45) DEFAULT NULL,
  `DUIProfesor` varchar(45) DEFAULT NULL,
  `Especialidad` varchar(45) DEFAULT NULL,
  `User` varchar(45) DEFAULT NULL,
  `Pass` varchar(300) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`idProfesor`, `NombreProfesor`, `ApellidoProfesor`, `EdadProfesor`, `GeneroProfesor`, `DUIProfesor`, `Especialidad`, `User`, `Pass`, `Estado`) VALUES
(4, 'Wilber David', 'Méndez Rodríguez', '1994-06-30', 'Maculino', '05017330-8', 'Informática', 'tmsh', 'e6ecb29c15b63f878db83ee7936163e4868815723bcec94f457150b435e52ac1e9a281c84a5346ee768dffb5a7943e9ad028f98850abb66addca4bda0669485e', 'activo'),
(5, 'Jonathan', 'Centeno', '1994-05-06', 'Maculino', '123456789-9', 'Educacion Física', 'jota', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 'activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`idAlumno`,`idEncargado`,`idGrado`),
  ADD UNIQUE KEY `idAlumno_UNIQUE` (`idAlumno`),
  ADD KEY `fk_Alumno_Encargado1_idx` (`idEncargado`),
  ADD KEY `fk_Alumno_Grado1_idx` (`idGrado`);

--
-- Indices de la tabla `encargado`
--
ALTER TABLE `encargado`
  ADD PRIMARY KEY (`idEncargado`),
  ADD UNIQUE KEY `idEncargado_UNIQUE` (`idEncargado`);

--
-- Indices de la tabla `grado`
--
ALTER TABLE `grado`
  ADD PRIMARY KEY (`idGrado`),
  ADD UNIQUE KEY `idGrado_UNIQUE` (`idGrado`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`idMateria`),
  ADD UNIQUE KEY `idMateria_UNIQUE` (`idMateria`);

--
-- Indices de la tabla `materia_por_grado`
--
ALTER TABLE `materia_por_grado`
  ADD PRIMARY KEY (`idMateria_Por_Grado`,`idMateria`,`idGrado`,`idProfesor`),
  ADD UNIQUE KEY `idMateria_Por_Gradol_UNIQUE` (`idMateria_Por_Grado`),
  ADD KEY `fk_Materia_has_Grado_Grado1_idx` (`idGrado`),
  ADD KEY `fk_Materia_has_Grado_Materia1_idx` (`idMateria`),
  ADD KEY `fk_Materia_Por_Grado_Profesor1_idx` (`idProfesor`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`idNotas`,`idMateria_Por_Grado`,`idAlumno`),
  ADD UNIQUE KEY `idNotas_UNIQUE` (`idNotas`),
  ADD KEY `fk_Notas_Materia_Por_Grado1_idx` (`idMateria_Por_Grado`),
  ADD KEY `fk_Notas_Alumno1_idx` (`idAlumno`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`idProfesor`),
  ADD UNIQUE KEY `idProfesor_UNIQUE` (`idProfesor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `idAlumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `encargado`
--
ALTER TABLE `encargado`
  MODIFY `idEncargado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `grado`
--
ALTER TABLE `grado`
  MODIFY `idGrado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `idMateria` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `materia_por_grado`
--
ALTER TABLE `materia_por_grado`
  MODIFY `idMateria_Por_Grado` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `idNotas` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `profesor`
--
ALTER TABLE `profesor`
  MODIFY `idProfesor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `fk_Alumno_Encargado1` FOREIGN KEY (`idEncargado`) REFERENCES `encargado` (`idEncargado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Alumno_Grado1` FOREIGN KEY (`idGrado`) REFERENCES `grado` (`idGrado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `materia_por_grado`
--
ALTER TABLE `materia_por_grado`
  ADD CONSTRAINT `fk_Materia_Por_Grado_Profesor1` FOREIGN KEY (`idProfesor`) REFERENCES `profesor` (`idProfesor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Materia_has_Grado_Grado1` FOREIGN KEY (`idGrado`) REFERENCES `grado` (`idGrado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Materia_has_Grado_Materia1` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `fk_Notas_Alumno1` FOREIGN KEY (`idAlumno`) REFERENCES `alumno` (`idAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Notas_Materia_Por_Grado1` FOREIGN KEY (`idMateria_Por_Grado`) REFERENCES `materia_por_grado` (`idMateria_Por_Grado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
