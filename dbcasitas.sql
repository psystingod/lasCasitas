-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-04-2017 a las 17:58:56
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbcasitas`
--

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
  `Pass` varchar(45) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  `idEncargado` int(11) NOT NULL,
  `idGrado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`idAlumno`, `NombreAlumno`, `ApellidoAlumno`, `EdadAlumno`, `GeneroAlumno`, `Carnet`, `Pass`, `Estado`, `idEncargado`, `idGrado`) VALUES
(2, 'Juan Goku', 'Rodriguez Perez', '2001-04-14', 'M', 'rp12010', '123456', 'activo', 1, 9);

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
  `Teledono` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `encargado`
--

INSERT INTO `encargado` (`idEncargado`, `NombreEncargado`, `ApellidoEncargado`, `EdadEncargado`, `GeneroEncargado`, `DUIEncargado`, `Parentesco`, `Teledono`) VALUES
(1, 'Pedro Antonio', 'Rodriguez Perez', '1990-04-14', 'M', '12345434-0', 'Padre', '77123455');

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
  `Pass` varchar(45) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`idProfesor`, `NombreProfesor`, `ApellidoProfesor`, `EdadProfesor`, `GeneroProfesor`, `DUIProfesor`, `Especialidad`, `User`, `Pass`, `Estado`) VALUES
(1, 'Wilber David', 'Méndez Rodriguez', '1994-06-30', 'M', '05017330-8', 'Informatica', 'tmsh', '10203040', 'activo'),
(2, 'Rebeca Abigail', 'Diaz Orellana', '1994-09-27', 'F', '03928712-2', 'Analisis Numerico', 'rbk', '123456', 'activo');

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
  MODIFY `idAlumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `encargado`
--
ALTER TABLE `encargado`
  MODIFY `idEncargado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
  MODIFY `idProfesor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
