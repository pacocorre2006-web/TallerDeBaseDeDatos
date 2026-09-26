USE TiendaVideojuegos;

INSERT INTO Videojuegos (nombre, plataforma, precio, stock, genero) VALUES
('Minecraft', 'PC', 599.90, 10, 'Aventura'),
('FIFA 25', 'PS5', 899.90, 5, 'Deportes'),
('GTA V', 'Xbox', 499.90, 8, 'Accion'),
('Cyberpunk 2077', 'PC', 599.00, 10, 'RPG'),
('Elden Ring', 'PS5', 899.00, 10, 'RPG'),
('The Legend of Zelda: Tears of the Kingdom', 'Nintendo Switch', 59.99, 15, 'Aventura');

UPDATE Videojuegos 
SET precio = 34.99 
WHERE id_videojuego = 2;

UPDATE Videojuegos 
SET precio = 54.99, stock = 20 
WHERE id_videojuego = 3;

UPDATE Videojuegos 
SET stock = stock + 5 
WHERE plataforma = 'Nintendo Switch';

DELETE FROM Videojuegos WHERE id_videojuego = 8;

CREATE TABLE prueba_delete (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

INSERT INTO prueba_delete (nombre) VALUES ('Registro A'), ('Registro B'), ('Registro C');

CREATE TABLE prueba_update (
    id INT AUTO_INCREMENT PRIMARY KEY,
    estado VARCHAR(20)
);

INSERT INTO prueba_update (estado) VALUES ('pendiente'), ('pendiente'), ('pendiente');

SELECT * FROM Videojuegos;
SELECT ROW_COUNT();
