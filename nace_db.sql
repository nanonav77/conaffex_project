-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 23-12-2020 a las 03:21:23
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nace_db`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_cp_nace` (IN `fecha1` DATE, IN `fecha2` DATE, IN `idfinca` INT)  BEGIN
    SET @sql = NULL;
    SELECT
      GROUP_CONCAT(DISTINCT
        CONCAT(
          'sum(if(t.fecha = ''',
          fecha,
          ''', t.cajuelas + (case when t.cuartillos = 1 then 0.25
                             when t.cuartillos = 2 then 0.5
                             when t.cuartillos = 3 then 0.75 else 0 end), 0)) AS `',
          fecha ,'`'
        )
      ) INTO @sql
    FROM nace_produccion as q
    where q.fecha BETWEEN fecha1 and fecha2
    and q.ide_finca = idfinca;
    SET @sql = CONCAT('SELECT t.ide_colaborador,c.nombre, ', @sql, ' FROM nace_produccion as t
    inner join nace_colaboradores as c
    on c.numero = t.ide_colaborador
    group by t.ide_colaborador');

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `simpleproc` (OUT `param1` INT)  BEGIN
  SELECT COUNT(*) INTO param1 FROM t;
 END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nace_colaboradores`
--

CREATE TABLE `nace_colaboradores` (
  `numero` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `identificacion` bigint(20) DEFAULT NULL,
  `telefono` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `nace_colaboradores`
--

INSERT INTO `nace_colaboradores` (`numero`, `nombre`, `identificacion`, `telefono`, `email`, `estado`) VALUES
(1, 'Victor', 0, 61884176, '', 'Activo'),
(2, 'Sito', 0, 61884176, '', 'Activo'),
(3, 'Gabino', 0, 0, '', 'Activo'),
(4, 'Richard Navarro', 0, 87879900, '', 'Activo'),
(5, 'Domiciano', 0, 0, '', 'Activo'),
(6, 'Marcial', 0, 45693698, '', 'Activo'),
(7, 'Cesar', 0, 0, '', 'Activo'),
(8, 'Omar', 0, 83083785, '', 'Activo'),
(9, 'Arnulfo', 0, 89681100, '', 'Activo'),
(10, 'Alvarado', 0, 83083785, '', 'Activo'),
(11, 'Marco', 0, 83111846, '', 'Activo'),
(12, 'Ceveriano', 0, 88566681, '', 'Activo'),
(13, 'Concepcion', 0, 0, '', 'Activo'),
(14, 'Marcial Santo', 0, 0, '', 'Activo'),
(15, 'Camilo', 0, 87106962, '', 'Activo'),
(16, 'Agustin', 0, 0, '', 'Activo'),
(17, 'Hernesto', 0, 88559966, '', 'Activo'),
(18, 'Carlos', 0, 0, '', 'Activo'),
(19, 'Jenaro', 0, 0, '', 'Activo'),
(20, 'Manuel (Gato)', 0, 83793378, '', 'Inactivo'),
(21, 'Randall', 0, 0, '', 'Activo'),
(22, 'Wilberth', 0, 0, '', 'Activo'),
(23, 'Gretel', 0, 83015887, '', 'Activo'),
(24, 'EDELMA', 0, 0, '', 'Activo'),
(25, 'ALEX', 0, 36987545, '', 'Activo'),
(26, 'DEINER', 0, 0, '', 'Activo'),
(27, 'NARLYN', 0, 0, '', 'Activo'),
(28, 'BENJAMIN', 0, 0, '', 'Activo'),
(29, 'FIDENCIO ', 0, 0, '', 'Activo'),
(30, 'LEONARDO', 0, 0, '', 'Activo'),
(31, 'FREDY', 0, 0, '', 'Activo'),
(32, 'PORFIRIO', 0, 0, '', 'Activo'),
(33, 'FELIPE', 0, 0, '', 'Activo'),
(34, 'ADIEL', 0, 0, '', 'Activo'),
(35, 'RUFINO', 0, 0, '', 'Activo'),
(36, 'CECILIO', 0, 0, '', 'Activo'),
(37, 'JUAN', 0, 0, '', 'Activo'),
(38, 'MELKIN', 0, 0, '', 'Activo'),
(39, 'YILBERTH', 0, 0, '', 'Activo'),
(40, 'ABRAHAN', 0, 0, '', 'Activo'),
(41, 'BERMAN', 0, 0, '', 'Activo'),
(42, 'YOEL', 0, 0, '', 'Activo'),
(43, 'MANUEL', 0, 0, '', 'Activo'),
(44, 'CARLOS', 0, 0, '', 'Activo'),
(45, 'ALCIVIADES', 0, 0, '', 'Activo'),
(46, 'FELIX', 0, 0, '', 'Activo'),
(47, 'WISTON', 0, 0, '', 'Activo'),
(48, 'JOSE (CHEPE)', 0, 0, '', 'Activo'),
(49, 'OLMAN', 0, 0, '', 'Activo'),
(50, 'CELESTINO', 0, 0, '', 'Activo'),
(51, 'ROGER', 0, 0, '', 'Activo'),
(52, 'Elyin', 0, 0, '', 'Activo'),
(53, 'Roger yunior', 0, 0, '', 'Activo'),
(54, 'Hector', 0, 0, '', 'Activo'),
(55, 'Wilton ', 0, 0, '', 'Activo'),
(56, 'FERNANDO', 0, 0, '', 'Activo'),
(57, 'CERAFIN', 0, 0, '', 'Activo'),
(58, 'LUCIANO', 0, 0, '', 'Activo'),
(59, 'DEYRING', 0, 0, '', 'Activo'),
(60, 'Angelin', 0, 0, '', 'Activo'),
(61, 'GUISELLE', 0, 0, '', 'Activo'),
(62, 'Luis Camacho', 0, 0, '', 'Activo'),
(63, 'Jose David', 0, 0, '', 'Activo'),
(64, 'Silian', 0, 84771426, '', 'Activo'),
(65, ' Pedro Luis', 123456982, 85741236, 'pedro@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nace_fincas`
--

CREATE TABLE `nace_fincas` (
  `numero` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` text NOT NULL,
  `ide_propietario` int(11) NOT NULL,
  `tamano` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `nace_fincas`
--

INSERT INTO `nace_fincas` (`numero`, `nombre`, `direccion`, `ide_propietario`, `tamano`) VALUES
(1, 'EL Rosario', 'la fila, aserrí, desamparados', 304900948, 10),
(2, ' Caragral', ' Cartago, Guarco, Caragral', 304900948, NULL),
(3, 'El Norte ', ' San Cristobal, Desamparados', 304900948, NULL),
(4, 'San Juan ', ' San Juan', 304900948, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nace_produccion`
--

CREATE TABLE `nace_produccion` (
  `id_registro` int(11) NOT NULL,
  `ide_colaborador` int(11) NOT NULL,
  `ide_finca` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `cajuelas` int(11) NOT NULL,
  `cuartillos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `nace_produccion`
--

INSERT INTO `nace_produccion` (`id_registro`, `ide_colaborador`, `ide_finca`, `fecha`, `hora`, `cajuelas`, `cuartillos`) VALUES
(1, 23, 2, '2020-12-26', '08:01:50', 14, 3),
(2, 6, 2, '2020-12-23', '23:26:52', 7, 0),
(3, 2, 1, '2020-12-23', '16:35:25', 11, 0),
(4, 9, 1, '2020-12-21', '00:07:25', 15, 1),
(5, 22, 2, '2020-12-24', '12:23:41', 20, 0),
(6, 12, 1, '2020-12-26', '04:35:37', 16, 3),
(7, 25, 2, '2020-12-26', '14:45:41', 17, 3),
(8, 15, 1, '2020-12-26', '12:34:31', 10, 1),
(9, 14, 2, '2020-12-21', '17:46:02', 13, 1),
(10, 22, 2, '2020-12-26', '01:45:16', 4, 1),
(11, 16, 2, '2020-12-21', '16:06:47', 3, 0),
(12, 10, 2, '2020-12-26', '23:23:14', 7, 0),
(13, 5, 1, '2020-12-26', '12:30:22', 4, 1),
(14, 5, 1, '2020-12-25', '05:39:52', 19, 3),
(15, 15, 1, '2020-12-26', '19:41:19', 17, 2),
(16, 23, 1, '2020-12-26', '20:17:31', 4, 2),
(17, 7, 1, '2020-12-23', '02:43:30', 4, 2),
(18, 1, 1, '2020-12-25', '07:32:46', 18, 2),
(19, 16, 2, '2020-12-24', '01:46:09', 1, 3),
(20, 9, 1, '2020-12-26', '01:50:08', 6, 0),
(21, 8, 1, '2020-12-21', '15:26:45', 18, 0),
(22, 19, 2, '2020-12-25', '02:30:27', 13, 3),
(23, 19, 2, '2020-12-22', '00:06:48', 3, 0),
(24, 16, 2, '2020-12-22', '12:06:25', 2, 2),
(25, 6, 2, '2020-12-21', '20:35:55', 14, 3),
(26, 2, 2, '2020-12-26', '23:50:33', 18, 3),
(27, 8, 1, '2020-12-25', '19:51:54', 19, 0),
(28, 14, 2, '2020-12-21', '01:32:41', 5, 2),
(29, 21, 1, '2020-12-22', '07:17:58', 13, 3),
(30, 13, 2, '2020-12-24', '09:16:33', 6, 3),
(31, 2, 2, '2020-12-22', '03:55:07', 4, 1),
(32, 25, 2, '2020-12-25', '09:03:27', 16, 0),
(33, 12, 1, '2020-12-26', '01:25:15', 15, 2),
(34, 20, 2, '2020-12-23', '09:10:06', 1, 2),
(35, 10, 2, '2020-12-21', '05:08:49', 7, 1),
(36, 4, 1, '2020-12-21', '09:22:02', 18, 2),
(37, 16, 1, '2020-12-26', '03:39:29', 15, 1),
(38, 18, 2, '2020-12-22', '00:12:30', 17, 3),
(39, 12, 1, '2020-12-23', '19:47:09', 10, 2),
(40, 6, 2, '2020-12-25', '21:41:35', 5, 3),
(41, 22, 2, '2020-12-25', '00:01:29', 2, 1),
(42, 7, 2, '2020-12-25', '04:41:33', 16, 0),
(43, 6, 2, '2020-12-22', '01:27:53', 10, 0),
(44, 3, 2, '2020-12-21', '11:47:53', 15, 3),
(45, 15, 2, '2020-12-23', '12:22:01', 8, 3),
(46, 2, 1, '2020-12-24', '13:04:08', 8, 2),
(47, 2, 1, '2020-12-21', '11:08:38', 5, 2),
(48, 2, 2, '2020-12-23', '23:32:27', 3, 2),
(49, 24, 2, '2020-12-23', '21:48:02', 17, 1),
(50, 18, 1, '2020-12-23', '19:40:56', 4, 3),
(51, 20, 2, '2020-12-21', '15:35:39', 4, 1),
(52, 22, 2, '2020-12-22', '19:37:00', 14, 1),
(53, 24, 1, '2020-12-22', '06:42:20', 17, 3),
(54, 1, 2, '2020-12-24', '09:23:18', 4, 3),
(55, 11, 1, '2020-12-26', '15:03:47', 12, 0),
(56, 19, 2, '2020-12-24', '11:37:53', 3, 1),
(57, 15, 1, '2020-12-23', '13:36:43', 6, 1),
(58, 9, 2, '2020-12-23', '07:55:38', 12, 0),
(59, 18, 1, '2020-12-22', '00:22:03', 5, 0),
(60, 2, 2, '2020-12-24', '00:13:55', 10, 1),
(61, 3, 1, '2020-12-23', '14:28:17', 13, 2),
(62, 6, 2, '2020-12-23', '04:33:18', 10, 1),
(63, 4, 1, '2020-12-26', '04:05:20', 12, 2),
(64, 19, 1, '2020-12-23', '22:44:40', 8, 2),
(65, 8, 1, '2020-12-25', '02:41:48', 13, 2),
(66, 23, 1, '2020-12-25', '12:51:22', 16, 3),
(67, 8, 1, '2020-12-23', '17:49:46', 14, 2),
(68, 6, 2, '2020-12-21', '20:49:44', 2, 1),
(69, 16, 1, '2020-12-25', '06:31:06', 7, 2),
(70, 18, 2, '2020-12-25', '21:33:52', 18, 3),
(71, 5, 1, '2020-12-25', '23:45:17', 7, 3),
(72, 14, 1, '2020-12-26', '23:53:14', 20, 3),
(73, 1, 2, '2020-12-22', '21:38:46', 20, 2),
(74, 8, 1, '2020-12-22', '00:41:25', 17, 2),
(75, 17, 1, '2020-12-22', '22:52:39', 13, 3),
(76, 22, 2, '2020-12-21', '09:10:00', 1, 3),
(77, 17, 1, '2020-12-22', '20:16:14', 15, 3),
(78, 10, 1, '2020-12-22', '03:49:07', 13, 3),
(79, 24, 2, '2020-12-21', '00:56:51', 17, 3),
(80, 5, 2, '2020-12-25', '07:42:15', 5, 3),
(81, 11, 2, '2020-12-21', '21:05:48', 16, 3),
(82, 19, 1, '2020-12-24', '11:51:07', 6, 2),
(83, 15, 2, '2020-12-23', '14:37:00', 8, 3),
(84, 19, 2, '2020-12-25', '20:34:37', 11, 0),
(85, 15, 2, '2020-12-25', '09:40:34', 16, 3),
(86, 14, 1, '2020-12-26', '17:22:01', 14, 2),
(87, 6, 1, '2020-12-26', '09:14:12', 2, 0),
(88, 20, 1, '2020-12-26', '16:47:28', 7, 0),
(89, 21, 2, '2020-12-21', '19:48:48', 4, 2),
(90, 1, 2, '2020-12-25', '16:01:12', 17, 1),
(91, 6, 2, '2020-12-26', '16:13:19', 10, 1),
(92, 3, 1, '2020-12-23', '19:16:59', 5, 3),
(93, 8, 1, '2020-12-26', '08:12:52', 8, 0),
(94, 11, 1, '2020-12-22', '01:27:08', 16, 3),
(95, 15, 1, '2020-12-23', '13:40:20', 19, 2),
(96, 14, 1, '2020-12-23', '13:02:41', 2, 0),
(97, 10, 1, '2020-12-22', '09:16:18', 3, 3),
(98, 3, 2, '2020-12-21', '15:37:23', 7, 0),
(99, 3, 2, '2020-12-25', '04:53:52', 1, 1),
(100, 3, 2, '2020-12-24', '21:43:25', 18, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nace_produccion_fincas`
--

CREATE TABLE `nace_produccion_fincas` (
  `id_registro` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_finca` int(11) NOT NULL,
  `numero_recibo` int(11) NOT NULL,
  `cajuelas` int(11) NOT NULL,
  `cuartillos` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `nace_produccion_fincas`
--

INSERT INTO `nace_produccion_fincas` (`id_registro`, `fecha`, `id_finca`, `numero_recibo`, `cajuelas`, `cuartillos`) VALUES
(1, '2020-10-06', 1, 4545, 120, 2),
(8, '2020-11-04', 1, 2322, 222, 1),
(9, '2020-12-18', 3, 2563, 427, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nace_usuarios`
--

CREATE TABLE `nace_usuarios` (
  `identificacion` int(11) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `apellidos_usuario` varchar(150) NOT NULL,
  `rol_usuario` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contrasena` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `nace_usuarios`
--

INSERT INTO `nace_usuarios` (`identificacion`, `nombre_usuario`, `apellidos_usuario`, `rol_usuario`, `email`, `contrasena`) VALUES
(302800485, 'Mari', 'Navarro Romero', 'Usuario', 'mari45@gmail.com', 'mari45c'),
(304900948, 'José Daniel', 'Navarro Romero', 'Administrador', 'navrojd77@gmail.com', 'jupiter070417');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `nace_colaboradores`
--
ALTER TABLE `nace_colaboradores`
  ADD PRIMARY KEY (`numero`);

--
-- Indices de la tabla `nace_fincas`
--
ALTER TABLE `nace_fincas`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `ide_propietario` (`ide_propietario`);

--
-- Indices de la tabla `nace_produccion`
--
ALTER TABLE `nace_produccion`
  ADD PRIMARY KEY (`id_registro`),
  ADD KEY `ide_colaborador` (`ide_colaborador`),
  ADD KEY `ide_finca` (`ide_finca`);

--
-- Indices de la tabla `nace_produccion_fincas`
--
ALTER TABLE `nace_produccion_fincas`
  ADD PRIMARY KEY (`id_registro`),
  ADD KEY `id_finca` (`id_finca`);

--
-- Indices de la tabla `nace_usuarios`
--
ALTER TABLE `nace_usuarios`
  ADD PRIMARY KEY (`identificacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `nace_colaboradores`
--
ALTER TABLE `nace_colaboradores`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `nace_fincas`
--
ALTER TABLE `nace_fincas`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `nace_produccion`
--
ALTER TABLE `nace_produccion`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `nace_produccion_fincas`
--
ALTER TABLE `nace_produccion_fincas`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `nace_fincas`
--
ALTER TABLE `nace_fincas`
  ADD CONSTRAINT `nace_fincas_ibfk_1` FOREIGN KEY (`ide_propietario`) REFERENCES `nace_usuarios` (`identificacion`);

--
-- Filtros para la tabla `nace_produccion`
--
ALTER TABLE `nace_produccion`
  ADD CONSTRAINT `nace_produccion_ibfk_1` FOREIGN KEY (`ide_colaborador`) REFERENCES `nace_colaboradores` (`numero`),
  ADD CONSTRAINT `nace_produccion_ibfk_2` FOREIGN KEY (`ide_finca`) REFERENCES `nace_fincas` (`numero`);

--
-- Filtros para la tabla `nace_produccion_fincas`
--
ALTER TABLE `nace_produccion_fincas`
  ADD CONSTRAINT `nace_produccion_fincas_ibfk_1` FOREIGN KEY (`id_finca`) REFERENCES `nace_fincas` (`numero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
