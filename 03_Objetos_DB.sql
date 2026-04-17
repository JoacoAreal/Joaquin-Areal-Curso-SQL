USE cleansupply;

-- =========================
-- 1. Vista de pedidos por cliente
-- =========================
CREATE VIEW vista_pedidos_clientes AS
SELECT
    p.pedido_id,
    p.fecha_pedido,
    p.estado,
    c.cliente_id,
    c.nombre_cliente,
    c.email,
    c.telefono
FROM pedidos p
JOIN clientes c
    ON p.cliente_id = c.cliente_id;

-- =========================
-- 2. Vista de detalle de pedidos
-- =========================
CREATE VIEW vista_detalle_pedidos AS
SELECT
    dp.detalle_id,
    dp.pedido_id,
    pr.producto_id,
    pr.nombre_producto,
    pr.categoria,
    pr.precio_unitario,
    dp.cantidad
FROM detalle_pedidos dp
JOIN productos pr
    ON dp.producto_id = pr.producto_id;

-- =========================
-- 3. Vista de inventario por deposito
-- =========================
CREATE VIEW vista_inventario_depositos AS
SELECT
    d.deposito_id,
    d.nombre_deposito,
    d.ciudad,
    p.producto_id,
    p.nombre_producto,
    i.stock_disponible,
    i.stock_reservado
FROM inventario i
JOIN depositos d
    ON i.deposito_id = d.deposito_id
JOIN productos p
    ON i.producto_id = p.producto_id;
    
  
  
  
  
  DELIMITER $$

-- =========================
-- 1. Funcion para calcular el total de un pedido
-- =========================
CREATE FUNCTION fn_total_pedido(p_id_pedido INT)
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE v_total DECIMAL(10,2);

    SELECT SUM(dp.cantidad * p.precio_unitario)
    INTO v_total
    FROM detalle_pedidos dp
    JOIN productos p
        ON dp.producto_id = p.producto_id
    WHERE dp.pedido_id = p_id_pedido;

    RETURN v_total;
END $$

-- =========================
-- 2. Funcion para calcular stock actual
-- =========================
CREATE FUNCTION fn_stock_actual(p_id_deposito INT, p_id_producto INT)
RETURNS INT
BEGIN
    DECLARE v_stock_actual INT;

    SELECT (stock_disponible - stock_reservado)
    INTO v_stock_actual
    FROM inventario
    WHERE deposito_id = p_id_deposito
      AND producto_id = p_id_producto;

    RETURN v_stock_actual;
END $$

DELIMITER ;





DELIMITER $$

-- =========================
-- 1. Procedure para crear un pedido
-- =========================
CREATE PROCEDURE sp_crear_pedido(
    IN p_cliente_id INT,
    IN p_fecha_pedido DATE,
    IN p_estado VARCHAR(30)
)
BEGIN
    INSERT INTO pedidos (cliente_id, fecha_pedido, estado)
    VALUES (p_cliente_id, p_fecha_pedido, p_estado);
END $$

-- =========================
-- 2. Procedure para registrar un envio
-- =========================
CREATE PROCEDURE sp_registrar_envio(
    IN p_pedido_id INT,
    IN p_deposito_id INT,
    IN p_fecha_envio DATE,
    IN p_estado VARCHAR(30)
)
BEGIN
    INSERT INTO envios (pedido_id, deposito_id, fecha_envio, estado)
    VALUES (p_pedido_id, p_deposito_id, p_fecha_envio, p_estado);
END $$

DELIMITER ;





DELIMITER $$

CREATE TRIGGER tr_estado_preparacion
AFTER INSERT ON detalle_pedidos
FOR EACH ROW
BEGIN
    UPDATE pedidos
    SET estado = 'preparacion'
    WHERE pedido_id = NEW.pedido_id;
END $$

CREATE TRIGGER tr_pedido_enviado
AFTER INSERT ON envios
FOR EACH ROW
BEGIN
    UPDATE pedidos
    SET estado = 'enviado'
    WHERE pedido_id = NEW.pedido_id;
END $$

DELIMITER ;










