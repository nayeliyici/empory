-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 04-03-2024 a las 08:03:22
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nombre`) VALUES
(1, 'camisas'),
(2, 'corbatas'),
(3, 'chalecos'),
(4, 'sacos'),
(5, 'pantalones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Clientes`
--

CREATE TABLE `Clientes` (
  `idClientes` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  `Contraseña` varchar(8) NOT NULL,
  `Roles_IDRoles` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Clientes`
--

INSERT INTO `Clientes` (`idClientes`, `Nombre`, `Email`, `Direccion`, `Telefono`, `Contraseña`, `Roles_IDRoles`) VALUES
(1, 'Admin', 'admin@gmail.com', 'Xoxocotlan', '9512263315', '1234', 1),
(2, 'Josue', 'josue@gmail.com', 'xoxocotlan', '9513114964', 'j1234', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Estados_pedido`
--

CREATE TABLE `Estados_pedido` (
  `IDEstados_pedido` int(11) NOT NULL,
  `Pedidos_IDPedidos` int(11) NOT NULL,
  `Pedidos_Clientes_idClientes` int(11) NOT NULL,
  `FECHA_SALIDA` date NOT NULL,
  `FECHA_ENTREGA` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Inventario`
--

CREATE TABLE `Inventario` (
  `IDInventario` int(11) NOT NULL,
  `StockInicial` int(11) NOT NULL,
  `StockActual` varchar(45) NOT NULL,
  `categoria_idcategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Inventario`
--

INSERT INTO `Inventario` (`IDInventario`, `StockInicial`, `StockActual`, `categoria_idcategoria`) VALUES
(1, 500, '5', 1),
(2, 500, '40', 2),
(3, 500, '90', 3),
(4, 500, '1', 4),
(5, 500, '1', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pedidos`
--

CREATE TABLE `Pedidos` (
  `IDPedidos` int(11) NOT NULL,
  `Fecha_pedido` date NOT NULL,
  `Fecha_entrega` date NOT NULL,
  `Clientes_idClientes` int(11) NOT NULL,
  `Productos_IDProductos` int(11) NOT NULL,
  `TOTAL` decimal(10,2) NOT NULL COMMENT 'Precio * .16\n',
  `SubTotal` decimal(10,2) NOT NULL COMMENT 'Cantidad de productos * precio\n',
  `Direccion` varchar(50) NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Productos`
--

CREATE TABLE `Productos` (
  `IDProductos` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `Imagen` varchar(40) DEFAULT NULL,
  `Material` varchar(40) DEFAULT NULL,
  `Color` varchar(40) DEFAULT NULL,
  `Talla` varchar(10) DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  `Comentarios` text NOT NULL,
  `Inventario_IDInventario` int(11) NOT NULL,
  `Categoria_IDCategoria` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Productos`
--

INSERT INTO `Productos` (`IDProductos`, `nombre`, `Imagen`, `Material`, `Color`, `Talla`, `Precio`, `Comentarios`, `Inventario_IDInventario`, `Categoria_IDCategoria`) VALUES
(1, 'Falda floreada', './images/cart/cart1.jpg', 'Algodón', 'Negro', 'M', '444.00', 'Todo viene muy bonito y en un excelente estado siempre encantada con lo que pido, una vez más cumpliendo mis expectativas', 1, 1),
(2, 'Vestido bordado', './images/cart/cart2.jpg', 'Tela', 'Amarillo', 'S', '80.00', 'Está muy bonita y se ve de buena calidades muy elegante, recomiendo el articulo tiene una mejor calidad y se nota a primera', 2, 2),
(3, 'Vestidp Bordado', './images/cart/cart3.jpg', 'Tela', 'Blanco', 'G', '511.00', 'Excelente calidad, lo pediría otra vez, la tela es gruesa y fresca ajusta bien', 5, 5),
(4, 'Camisa bordado derecho', './images/cart/cart4.jpg', 'algodon', 'negro', 'M', '3214.00', 'fwefwe', 5, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Roles`
--

CREATE TABLE `Roles` (
  `IDRoles` int(11) NOT NULL,
  `Rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Roles`
--

INSERT INTO `Roles` (`IDRoles`, `Rol`) VALUES
(1, 'Admin'),
(2, 'Invitado'),
(3, 'Registrado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`idClientes`),
  ADD KEY `fk_Clientes_Roles1_idx` (`Roles_IDRoles`);

--
-- Indices de la tabla `Estados_pedido`
--
ALTER TABLE `Estados_pedido`
  ADD PRIMARY KEY (`IDEstados_pedido`,`Pedidos_IDPedidos`,`Pedidos_Clientes_idClientes`),
  ADD KEY `fk_Estados_pedido_Pedidos1_idx` (`Pedidos_IDPedidos`,`Pedidos_Clientes_idClientes`);

--
-- Indices de la tabla `Inventario`
--
ALTER TABLE `Inventario`
  ADD PRIMARY KEY (`IDInventario`),
  ADD KEY `fk_Inventario_categoria1_idx` (`categoria_idcategoria`);

--
-- Indices de la tabla `Pedidos`
--
ALTER TABLE `Pedidos`
  ADD PRIMARY KEY (`IDPedidos`,`Clientes_idClientes`,`Productos_IDProductos`),
  ADD KEY `fk_Pedidos_Clientes_idx` (`Clientes_idClientes`),
  ADD KEY `fk_Pedidos_Productos1_idx` (`Productos_IDProductos`);

--
-- Indices de la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD PRIMARY KEY (`IDProductos`,`Inventario_IDInventario`);

--
-- Indices de la tabla `Roles`
--
ALTER TABLE `Roles`
  ADD PRIMARY KEY (`IDRoles`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Clientes`
--
ALTER TABLE `Clientes`
  ADD CONSTRAINT `fk_Clientes_Roles1` FOREIGN KEY (`Roles_IDRoles`) REFERENCES `Roles` (`IDRoles`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Estados_pedido`
--
ALTER TABLE `Estados_pedido`
  ADD CONSTRAINT `fk_Estados_pedido_Pedidos1` FOREIGN KEY (`Pedidos_IDPedidos`,`Pedidos_Clientes_idClientes`) REFERENCES `Pedidos` (`IDPedidos`, `Clientes_idClientes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Inventario`
--
ALTER TABLE `Inventario`
  ADD CONSTRAINT `fk_Inventario_categoria1` FOREIGN KEY (`categoria_idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Pedidos`
--
ALTER TABLE `Pedidos`
  ADD CONSTRAINT `fk_Pedidos_Clientes` FOREIGN KEY (`Clientes_idClientes`) REFERENCES `Clientes` (`idClientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pedidos_Productos1` FOREIGN KEY (`Productos_IDProductos`) REFERENCES `Productos` (`IDProductos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD CONSTRAINT `fk_Productos_Inventario1` FOREIGN KEY (`Inventario_IDInventario`) REFERENCES `Inventario` (`IDInventario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
