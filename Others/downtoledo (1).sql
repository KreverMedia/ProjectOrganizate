-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-04-2018 a las 13:49:30
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `downtoledo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `idactividad` int(255) NOT NULL,
  `idresponsable` int(255) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  `horario` varchar(1000) DEFAULT NULL,
  `localizacion` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicacion`
--

CREATE TABLE `medicacion` (
  `idmedicacion` int(10) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `cantidad` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicacion_usuario`
--

CREATE TABLE `medicacion_usuario` (
  `idusuario` int(255) NOT NULL,
  `idmedicacion` int(255) NOT NULL,
  `dosis` varchar(255) DEFAULT NULL,
  `desayuno` tinyint(1) DEFAULT NULL,
  `comida` tinyint(1) DEFAULT NULL,
  `cena` tinyint(1) DEFAULT NULL,
  `horas` int(2) DEFAULT NULL,
  `suspendida` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nuevacuenta`
--

CREATE TABLE `nuevacuenta` (
  `codigo` varchar(255) NOT NULL,
  `idrol` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parentesco`
--

CREATE TABLE `parentesco` (
  `idparentesco` int(255) NOT NULL,
  `relacion` varchar(500) NOT NULL,
  `principalcontacto` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parentesco_con`
--

CREATE TABLE `parentesco_con` (
  `idusuarioprincipal` int(255) NOT NULL,
  `idusuariorelacionado` int(255) NOT NULL,
  `idparentesco` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participantes_actividad`
--

CREATE TABLE `participantes_actividad` (
  `idusuario` int(255) NOT NULL,
  `idactividad` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peticiones`
--

CREATE TABLE `peticiones` (
  `idpeticion` int(255) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Apellido1` varchar(500) DEFAULT NULL,
  `Apellido2` varchar(500) DEFAULT NULL,
  `correo` varchar(500) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsabilidad`
--

CREATE TABLE `responsabilidad` (
  `idprofesional` int(255) NOT NULL,
  `idusuario` int(255) NOT NULL,
  `relacion` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` int(255) NOT NULL,
  `rol` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `rol`) VALUES
(1, 'administrador'),
(4, 'trabajador'),
(5, 'trabajador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_usuario`
--

CREATE TABLE `rol_usuario` (
  `idrol` int(255) NOT NULL,
  `idusuario` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol_usuario`
--

INSERT INTO `rol_usuario` (`idrol`, `idusuario`) VALUES
(1, 1),
(4, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido1` varchar(255) NOT NULL,
  `apellido2` varchar(255) DEFAULT NULL,
  `dni` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `edad` int(3) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `telefono1` int(20) DEFAULT NULL,
  `telefono2` int(20) DEFAULT NULL,
  `numss` varchar(30) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `localidad` varchar(255) DEFAULT NULL,
  `provincia` varchar(255) DEFAULT NULL,
  `fecha_incorporacion` date DEFAULT NULL,
  `fecha_finalizacion` date DEFAULT NULL,
  `antiguedad` int(3) DEFAULT NULL,
  `estudios` varchar(10000) DEFAULT NULL,
  `experiencia` varchar(10000) DEFAULT NULL,
  `idiomas` varchar(500) DEFAULT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `sueldo_mensual` int(4) DEFAULT NULL,
  `cotizacion_porcentaje` int(3) DEFAULT NULL,
  `idhorario` int(255) DEFAULT NULL,
  `foto` varchar(1000) DEFAULT NULL,
  `documentacion` varchar(1000) DEFAULT NULL,
  `porcentaje_discapacidad` int(3) DEFAULT NULL,
  `nombreuser` varchar(1000) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `apellido1`, `apellido2`, `dni`, `fecha_nacimiento`, `edad`, `correo`, `telefono1`, `telefono2`, `numss`, `direccion`, `localidad`, `provincia`, `fecha_incorporacion`, `fecha_finalizacion`, `antiguedad`, `estudios`, `experiencia`, `idiomas`, `cargo`, `sueldo_mensual`, `cotizacion_porcentaje`, `idhorario`, `foto`, `documentacion`, `porcentaje_discapacidad`, `nombreuser`, `password`) VALUES
(1, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'diego', 'diego'),
(2, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'maria', 'maria');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`idactividad`),
  ADD KEY `fk_usuario_actividad` (`idresponsable`);

--
-- Indices de la tabla `medicacion`
--
ALTER TABLE `medicacion`
  ADD PRIMARY KEY (`idmedicacion`);

--
-- Indices de la tabla `medicacion_usuario`
--
ALTER TABLE `medicacion_usuario`
  ADD PRIMARY KEY (`idusuario`,`idmedicacion`),
  ADD KEY `fk_idmedicacion` (`idmedicacion`);

--
-- Indices de la tabla `nuevacuenta`
--
ALTER TABLE `nuevacuenta`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `parentesco`
--
ALTER TABLE `parentesco`
  ADD PRIMARY KEY (`idparentesco`);

--
-- Indices de la tabla `parentesco_con`
--
ALTER TABLE `parentesco_con`
  ADD PRIMARY KEY (`idusuarioprincipal`,`idusuariorelacionado`,`idparentesco`),
  ADD KEY `fk_idusuariorelacionado` (`idusuariorelacionado`),
  ADD KEY `fk_idparentesco` (`idparentesco`);

--
-- Indices de la tabla `participantes_actividad`
--
ALTER TABLE `participantes_actividad`
  ADD PRIMARY KEY (`idusuario`,`idactividad`),
  ADD KEY `fk_actividad` (`idactividad`);

--
-- Indices de la tabla `peticiones`
--
ALTER TABLE `peticiones`
  ADD PRIMARY KEY (`idpeticion`);

--
-- Indices de la tabla `responsabilidad`
--
ALTER TABLE `responsabilidad`
  ADD PRIMARY KEY (`idprofesional`,`idusuario`),
  ADD KEY `fk_idusuario_responsabilidad` (`idusuario`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `rol_usuario`
--
ALTER TABLE `rol_usuario`
  ADD PRIMARY KEY (`idrol`,`idusuario`),
  ADD KEY `fk_new_rol_usuario` (`idusuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `idactividad` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medicacion`
--
ALTER TABLE `medicacion`
  MODIFY `idmedicacion` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `parentesco`
--
ALTER TABLE `parentesco`
  MODIFY `idparentesco` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `peticiones`
--
ALTER TABLE `peticiones`
  MODIFY `idpeticion` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD CONSTRAINT `fk_usuario_actividad` FOREIGN KEY (`idresponsable`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `medicacion_usuario`
--
ALTER TABLE `medicacion_usuario`
  ADD CONSTRAINT `fk_idmedicacion` FOREIGN KEY (`idmedicacion`) REFERENCES `medicacion` (`idmedicacion`),
  ADD CONSTRAINT `fk_idusuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `parentesco_con`
--
ALTER TABLE `parentesco_con`
  ADD CONSTRAINT `fk_idparentesco` FOREIGN KEY (`idparentesco`) REFERENCES `parentesco` (`idparentesco`),
  ADD CONSTRAINT `fk_idusuarioprincipal` FOREIGN KEY (`idusuarioprincipal`) REFERENCES `usuario` (`idusuario`),
  ADD CONSTRAINT `fk_idusuariorelacionado` FOREIGN KEY (`idusuariorelacionado`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `participantes_actividad`
--
ALTER TABLE `participantes_actividad`
  ADD CONSTRAINT `fk_actividad` FOREIGN KEY (`idactividad`) REFERENCES `actividad` (`idactividad`),
  ADD CONSTRAINT `fk_usuario_participante_actividad` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `responsabilidad`
--
ALTER TABLE `responsabilidad`
  ADD CONSTRAINT `fk_idprofesional` FOREIGN KEY (`idprofesional`) REFERENCES `usuario` (`idusuario`),
  ADD CONSTRAINT `fk_idusuario_responsabilidad` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `rol_usuario`
--
ALTER TABLE `rol_usuario`
  ADD CONSTRAINT `fk_new_rol_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`),
  ADD CONSTRAINT `fk_nuevo_rol_usuarios` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
