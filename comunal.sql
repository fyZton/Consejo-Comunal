-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-04-2024 a las 04:23:49
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `comunal`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `beneficios`
--

CREATE TABLE `beneficios` (
  `idBeneficio` int(11) NOT NULL,
  `nombreBeneficio` varchar(255) NOT NULL,
  `idComunidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `casas`
--

CREATE TABLE `casas` (
  `idCasa` int(11) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `color` varchar(50) NOT NULL,
  `idManzana` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos-comunidad`
--

CREATE TABLE `datos-comunidad` (
  `idComunidad` int(11) NOT NULL,
  `nombreComunidad` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `manzanas`
--

CREATE TABLE `manzanas` (
  `idManzana` int(11) NOT NULL,
  `nombreManzana` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `manzaneros`
--

CREATE TABLE `manzaneros` (
  `idManzanero` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `idManzana` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `idPersona` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `cedula` varchar(10) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `idComunidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relaciones-familiares`
--

CREATE TABLE `relaciones-familiares` (
  `idRelacion` int(11) NOT NULL,
  `idPersona1` int(11) NOT NULL,
  `idPersona2` int(11) NOT NULL,
  `tipoRelacion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `beneficios`
--
ALTER TABLE `beneficios`
  ADD PRIMARY KEY (`idBeneficio`),
  ADD KEY `idComunidad` (`idComunidad`);

--
-- Indices de la tabla `casas`
--
ALTER TABLE `casas`
  ADD PRIMARY KEY (`idCasa`),
  ADD KEY `idManzana` (`idManzana`);

--
-- Indices de la tabla `datos-comunidad`
--
ALTER TABLE `datos-comunidad`
  ADD PRIMARY KEY (`idComunidad`);

--
-- Indices de la tabla `manzanas`
--
ALTER TABLE `manzanas`
  ADD PRIMARY KEY (`idManzana`);

--
-- Indices de la tabla `manzaneros`
--
ALTER TABLE `manzaneros`
  ADD PRIMARY KEY (`idManzanero`),
  ADD KEY `idPersona` (`idPersona`),
  ADD KEY `idManzana` (`idManzana`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`idPersona`),
  ADD KEY `idComunidad` (`idComunidad`);

--
-- Indices de la tabla `relaciones-familiares`
--
ALTER TABLE `relaciones-familiares`
  ADD PRIMARY KEY (`idRelacion`),
  ADD KEY `idPersona1` (`idPersona1`),
  ADD KEY `idPersona2` (`idPersona2`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `beneficios`
--
ALTER TABLE `beneficios`
  MODIFY `idBeneficio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `casas`
--
ALTER TABLE `casas`
  MODIFY `idCasa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `datos-comunidad`
--
ALTER TABLE `datos-comunidad`
  MODIFY `idComunidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `manzanas`
--
ALTER TABLE `manzanas`
  MODIFY `idManzana` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `manzaneros`
--
ALTER TABLE `manzaneros`
  MODIFY `idManzanero` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `idPersona` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `relaciones-familiares`
--
ALTER TABLE `relaciones-familiares`
  MODIFY `idRelacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `beneficios`
--
ALTER TABLE `beneficios`
  ADD CONSTRAINT `beneficios_ibfk_1` FOREIGN KEY (`idComunidad`) REFERENCES `datos-comunidad` (`idComunidad`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `casas`
--
ALTER TABLE `casas`
  ADD CONSTRAINT `casas_ibfk_1` FOREIGN KEY (`idManzana`) REFERENCES `manzanas` (`idManzana`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `manzaneros`
--
ALTER TABLE `manzaneros`
  ADD CONSTRAINT `manzaneros_ibfk_1` FOREIGN KEY (`idManzana`) REFERENCES `manzanas` (`idManzana`) ON UPDATE CASCADE,
  ADD CONSTRAINT `manzaneros_ibfk_2` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `personas_ibfk_1` FOREIGN KEY (`idComunidad`) REFERENCES `datos-comunidad` (`idComunidad`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `relaciones-familiares`
--
ALTER TABLE `relaciones-familiares`
  ADD CONSTRAINT `relaciones-familiares_ibfk_1` FOREIGN KEY (`idPersona1`) REFERENCES `personas` (`idPersona`) ON UPDATE CASCADE,
  ADD CONSTRAINT `relaciones-familiares_ibfk_2` FOREIGN KEY (`idPersona2`) REFERENCES `personas` (`idPersona`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
