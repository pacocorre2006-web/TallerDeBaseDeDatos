# 🗄️ Práctica 04 — ¡MODIFIQUEMOS LOS DATOS SIN ROMPER LA BASE!

## 🧪 Experimento 1 — Insertar un registro

### 💭 Analiza

¿Qué registro agregaste?
Agregué el videojuego "The Legend of Zelda: Tears of the Kingdom" con plataforma "Nintendo Switch", precio de 59.99, un stock de 15 y género "Aventura".

¿Qué columnas especificaste?
Especificé explícitamente las columnas `nombre`, `plataforma`, `precio`, `stock` y `genero`.

¿Qué columnas omitiste?
Omití la columna`id_videojuego`.

¿Alguna columna utilizó `AUTO_INCREMENT`? 
Sí, la columna `id_videojuego`, la cual genera su valor numérico de forma automática e incremental en la tabla `Videojuegos`. 

¿Alguna columna utilizó `DEFAULT`?
En esta ocasión especificé el valor del stock de forma manual, pero la tabla tiene configurado un valor por defecto (`DEFAULT 10`) para el campo `stock` en caso de omitirlo.

¿Cómo comprobaste que el registro fue agregado?
Lo comprobé ejecutando una consulta de inspección mediante la instrucción `SELECT * FROM Videojuegos;`, visualizando el nuevo registro reflejado en la tabla.

## 🧪 Experimento 2 — PRIMARY KEY

### 💭 Responde

¿La operación fue aceptada? 
No, fue rechazada por el SGBD.

¿Qué ocurrió? 
Se generó un error indicando una entrada duplicada.

¿Qué constraint intervino? 
La restricción `PRIMARY KEY` (`id_videojuego`). 

¿Cómo identificaste el error? 
A través del mensaje de error de MariaDB que avisa sobre la clave duplicada.

¿Por qué la base rechazó el registro?
Porque la llave primaria exige que cada identificador sea único e irrepetible.

## 🧪 INSERT y NOT NULL

### 💭 Responde

¿Qué campo era obligatorio? 
El campo `nombre`. 

¿Qué mensaje mostró el SGBD? 
Un error indicando que el campo no puede ser nulo (Column 'nombre' cannot be null).

¿Por qué se rechazó el registro? 
Porque el campo tiene configurada la restricción `NOT NULL`.

¿Cómo podría corregirse?
Proporcionando un valor válido para el nombre en la instrucción `INSERT`.

## 🧪 INSERT y UNIQUE

### 💭 Responde

¿Qué valor intentaste duplicar?
El nombre "The Legend of Zelda: Tears of the Kingdom".

¿Qué constraint intervino? 
La restricción `UNIQUE` configurada en el campo `nombre`.

¿Qué problema evita?
Evita que existan registros duplicados con exactamente el mismo nombre de videojuego.

## 🧪 INSERT y DEFAULT

### 💭 Responde

¿Qué valor recibió el campo?
Recibió el valor `10`.

¿Quién proporcionó ese valor? 
El propio SGBD automáticamente.

¿Qué ventaja ofrece DEFAULT? Permite automatizar valores predeterminados cuando el usuario no los especifica al insertar datos.

## 🧪 Experimento 3 — Referencia inexistente

## 💭 Responde

¿Se aceptó? 
No, fue rechazada.

¿Por qué? 
Porque viola la integridad referencial.

¿Qué restricción intervino? 
La `FOREIGN KEY` de la tabla `Ventas` que referencia a `Videojuegos`. 

¿Por qué es importante que la referencia exista?
Para garantizar que no existan ventas registradas de videojuegos que no están dados de alta en el catálogo.
