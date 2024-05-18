-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3305
-- Tiempo de generación: 30-11-2023 a las 14:32:03
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL CHECK (`cantidad` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id`, `id_usuario`, `cantidad`) VALUES
(1, 2, 1),
(2, 3, 0),
(3, 4, 0),
(4, 5, 0),
(5, 6, 0),
(6, 7, 0),
(7, 8, 0),
(8, 9, 0),
(9, 10, 0),
(10, 11, 0),
(11, 12, 0),
(12, 13, 0),
(13, 14, 0),
(14, 15, 0),
(15, 16, 0),
(16, 17, 0),
(17, 18, 0),
(18, 19, 0),
(19, 20, 0),
(20, 21, 0),
(21, 22, 0),
(22, 23, 0),
(23, 24, 0),
(24, 25, 0),
(25, 26, 0),
(26, 27, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_productos`
--

CREATE TABLE `carrito_productos` (
  `id_producto` int(11) NOT NULL,
  `id_carrito` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL CHECK (`cantidad` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrito_productos`
--

INSERT INTO `carrito_productos` (`id_producto`, `id_carrito`, `cantidad`) VALUES
(5, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_carrito` int(11) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(50) DEFAULT NULL,
  `precio_total` decimal(10,2) DEFAULT NULL CHECK (`precio_total` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id`, `id_usuario`, `id_carrito`, `fecha`, `estado`, `precio_total`) VALUES
(5, 2, 1, '2023-11-20 14:30:39', 'en camino', 120.00),
(6, 2, 1, '2023-11-23 18:01:12', 'en camino', 20.00),
(7, 2, 1, '2023-11-23 18:20:32', 'en camino', 105.00),
(8, 2, 1, '2023-11-23 18:25:55', 'en camino', 60.00),
(9, 2, 1, '2023-11-23 19:19:25', 'en camino', 32.00),
(10, 4, 3, '2023-11-23 19:25:12', 'en camino', 0.00),
(11, 2, 1, '2023-11-23 21:22:25', 'en camino', 44.00),
(12, 2, 1, '2023-11-23 21:34:24', 'en camino', 227.00),
(13, 2, 1, '2023-11-23 21:36:33', 'en camino', 100.00),
(14, 2, 1, '2023-11-26 23:20:10', 'en camino', 135.00),
(15, 2, 1, '2023-11-26 23:21:41', 'en camino', 10.00),
(16, 26, 25, '2023-11-29 09:57:31', 'en camino', 10.00),
(17, 2, 1, '2023-11-29 10:09:12', 'en camino', 20.00),
(18, 26, 25, '2023-11-29 10:09:50', 'en camino', 10.00),
(19, 26, 25, '2023-11-29 10:10:55', 'en camino', 15.00),
(20, 26, 25, '2023-11-29 10:11:50', 'en camino', 3.00),
(21, 26, 25, '2023-11-29 10:12:15', 'en camino', 4.00),
(22, 26, 25, '2023-11-29 10:17:49', 'en camino', 3.00),
(23, 26, 25, '2023-11-29 10:21:47', 'en camino', 15.00),
(24, 26, 25, '2023-11-29 10:43:33', 'en camino', 15.00),
(25, 26, 25, '2023-11-29 10:48:52', 'en camino', 5.00),
(26, 2, 1, '2023-11-29 19:11:07', 'en camino', 29.00),
(27, 3, 2, '2023-11-30 12:46:45', 'en camino', 24.00),
(28, 3, 2, '2023-11-30 12:50:08', 'en camino', 48.00),
(29, 3, 2, '2023-11-30 12:52:24', 'en camino', 24.00),
(30, 3, 2, '2023-11-30 12:52:43', 'en camino', 24.00),
(31, 3, 2, '2023-11-30 12:56:08', 'en camino', 96.00),
(32, 3, 2, '2023-11-30 12:57:40', 'en camino', 96.00),
(33, 3, 2, '2023-11-30 13:01:02', 'en camino', 24.00),
(34, 4, 3, '2023-11-30 13:03:25', 'en camino', 90.00),
(35, 4, 3, '2023-11-30 13:06:51', 'en camino', 72.00),
(36, 4, 3, '2023-11-30 13:07:22', 'en camino', 6.00),
(37, 26, 25, '2023-11-30 13:23:28', 'en camino', 30.00),
(38, 26, 25, '2023-11-30 13:26:04', 'en camino', 60.00),
(39, 26, 25, '2023-11-30 13:26:39', 'en camino', 60.00),
(40, 3, 2, '2023-11-30 13:30:28', 'en camino', 20.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `imagen_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio`, `stock`, `imagen_url`) VALUES
(5, 'Camiseta Blanca', 'Camiseta básica de algodón.', 5.00, -1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3u4Qufw1wW5nOU1HsMmy5w3mwr-YJp9hCyLxPWbYjvRou0qnaMd06ibCpLQV7WzGtaDI&usqp=CAU'),
(7, 'Chaqueta tejana', 'Chauqeta perfecta para el entretiempo, ni demasiado delgado ni grueso', 12.00, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTozzg0a1Q0V4chHhwFlbUoIHkTAKb567kZNA&usqp=CAU'),
(8, 'Vestido negro', 'Vestido veraniego de algodón', 20.00, 31, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQ6hZrEftgMU6zB00ZwYIxE2ts8hwn_IhYtVzw0uCDnm6C_zF-Pz0FtJAnny54CNaXD4k&usqp=CAU'),
(9, 'Chaqueta de invierno', 'Chaqueta gruesa para combatir el frio', 50.00, 50, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSf5yrueK20zT9TC_AcyXomn2c1sHh-2xk2HA&usqp=CAU'),
(10, 'Sudadera', 'Sudadera muy cómoda que brinda un abrigo ligero', 25.00, 43, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXiez9Q_vrZ5DWcSxEargkXJGSYbd6ZE--fw&usqp=CAU');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos`
--

CREATE TABLE `telefonos` (
  `id` int(11) NOT NULL,
  `numero` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `telefonos`
--

INSERT INTO `telefonos` (`id`, `numero`) VALUES
(1, '667285017'),
(2, '938111758'),
(3, '123456789'),
(4, '987654323'),
(5, '123456789'),
(6, '987654323'),
(7, '123456789'),
(8, '987654323'),
(9, '123456789'),
(10, '987654323'),
(11, '123456789'),
(12, '987654323'),
(13, '987654323'),
(14, '123456789'),
(15, '123456789'),
(16, '987654323'),
(17, '123456789'),
(18, '987654323'),
(19, '123456789'),
(20, '987654323'),
(21, '667285019'),
(22, '938111757'),
(23, '667285019'),
(24, '938111757'),
(25, '667567843'),
(26, '667285017'),
(27, '666666666'),
(28, '666666666'),
(29, '667788987'),
(30, '667285019'),
(31, '938111757'),
(32, '667678789'),
(33, '6'),
(34, '667898987'),
(35, '666555444'),
(36, '44455556666'),
(37, '6'),
(38, '5'),
(39, '4'),
(40, '6'),
(41, '666655556'),
(42, '666777888'),
(43, '66728693'),
(44, '66728693'),
(45, '56546754'),
(46, '666555444'),
(47, '66728693'),
(48, '123456789'),
(49, '987654323'),
(50, '123456789'),
(51, '987654323'),
(52, '123456789'),
(53, '987654323'),
(54, '666666666'),
(55, '666666666'),
(56, '66728693'),
(57, '66728693'),
(58, '777777777777777'),
(59, '66728693'),
(60, '777777777777777'),
(61, '666555444'),
(62, '666555444'),
(63, '666555444'),
(64, '666555444'),
(65, '666555444'),
(66, '666555444'),
(67, '666555444'),
(68, '66728693'),
(69, '666777788'),
(70, '666555444'),
(71, '66728693'),
(72, '667285019'),
(73, '938111757'),
(74, '6666666666'),
(75, '666666666'),
(76, '666555444');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos_usuarios`
--

CREATE TABLE `telefonos_usuarios` (
  `id_telefonos` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `telefonos_usuarios`
--

INSERT INTO `telefonos_usuarios` (`id_telefonos`, `id_usuario`) VALUES
(21, 3),
(22, 3),
(23, 4),
(24, 4),
(25, 5),
(26, 6),
(27, 7),
(28, 8),
(29, 9),
(30, 10),
(31, 10),
(32, 11),
(33, 12),
(34, 13),
(35, 14),
(36, 15),
(37, 16),
(38, 17),
(39, 18),
(40, 19),
(41, 20),
(42, 21),
(43, 22),
(44, 23),
(45, 24),
(46, 25),
(47, 25),
(70, 2),
(71, 2),
(75, 27),
(76, 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `correo_electronico` varchar(255) NOT NULL,
  `contrasenya` varchar(255) NOT NULL,
  `direccion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellidos`, `correo_electronico`, `contrasenya`, `direccion`) VALUES
(2, 'Jose Antonio', 'Ruiz Junyent', 'pepdsfdsferj7@gmail.com', '$2b$10$6gZB/qse8b8UNMV6839RV.DAkW.7qBcYHTnTiC3htBidgnVOzduPW', 'aaa'),
(3, 'dv', 'dv', 'd@gmail.com', '$2b$10$0JgByeWh.29j9mbHI5ADYupsAPh.MBnP6VDw9eB9FLaYKJS2oq0qC', 'calle Olivella, nº9, Bajos. Sitges'),
(4, 'ola', 'ola', 'ola@gmail.com', '$2b$10$.bBnKqHVq9KsGnV2Jyjpbe8u2G5dL5bC7C7XOK450iwvXx04DrJIm', 'calle Olivella, nº9, Bajos. Sitges'),
(5, 'david', 'Lopez Lopez', 'eee@gmail.com', '$2b$10$YTVwE0RdplDkdE9.Uk7b.OTMXSRnzoiFVgTm0bjuuL5QCM6FtuIma', 'calle palacios nº9barcelona'),
(6, 'Jose', 'Lopez Lopez', 'e@gmail.com', '$2b$10$QTgEY2ZIDFu8p2nI87Uybeh.qePhn2U0UoHP5ZxNHweAiBLCsudMK', 'calle palacios nº9barcelona'),
(7, 'david', 'fhg', 'david@gmail.com', '$2b$10$jz4/cFijXaLsNui0klKX6OQrDfMs2JsTnVw0gV6BMZOZIv6OJX/2G', 'rgeregrerg'),
(8, 'gh', 'fhg', 'g@gmail.com', '$2b$10$IT9u4u2zPXr.c6Qi1kQysuP9mOzpffb80La1L3ZbW5tz5RURTW7l6', 'calle palacios nº9barcelona'),
(9, 'gh', 'Lopez Lopez', 'gg@gmail.com', '$2b$10$DHnjG7u9ml9ya.83ti/oR.fW/xsP9fNeTijh0UXjsPzmZrfWJjaia', 'calle palacios nº9barcelona'),
(10, 'ola', 'ola', 'ola1@gmail.com', '$2b$10$cqC2zy7e9wNKp.CVC82L4uT5NuvNKoGt/8qn8G7mU8Z3ousd/Xyay', 'calle Olivella, nº9, Bajos. Sitges'),
(11, 'gh', 'fhg', 'e1@gmail.com', '$2b$10$C45NVmBdE5YqFdHWCtpq5OWaGpiVidU/yG/4yRZL0eBP2TCUjcwMe', 'calle palacios nº9barcelona'),
(12, 'gh', 'dfg', 'e5@gmail.com', '$2b$10$DyCas6aNqvZGJwoNrznPo.NlMssF6kCWRp/MXAno03b5SlbNjVoZ6', 'calle palacios nº9barcelona'),
(13, 'gh', 'fdgdfg', 'e6@gmail.com', '$2b$10$oyRq0jSXXs36KTMrYgb09eAlPPYSFxTIH5tYTwZsEEww4m9LwvSQm', 'calle palacios nº9barcelona'),
(14, 'david', 'sdsd', 'e7@gmail.com', '$2b$10$MEaTeqGPhQfRD4R4oLoA9uyErvlqWoFAMpLhEtJuLg0/SXdHPjGSW', 'calle palacios nº9barcelona'),
(15, 'Pepe', 'Lopez Lopez', 'a1@gmail.com', '$2b$10$HdQ.AO3zwxu6KOa8Sp0YcuqSd/zLqsiQVszN0s69QPKt8XK24rK7O', 'Calle Olivella, nº9, Bajos, Sitges'),
(16, 'Pepe', 'Ruiz Junyent', 'eee1@gmail.com', '$2b$10$jRyPb3ZpA9E2QIZ/WRKqWeG1BY2G5yoQacHaPSpVLfpGDjBm2eS1a', 'Calle Olivella, nº9, Bajos, Sitges'),
(17, 'david', 'Lopez Lopez', 'g1@gmail.com', '$2b$10$jVGXakXrtofQUxJV6xnhYelzQ8eOMyfh.6NYpulg1RGdXiKcWzZdG', 'calle palacios nº9barcelona'),
(18, 'Pepe', 'fhg', 'eee2@gmail.com', '$2b$10$SVvbpKsonF7wXkXRTDiJHePspIbpcxON/7ayyVZPfShEF3Iw90vjy', 'calle palacios nº9barcelona'),
(19, 'Pepe', 'Ruiz Junyent', 'g2@gmail.com', '$2b$10$u6Mx6.huwEn0RexTmJhUX.LAXiDYilmeaLod7iK2ilE0v1i7L3csm', 'calle palacios nº9barcelona'),
(20, 'david', 'fhg', 'er@gmail.com', '$2b$10$T1Mt1t7tfwAXF3dXbDkVZ.6y3IV1oRZMJfBzTNmQr8lFH0nHIsP8y', 'calle palacios nº9barcelona'),
(21, 'Pepe', 'Ruiz Junyent', 'davg@gmail.com', '$2b$10$v1t0lYhvw5iwRr2QCXEwGemviVWM8fFLGAfDZMGGBtKAH9fh.b4PO', 'rgeregrerg'),
(22, 'david', 'Lopez Lopez', 'fe@gmail.com', '$2b$10$9tUjLhDEzo5VfJndtRMXh.MNVdTvVqXpq40PkA9wC.kU2CsHMe/rW', 'calle olivella, nº9'),
(23, 'david', 'Lopez Lopez', '222g@gmail.com', '$2b$10$TgrHg79/Gk6Nd1YTEsWf5usDJ7A931xesjF3O1kcU/s3JGuoFMBnG', 'Calle Olivella, nº9, Bajos, Sitges'),
(24, 'Pepe', 'fhg', 'eee222@gmail.com', '$2b$10$UJyioM6pHr5Bue9ufKPbwO4KFrYpFEk1X1cFcwyY30gRPw2PTNjCO', 'calle palacios nº9barcelona'),
(25, 'Pepe', 'Lopez Lopez', 'ewqwqeg@gmail.com', '$2b$10$sPeG1wX7r7hgbQQ/b0SXUuwfI6uJFxjJITcOTLmh8RvVoSHu1gTRW', 'Calle Olivella, nº9, Bajos'),
(26, 'ola', 'ola', 'peperj7@gmail.com', '$2b$10$HPjGn.CMayzQGdBNxVwy4.airJAs3tUyeIfCOVFzJexEQoOH5FYP2', 'calle Olivella, nº9, Bajos. Sitges'),
(27, 'regrge', 'Lopez Lopez', 'gdffd@gmail.com', '$2b$10$LmOrw4fWiVcoXgk8bbzCNOM/2a91TEPkhu6o9ZlwcnFBgSHU/6.Cm', 'Calle Olivella, nº9, Bajos, Sitges');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `carrito_productos`
--
ALTER TABLE `carrito_productos`
  ADD PRIMARY KEY (`id_producto`,`id_carrito`),
  ADD KEY `id_carrito` (`id_carrito`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_carrito` (`id_carrito`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `telefonos_usuarios`
--
ALTER TABLE `telefonos_usuarios`
  ADD PRIMARY KEY (`id_telefonos`,`id_usuario`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo_electronico` (`correo_electronico`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `carrito_productos`
--
ALTER TABLE `carrito_productos`
  ADD CONSTRAINT `carrito_productos_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`),
  ADD CONSTRAINT `carrito_productos_ibfk_2` FOREIGN KEY (`id_carrito`) REFERENCES `carrito` (`id`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_carrito`) REFERENCES `carrito` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `telefonos_usuarios`
--
ALTER TABLE `telefonos_usuarios`
  ADD CONSTRAINT `telefonos_usuarios_ibfk_1` FOREIGN KEY (`id_telefonos`) REFERENCES `telefonos` (`id`),
  ADD CONSTRAINT `telefonos_usuarios_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
