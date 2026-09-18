CREATE DATABASE IF NOT EXISTS Tiendavideojuegos;
USE Tiendavideojuegos;

CREATE TABLE Videojuegos (
    id_videojuego INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    plataforma VARCHAR(50),
    precio DECIMAL(10,2),
    stock INT DEFAULT 10,
    genero VARCHAR(50),
    CONSTRAINT uc_nombre UNIQUE (nombre),
    CONSTRAINT chk_precio CHECK (precio >= 0)
);

CREATE TABLE Ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_videojuego INT,
    cantidad INT,
    fecha DATE,
    CONSTRAINT fk_ventas_videojuegos FOREIGN KEY (id_videojuego) 
        REFERENCES Videojuegos(id_videojuego)
);

