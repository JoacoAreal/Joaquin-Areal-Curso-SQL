USE cleansupply;

-- =========================
-- Ajuste de AUTO_INCREMENT
-- =========================
ALTER TABLE clientes AUTO_INCREMENT = 1000;
ALTER TABLE productos AUTO_INCREMENT = 2000;
ALTER TABLE depositos AUTO_INCREMENT = 3000;
ALTER TABLE pedidos AUTO_INCREMENT = 4000;
ALTER TABLE detalle_pedidos AUTO_INCREMENT = 5000;
ALTER TABLE envios AUTO_INCREMENT = 6000;

-- =========================
-- CLIENTES (10)
-- =========================
INSERT INTO clientes (nombre_cliente, email, telefono) VALUES
('Carrefour', 'compras@carrefour.com', '1134567890'),
('Coto', 'abastecimiento@coto.com', '1145678901'),
('Dia', 'pedidos@dia.com', '1156789012'),
('Jumbo', 'compras@jumbo.com', '1167890123'),
('Disco', 'ventas@disco.com', '1178901234'),
('Makro', 'suministros@makro.com', '1189012345'),
('Vital', 'contacto@vital.com', '1190123456'),
('La Anonima', 'pedidos@laanonima.com', '1101234567'),
('Maxiconsumo', 'abastecimiento@maxiconsumo.com', '1112345678'),
('Changomas', 'compras@changomas.com', '1123456789');

-- =========================
-- PRODUCTOS (10)
-- =========================
INSERT INTO productos (nombre_producto, categoria, precio_unitario) VALUES
('Detergente Limon 500ml', 'Limpieza', 850.00),
('Lavandina 1L', 'Desinfeccion', 620.00),
('Jabon Liquido 900ml', 'Higiene', 1450.00),
('Desinfectante Floral 700ml', 'Desinfeccion', 980.00),
('Limpiador Multiuso 500ml', 'Limpieza', 1100.00),
('Suavizante 1L', 'Lavado', 1350.00),
('Shampoo 400ml', 'Higiene', 2100.00),
('Acondicionador 400ml', 'Higiene', 2150.00),
('Jabon en Polvo 800g', 'Lavado', 1750.00),
('Alcohol en Gel 250ml', 'Higiene', 900.00);

-- =========================
-- DEPOSITOS (3)
-- =========================
INSERT INTO depositos (nombre_deposito, ciudad) VALUES
('Deposito Buenos Aires', 'Buenos Aires'),
('Deposito Cordoba', 'Cordoba'),
('Deposito Rosario', 'Rosario');

-- =========================
-- PEDIDOS (10)
-- =========================
INSERT INTO pedidos (cliente_id, fecha_pedido, estado) VALUES
(1000, '2026-03-01', 'pendiente'),
(1001, '2026-03-02', 'preparacion'),
(1002, '2026-03-02', 'enviado'),
(1003, '2026-03-03', 'pendiente'),
(1004, '2026-03-04', 'preparacion'),
(1005, '2026-03-05', 'enviado'),
(1006, '2026-03-06', 'pendiente'),
(1007, '2026-03-07', 'preparacion'),
(1008, '2026-03-08', 'pendiente'),
(1009, '2026-03-09', 'enviado');

-- =========================
-- DETALLE_PEDIDOS (12)
-- =========================
INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad) VALUES
(4000, 2000, 10),
(4000, 2001, 8),
(4001, 2002, 6),
(4001, 2004, 4),
(4002, 2003, 12),
(4003, 2005, 5),
(4004, 2006, 7),
(4005, 2007, 3),
(4006, 2008, 9),
(4007, 2009, 15),
(4008, 2001, 11),
(4009, 2000, 20);

-- =========================
-- INVENTARIO (12)
-- =========================
INSERT INTO inventario (deposito_id, producto_id, stock_disponible, stock_reservado) VALUES
(3000, 2000, 120, 20),
(3000, 2001, 100, 15),
(3000, 2002, 80, 10),
(3000, 2003, 90, 12),
(3001, 2004, 110, 8),
(3001, 2005, 95, 5),
(3001, 2006, 70, 7),
(3001, 2007, 60, 3),
(3002, 2008, 130, 9),
(3002, 2009, 150, 15),
(3002, 2000, 75, 10),
(3001, 2001, 85, 11);

-- =========================
-- ENVIOS (7)
-- =========================
INSERT INTO envios (pedido_id, deposito_id, fecha_envio, estado) VALUES
(4001, 3000, '2026-03-03', 'despachado'),
(4002, 3000, '2026-03-03', 'entregado'),
(4004, 3001, '2026-03-05', 'despachado'),
(4005, 3001, '2026-03-06', 'entregado'),
(4007, 3002, '2026-03-08', 'despachado'),
(4009, 3002, '2026-03-10', 'entregado'),
(4003, 3000, '2026-03-04', 'despachado');