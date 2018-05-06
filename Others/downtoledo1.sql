-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-05-2018 a las 22:05:30
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

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `allcodes` ()  BEGIN
select a.codigo,b.rol from nuevacuenta a, rol b where a.idrol=b.idrol;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `allpetis` ()  BEGIN
select * from peticiones;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `allrol` ()  BEGIN
select rol from rol;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `comprobarcode` (`codex` VARCHAR(10))  BEGIN
select codigo from nuevacuenta where codigo=codex;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `comprobarexisteuser` (`usuariox` VARCHAR(255))  BEGIN
select nombreuser from usuario where nombreuser=usuariox;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `comprobarusuario` (`usuariox` VARCHAR(255), `contrasenax` VARCHAR(255))  BEGIN
select nombreuser,password from usuario where nombreuser=usuariox and password=contrasenax;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `createcode` (`clave` VARCHAR(255), `idrol` INT(255))  BEGIN
INSERT into nuevacuenta values(clave,idrol);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `createnewrol` (`rol` VARCHAR(255))  BEGIN
insert into rol values(null,rol);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `createpeti` (`nombre` VARCHAR(255), `apellido1` VARCHAR(255), `apellido2` VARCHAR(255), `correo` VARCHAR(255), `descripcion` VARCHAR(255))  BEGIN
insert into peticiones values(null,nombre,apellido1,apellido2,correo,descripcion);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `createuser` (`userx` VARCHAR(255), `passx` VARCHAR(255))  BEGIN
insert into usuario  values(null,'por defecto','por defecto',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,userx,passx);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteallcodes` ()  BEGIN
delete from nuevacuenta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteallpetis` ()  BEGIN
delete from peticiones;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletecode` (`codex` VARCHAR(10))  BEGIN
delete from nuevacuenta where codigo=codex;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletepeti` (`correo` VARCHAR(255))  BEGIN
delete from peticiones where correo=correo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `descargardatosuser` (`usuariox` VARCHAR(255))  BEGIN
select a.nombre,a.apellido1,a.apellido2,a.dni,a.fecha_nacimiento, a.fecha_incorporacion,
a.fecha_finalizacion
,a.edad,a.correo,
a.telefono1,a.telefono2,a.numss,a.direccion,a.localidad,a.provincia,
a.antiguedad,a.estudios,a.experiencia,
a.idiomas,a.cargo,a.sueldo_mensual,a.cotizacion_porcentaje,a.horario,a.foto,a.documentacion,
a.porcentaje_discapacidad,a.nombreuser,a.password,b.idrol
from usuario a,rol_usuario b
where a.nombreuser=usuariox and a.idusuario=b.idusuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `descargarinfousuario` (`usuariox` VARCHAR(255))  BEGIN
select a.idusuario,a.nombre,a.apellido1,a.apellido2,a.foto,a.nombreuser,b.idrol
from usuario a, rol_usuario b
where a.nombreuser=usuariox and a.idusuario=b.idusuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `namerol` (`idrolex` INT(255))  BEGIN
select rol from rol where idrol=idrolex;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `whorol` (`rolex` VARCHAR(255))  BEGIN
select idrol from rol where rol=rolex;
END$$

DELIMITER ;

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
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `idnoticia` int(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `idcreador` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nuevacuenta`
--

CREATE TABLE `nuevacuenta` (
  `codigo` varchar(255) NOT NULL,
  `idrol` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `nuevacuenta`
--

INSERT INTO `nuevacuenta` (`codigo`, `idrol`) VALUES
('FMfNRQE5lx', 12);

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
(5, 'trabajador'),
(6, 'Joder'),
(7, 'loqui'),
(8, 'adsadas'),
(9, 'sda'),
(10, 'dddd'),
(11, 'kase.o'),
(12, 'family');

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
-- Estructura de tabla para la tabla `tablon`
--

CREATE TABLE `tablon` (
  `idanuncio` int(255) NOT NULL,
  `idcreador` int(255) NOT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `idencargado` int(255) DEFAULT NULL,
  `area` varchar(1000) DEFAULT NULL,
  `enprogreso` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `horario` varchar(255) DEFAULT NULL,
  `foto` varchar(1000) DEFAULT NULL,
  `documentacion` varchar(1000) DEFAULT NULL,
  `porcentaje_discapacidad` int(3) DEFAULT NULL,
  `nombreuser` varchar(1000) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `apellido1`, `apellido2`, `dni`, `fecha_nacimiento`, `edad`, `correo`, `telefono1`, `telefono2`, `numss`, `direccion`, `localidad`, `provincia`, `fecha_incorporacion`, `fecha_finalizacion`, `antiguedad`, `estudios`, `experiencia`, `idiomas`, `cargo`, `sueldo_mensual`, `cotizacion_porcentaje`, `horario`, `foto`, `documentacion`, `porcentaje_discapacidad`, `nombreuser`, `password`) VALUES
(1, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'diego', 'diego'),
(2, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'maria', 'maria'),
(3, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pene', 'pene'),
(4, 'por defecto', 'por defecto', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pene', 'pene'),
(5, 'por defecto', 'por defecto', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pene', 'pene');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visibilidad_tablon`
--

CREATE TABLE `visibilidad_tablon` (
  `idanuncio` int(255) NOT NULL,
  `idrol` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`idnoticia`);

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
-- Indices de la tabla `tablon`
--
ALTER TABLE `tablon`
  ADD PRIMARY KEY (`idanuncio`),
  ADD KEY `pk_tablon` (`idcreador`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- Indices de la tabla `visibilidad_tablon`
--
ALTER TABLE `visibilidad_tablon`
  ADD PRIMARY KEY (`idanuncio`,`idrol`),
  ADD KEY `fk_tablon` (`idrol`);

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
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `idnoticia` int(255) NOT NULL AUTO_INCREMENT;

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
  MODIFY `idrol` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tablon`
--
ALTER TABLE `tablon`
  MODIFY `idanuncio` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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

--
-- Filtros para la tabla `tablon`
--
ALTER TABLE `tablon`
  ADD CONSTRAINT `pk_tablon` FOREIGN KEY (`idcreador`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `visibilidad_tablon`
--
ALTER TABLE `visibilidad_tablon`
  ADD CONSTRAINT `fk_tablon` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`),
  ADD CONSTRAINT `fk_visibilidad` FOREIGN KEY (`idanuncio`) REFERENCES `tablon` (`idanuncio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
