CREATE DATABASE cleansupply;
USE cleansupply;


CREATE TABLE clientes (
  cliente_id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_cliente VARCHAR(120) NOT NULL,
  email VARCHAR(120),
  telefono VARCHAR(30)
);

CREATE TABLE productos (
  producto_id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_producto VARCHAR(120) NOT NULL,
  categoria VARCHAR(80),
  precio_unitario DECIMAL(10,2)
);

CREATE TABLE depositos (
  deposito_id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_deposito VARCHAR(120) NOT NULL,
  ciudad VARCHAR(80)
);

CREATE TABLE pedidos (
  pedido_id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  fecha_pedido DATE NOT NULL,
  estado VARCHAR(30),
  FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

CREATE TABLE detalle_pedidos (
  detalle_id INT AUTO_INCREMENT PRIMARY KEY,
  pedido_id INT NOT NULL,
  producto_id INT NOT NULL,
  cantidad INT NOT NULL,
  FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
  FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

CREATE TABLE inventario (
  deposito_id INT NOT NULL,
  producto_id INT NOT NULL,
  stock_disponible INT DEFAULT 0,
  stock_reservado INT DEFAULT 0,
  PRIMARY KEY (deposito_id, producto_id),
  FOREIGN KEY (deposito_id) REFERENCES depositos(deposito_id),
  FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

CREATE TABLE envios (
  envio_id INT AUTO_INCREMENT PRIMARY KEY,
  pedido_id INT UNIQUE,
  deposito_id INT,
  fecha_envio DATE,
  estado VARCHAR(30),
  FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
  FOREIGN KEY (deposito_id) REFERENCES depositos(deposito_id)
);
