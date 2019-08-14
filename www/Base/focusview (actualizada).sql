-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-07-2019 a las 16:11:01
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `focusview`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(10) UNSIGNED NOT NULL,
  `Nombre_categoria` varchar(50) DEFAULT NULL,
  `Imagen_categoria` varchar(50) NOT NULL,
  `Descripcion_categoria` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `Nombre_categoria`, `Imagen_categoria`, `Descripcion_categoria`) VALUES
(48, 'Categoria 1', '5cdac9eae97b5.jpg', 'Camaras deportivas'),
(49, 'Categoria 2', '5cdaca0b019f5.jpg', 'Accesorios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(10) UNSIGNED NOT NULL,
  `Nombre_cliente` varchar(50) NOT NULL,
  `Apellido_cliente` varchar(50) NOT NULL,
  `Usuario_cliente` varchar(20) NOT NULL,
  `Correo_cliente` varchar(100) NOT NULL,
  `Clave_cliente` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `Nombre_cliente`, `Apellido_cliente`, `Usuario_cliente`, `Correo_cliente`, `Clave_cliente`) VALUES
(1, 'Gerardo', 'Ramirez', 'Gerardo3', 'gerardo@gmail.com', '123456'),
(11, 'Gerardo', 'Ramirez', 'Gerardo503', 'gerardo2@gmail.com', '$2y$10$.FiWQPLSz4LXvX6eTz6HUOz9.BvO2VieE4RKBmY9AWaeknaadlcl.'),
(12, 'Josue', 'Ezequiel', 'Josue', 'ezejosue@gmail.es', '$2y$10$C0kfkXkB94sqZidoqCc12eSA7VFz3RRmeJZUSnlZ4TzUIfrp95lty'),
(14, 'Carlos', 'Quijano', 'Carlete', 'carlos@gmail.com', '$2y$10$Xe9P7t7AUxOutwvFlBFT7.qPYPq18o9tM3pV3.URCqPHrxN7w2GbG'),
(22, 'Gerardo', 'Ramirez', 'Ezejosue', 'gerardo4@gmail.com', '$2y$10$vOLa/Y2D1WSQ9q28DqPY9es9lNg8Le.nkgQ72sY0zvtZ5GqqV0kLu'),
(23, 'Josue', 'Ezequiel', 'Josue22', 'ezejosue22@gmail.es', '$2y$10$hxrY9zbKBAkUUVgIUOzahephYEc/OGHabryWT5I9AAEEz6ZM3WW1G');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id_detalle` int(11) NOT NULL,
  `id_pedido` int(10) UNSIGNED NOT NULL,
  `id_producto` int(10) UNSIGNED NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id_detalle`, `id_pedido`, `id_producto`, `Cantidad`) VALUES
(1, 1, 16, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(10) UNSIGNED NOT NULL,
  `Fecha_pedido` date NOT NULL,
  `id_cliente` int(10) UNSIGNED NOT NULL,
  `Estado_pedido` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `Fecha_pedido`, `id_cliente`, `Estado_pedido`) VALUES
(1, '2019-06-12', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pre_pedido`
--

CREATE TABLE `pre_pedido` (
  `id_prepedido` int(10) UNSIGNED NOT NULL,
  `id_cliente` int(10) UNSIGNED NOT NULL,
  `id_producto` int(10) UNSIGNED NOT NULL,
  `cantidad` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pre_pedido`
--

INSERT INTO `pre_pedido` (`id_prepedido`, `id_cliente`, `id_producto`, `cantidad`) VALUES
(8, 11, 15, 5),
(9, 11, 16, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(10) UNSIGNED NOT NULL,
  `Nombre_producto` varchar(50) DEFAULT NULL,
  `Descripcion_producto` varchar(200) DEFAULT NULL,
  `Precio_producto` decimal(5,2) NOT NULL DEFAULT '0.00',
  `Imagen_producto` varchar(50) NOT NULL,
  `Estado_producto` tinyint(1) NOT NULL DEFAULT '1',
  `id_categoria` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `Nombre_producto`, `Descripcion_producto`, `Precio_producto`, `Imagen_producto`, `Estado_producto`, `id_categoria`) VALUES
(15, 'Producto 1', 'test', '5.01', '5cdaca93cdc43.jpg', 1, 48),
(16, 'Producto 2', 'de todo tipo', '3.01', '5cdae11116576.jpg', 1, 49);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `Apellido` varchar(20) DEFAULT NULL,
  `Nombre_Usuario` varchar(20) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Clave` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `Nombre`, `Apellido`, `Nombre_Usuario`, `Correo`, `Clave`) VALUES
(15, 'Gerardo', 'Ramirez', 'Gerardo', 'gerardo2@gmail.com', '$2y$10$zXaQslHYoVJQgaMhZxJxhOTr.jevBWET2k2cYXN3lHDIH/2tfTCIq'),
(16, 'test', 'test', 'test', 'test@gmail.com', '$2y$10$A4JPx2RYQBBQ71nTIyqvnuCgf.zKEVHpi7MW03hqGy/fD2rcbFANW');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `Nombre_categoria` (`Nombre_categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `Usuario_cliente` (`Usuario_cliente`),
  ADD UNIQUE KEY `Correo_cliente` (`Correo_cliente`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `pre_pedido`
--
ALTER TABLE `pre_pedido`
  ADD PRIMARY KEY (`id_prepedido`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD UNIQUE KEY `Nombre_producto` (`Nombre_producto`),
  ADD UNIQUE KEY `Nombre_producto_2` (`Nombre_producto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `Correo` (`Correo`),
  ADD UNIQUE KEY `Nombre_Usuario` (`Nombre_Usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `pre_pedido`
--
ALTER TABLE `pre_pedido`
  MODIFY `id_prepedido` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);

--
-- Filtros para la tabla `pre_pedido`
--
ALTER TABLE `pre_pedido`
  ADD CONSTRAINT `pre_pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `pre_pedido_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
