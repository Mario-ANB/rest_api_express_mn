-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-05-2023 a las 17:45:02
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `factura`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice`
--

CREATE TABLE `invoice` (
  `id_invoice` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `date` date NOT NULL,
  `subtotal` double NOT NULL,
  `discount` double NOT NULL,
  `total` double NOT NULL,
  `estado` tinyint(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `invoice`
--

INSERT INTO `invoice` (`id_invoice`, `id_client`, `date`, `subtotal`, `discount`, `total`, `estado`) VALUES
(33, 1, '2023-04-21', 1000, 10, 900, 1),
(36, 1, '2023-04-21', 1000, 10, 900, 1),
(37, 4, '2023-04-01', 998, 0, 998, 1),
(38, 5, '2023-04-14', 1197, 30, 837.9, 1),
(39, 2, '2023-04-01', 1199, 0, 1199, 1),
(40, 1, '2023-04-16', 400, 4, 384, 1),
(41, 3, '2023-03-09', 2498, 5, 2373.1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice_products`
--

CREATE TABLE `invoice_products` (
  `id_invoice_product` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `estado` tinyint(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `invoice_products`
--

INSERT INTO `invoice_products` (`id_invoice_product`, `id_invoice`, `id_product`, `amount`, `estado`) VALUES
(21, 33, 45, 2, 1),
(22, 33, 64, 2, 1),
(23, 36, 45, 2, 1),
(24, 36, 64, 2, 1),
(25, 37, 67, 1, 1),
(26, 37, 46, 1, 1),
(27, 38, 46, 1, 1),
(28, 38, 67, 2, 1),
(29, 39, 46, 1, 1),
(30, 39, 64, 2, 1),
(31, 40, 64, 2, 1),
(32, 41, 45, 7, 1),
(33, 41, 67, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_product` int(11) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_product`, `product_name`, `price`, `estado`) VALUES
(45, 'iPhone 7 Plus', 300, 1),
(46, 'iPhone 12 Pro Max', 799, 1),
(64, 'iPhone 7', 200, 1),
(67, 'AirPods 2 Gen', 199, 1),
(68, 'iPhone 6+', 150, 1),
(123, 'Apple Watch 7', 300, 1),
(224, 'iPhone 13 Pro', 949, 1),
(231, 'iPhone X+', 400, 1),
(234, 'iPhone 5S', 179, 1),
(254, 'iPhone X', 399, 1),
(344, 'iPhone 6', 129, 1),
(345, 'iPhone 11', 299, 1),
(567, 'iPhone XR', 249, 1),
(768, 'iPhone SE', 199, 1),
(789, 'iPhone 12', 399, 1),
(876, 'iPhone 13', 599, 1),
(5675, 'AirPods Pro', 299, 1),
(6786, 'Air Pods Max', 1099, 1),
(56567, 'AirPods 3 Gen', 199, 1),
(56767, 'Air Tag', 49, 1),
(76687, 'iPad Pro', 1599, 1),
(94842, 'iPad Mini', 599, 1),
(94949, 'iPad Air', 499, 1),
(98786, 'iPhone 13 mini', 499, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_user` int(11) NOT NULL,
  `client_name` varchar(30) NOT NULL,
  `point_contact` varchar(30) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `rol` tinyint(2) NOT NULL,
  `estado` tinyint(2) NOT NULL DEFAULT 1,
  `fecha_creado` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_user`, `client_name`, `point_contact`, `phone_number`, `email`, `password`, `rol`, `estado`, `fecha_creado`) VALUES
(1, 'Lifelinea LLC', 'Ari Barkan', '758305749', 'ari@lifelinea.com', 'TGlmZWxpbmVhNzVBcmk=', 2, 1, '2020-04-20'),
(2, 'Focus Forward LLC', 'Dave Pataki', '666769940', 'dave@focusforwrad.com', 'Rm9jdXM2NkRhdmU=', 2, 1, '2022-04-20'),
(3, 'Flow INC', 'Chadwick Smith', '235035368', 'chad@flow.com', 'RmxvdzIzQ2hhZA==', 2, 1, '2015-04-20'),
(4, 'Marbi Inc', 'Kurt Silvers', '495338595', 'kurt@marbi.com', 'TWFyYmk0OUt1cnQ=', 2, 1, '2023-04-20'),
(5, 'Ex-IT Technologies', 'NA', '3005849394', 'info@exittech.com', 'RXgtSVQzME5B', 2, 1, '2023-04-20'),
(6, 'Agent Shield LLC', 'Lu Doan', '234567689', 'lu@agentshield.com', 'QWdlbnQxMkx1', 2, 1, '2023-04-20'),
(7, 'Evergreen Inc', 'Tony Pizzi', '12005053', 'tony@evergreen.com', 'RXZlcmdyZWVuMjNUb255', 2, 1, '2023-04-20'),
(8, 'FBL', 'Erick Boughman', '234234234', 'erick@fbl.com', 'RkJMMjNFcmljaw==', 2, 1, '2023-04-20'),
(9, 'Virtues Matters', 'Dave Feldman', '234234234', 'dave@virtues.com', 'VmlydHVlczIzRGF2ZQ==', 2, 1, '2023-04-20'),
(10, 'NA', 'Mario Nunez', '301955633.', 'mario@gmail.com', 'TmF5YW0xMjM=', 1, 1, '2023-04-25');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id_invoice`),
  ADD KEY `id_client` (`id_client`);

--
-- Indices de la tabla `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD PRIMARY KEY (`id_invoice_product`),
  ADD KEY `id_invoice_head` (`id_invoice`,`id_product`),
  ADD KEY `id_product` (`id_product`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_product`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id_invoice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `invoice_products`
--
ALTER TABLE `invoice_products`
  MODIFY `id_invoice_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `usuarios` (`id_user`);

--
-- Filtros para la tabla `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD CONSTRAINT `invoice_products_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `productos` (`id_product`),
  ADD CONSTRAINT `invoice_products_ibfk_2` FOREIGN KEY (`id_invoice`) REFERENCES `invoice` (`id_invoice`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
