SELECT * 
FROM Videojuegos;

SELECT nombre, plataforma, precio 
FROM Videojuegos;

SELECT nombre, plataforma, precio 
FROM Videojuegos 
WHERE plataforma = 'PS5';

SELECT * 
FROM Videojuegos 
WHERE nombre LIKE 'F%';

SELECT * 
FROM Videojuegos 
WHERE plataforma IN ('PS5', 'Xbox', 'PC');

SELECT nombre, precio 
FROM Videojuegos 
WHERE precio BETWEEN 30.00 AND 100.00;

SELECT * 
FROM Videojuegos 
WHERE genero IS NULL;

SELECT DISTINCT plataforma 
FROM Videojuegos;

SELECT * 
FROM Videojuegos 
WHERE plataforma = 'PS5' AND precio < 50.00;

SELECT * 
FROM Videojuegos 
WHERE plataforma = 'PC' OR plataforma = 'Xbox';

SELECT * 
FROM Videojuegos 
WHERE NOT plataforma = 'PS5';

SELECT nombre, genero, precio 
FROM Videojuegos 
WHERE genero = 'RPG' AND precio > 50.00 
ORDER BY precio DESC;
